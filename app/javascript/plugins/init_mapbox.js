import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');


  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    // criar o nosso estilo de mapa
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/rafaelalonso42/ckealc00l03ck19o0ia0x2tk9'
    });

     map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));
        // parte de adicionar os markers no nosso map
         const markers = JSON.parse(mapElement.dataset.markers);
         markers.forEach((marker) => {
           // create a Popup for the marker, with the HTML stored in infoWindow
           const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

           // Create a HTML element for your custom marker
           const element = document.createElement('div');
           element.className = 'marker';
           element.style.backgroundImage = `url('${marker.image_url}')`;
           element.style.backgroundSize = 'contain';
           element.style.width = '25px';
           element.style.height = '30px';

           new mapboxgl.Marker(element)             // create the marker
             .setLngLat([ marker.lng, marker.lat ]) // where it's located
             .setPopup(popup)                       // set the Popup
             .addTo(map);                           // insert it in the map
         });

         // centraliza o mapa nos meus markers
         fitMapToMarkers(map, markers);
       }
     };

     export { initMapbox };
