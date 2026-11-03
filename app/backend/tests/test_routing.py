"""
Routing regression tests for the single-origin deployment.

Two bugs motivated these, both of which only appear in the production build
where the SPA and the API share an origin:

  1. The SPA catch-all answered unknown API paths with index.html and a 200.
     A misconfigured API_BASE therefore sent every request to /api/*, received
     HTML, and rendered empty panels instead of failing.
  2. Fixing that by refusing anything whose first path segment looked like an
     API prefix broke /admin, which is both a client route and an API
     namespace, so a page load on /admin returned a JSON 404.

Run: python -m pytest app/backend/tests -q
"""

import os
import sys

import pytest
from fastapi import FastAPI
from fastapi.testclient import TestClient

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import main  # noqa: E402

client = TestClient(main.app)

BROWSER = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
XHR = {"accept": "application/json, text/plain, */*"}

# Every route declared in frontend/src/App.tsx.
SPA_ROUTES = [
    "/", "/map", "/insights", "/scorecard", "/priority", "/pulse", "/providers",
    "/access", "/admin", "/county/DuPage", "/county/Jo%20Daviess",
]

API_ROUTES = [
    "/health", "/meta", "/population", "/provider_summary", "/annotations",
    "/thresholds", "/presets", "/admin/datasets", "/admin/users",
    "/admin/audit?limit=2", "/death_rates?cause=Total_Deaths",
    "/provider_data?metric=hpsa_primary_care_designation",
]


@pytest.mark.skipif(not os.path.isfile(main._index), reason="UI not built")
@pytest.mark.parametrize("route", SPA_ROUTES)
def test_client_routes_serve_the_app(route):
    """A page load or refresh on a client route must return the SPA shell."""
    r = client.get(route, headers=BROWSER)
    assert r.status_code == 200, route
    assert "text/html" in r.headers["content-type"]
    assert 'id="root"' in r.text


@pytest.mark.parametrize("route", API_ROUTES)
def test_api_routes_answer(route):
    r = client.get(route, headers=XHR)
    assert r.status_code == 200, f"{route} -> {r.status_code}"


@pytest.mark.parametrize("route", ["/api/meta", "/api/annotations", "/api/"])
def test_api_prefix_always_refused(route):
    """
    Nothing lives under /api. It must 404 for a browser too, so a bad
    VITE_API_BASE cannot be answered with the page itself.
    """
    assert client.get(route, headers=XHR).status_code == 404
    assert client.get(route, headers=BROWSER).status_code == 404


@pytest.mark.parametrize("route", ["/admin/nonexistent", "/totally-unknown", "/meta/extra"])
def test_unknown_paths_404_for_an_xhr(route):
    """An XHR asking for JSON must never be handed HTML with a 200."""
    r = client.get(route, headers=XHR)
    assert r.status_code == 404, f"{route} -> {r.status_code} {r.headers.get('content-type')}"


@pytest.mark.parametrize("method", ["post", "put", "patch", "delete"])
@pytest.mark.parametrize("headers", [XHR, BROWSER])
@pytest.mark.parametrize("route", ["/nope", "/admin/nope", "/map"])
def test_other_methods_on_a_path_with_no_api_route_are_404(method, headers, route):
    """The catch-all used to be GET-only, which made these 405."""
    r = getattr(client, method)(route, headers=headers)
    assert r.status_code == 404, f"{method} {route} -> {r.status_code}"


def test_wrong_method_on_a_real_api_path_stays_405():
    r = client.delete("/meta", headers=XHR)
    assert r.status_code == 405
    assert "GET" in r.headers["allow"]


def test_head_on_a_real_api_path_stays_405():
    assert client.head("/meta", headers=XHR).status_code == 405


def test_unknown_browser_path_gets_the_shell_for_the_client_not_found(tmp_path, monkeypatch):
    """The client's * route renders the not-found page, so the shell must load."""
    index = tmp_path / "index.html"
    index.write_text('<div id="root"></div>', encoding="utf-8")
    monkeypatch.setattr(main, "_index", str(index))
    r = client.get("/nope", headers=BROWSER)
    assert r.status_code == 200 and 'id="root"' in r.text
    assert client.head("/map", headers=BROWSER).status_code == 200


def test_ui_directory_without_assets_does_not_crash(tmp_path):
    """StaticFiles raised RuntimeError here, which stopped the API importing."""
    target = FastAPI()
    assert main._mount_ui_assets(target, str(tmp_path)) is False
    assert not [r for r in target.routes if getattr(r, "name", "") == "assets"]


def test_ui_directory_with_assets_is_mounted(tmp_path):
    (tmp_path / "assets").mkdir()
    target = FastAPI()
    assert main._mount_ui_assets(target, str(tmp_path)) is True
    assert [r for r in target.routes if getattr(r, "name", "") == "assets"]


def test_admin_is_both_a_client_route_and_an_api_namespace():
    """The regression that broke the admin page."""
    if os.path.isfile(main._index):
        page = client.get("/admin", headers=BROWSER)
        assert page.status_code == 200 and 'id="root"' in page.text
    assert client.get("/admin/datasets", headers=XHR).status_code == 200
    assert client.get("/admin/nope", headers=XHR).status_code == 404


@pytest.mark.skipif(not os.path.isfile(main._index), reason="UI not built")
def test_plain_health_check_on_root_still_works():
    """A load balancer hitting / with no Accept header must not get a 404."""
    assert client.get("/").status_code == 200
