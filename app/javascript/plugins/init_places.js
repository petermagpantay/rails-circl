var places = require('places.js');
const domElement = document.querySelector('#address-input');

 const initPlaces = () => {
    const domElement = document.querySelector('#address-input');
     if (domElement) {
        places({
            appId: 'pl2J83Z7W10I',
            apiKey: 'dc5dd7b9c7247933b703fad3bd161b31',
            container: domElement,
            cssClasses: {
            root: 'ais-search-box-custom',
        },
        });
     }
     
 };

 export { initPlaces }