import $ from "jquery"

const initTags = () => {
  var elem = document.querySelector('.grid');
var iso = new Isotope( elem, {
  // options
  itemSelector: '.grid-item',
  layoutMode: 'fitRows'
});
}

export{initTags}
