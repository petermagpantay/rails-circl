var places = require('places.js');
const domElement = document.querySelector('#address-input');

 const initPlaces = () => {
    const domElement = document.querySelector('#address-input');
     if (domElement) {
        places({
            appId: 'pl2J83Z7W10I',
            apiKey: 'f5364b7cdf5bcc8d04dd9692e8bf41f9',
            container: domElement,
            cssClasses: {
            root: 'ais-search-box-custom',
        },
        });
     }
     
 };

 export { initPlaces }