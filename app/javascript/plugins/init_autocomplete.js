import places from 'places.js';

const initAutobiz = () => {
  const addressInput = document.getElementById('query');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutobiz };