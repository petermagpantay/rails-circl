import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
    const mapElement = document.getElementById('map');

    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 });
    };

    if (mapElement) { // only build a map if there's a div#map to inject into
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/paul0711/cke1diqy80skq19n3abs0s918',
      });

      const markers = JSON.parse(mapElement.dataset.markers);
      console.log(markers);
      markers.forEach((marker) => {
        console.log(`url('${marker.image_url}')`);
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '40px';
        element.style.height = '40px';

        new mapboxgl.Marker(element)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
      });



      fitMapToMarkers(map, markers);
      map.addControl(new mapboxgl.NavigationControl());

      map.addControl(
        new mapboxgl.GeolocateControl({
          positionOptions: {
            enableHighAccuracy: true
          },
          showUserLocation: true,
          showAccuracyCircle: false
          })
        );

    }

  };

export { initMapbox };
