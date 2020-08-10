import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
    const mapElement = document.getElementById('map');
  
    if (mapElement) { // only build a map if there's a div#map to inject into
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/paul0711/ckdom0eaz25in1ip6rwcdvpvf',
        center: [11.560347, 48.146782],
        zoom: 7.5
      });
    }
  };

export { initMapbox };