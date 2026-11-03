def pytest_configure(config):
    config.addinivalue_line(
        "markers",
        "slow: rebuilds the published tables from source; needs PIPELINE_REGEN=1",
    )
