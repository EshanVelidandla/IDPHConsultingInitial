// Stands in for react-leaflet so MapView can render without a real map. The
// test only needs the style function MapView hands to the GeoJSON layer.
export const MapContainer = ({ children }) => children;
export const useMap = () => ({ invalidateSize() {}, fitBounds() {} });
export const GeoJSON = ({ style }) => { globalThis.__mapStyle = style; return null; };
