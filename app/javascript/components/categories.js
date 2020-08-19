import $ from "jquery"

const initTags = () => {
  var grid = document.querySelector('.grid');
  console.log(grid)
  var iso = new Isotope( grid, {
    // options...
    itemSelector: '.element-item'
  });
  console.log(iso)

  var filterFns = {
    // show if number is greater than 50
    ium: function( itemElem ) {
      console.log(itemElem)
      var name = itemElem.querySelector('.name').textContent;
      return name.match( /ium$/ );
    }
  };

  var filtersElem = document.querySelector('.filter-buttons-group');
  console.log(filtersElem)
  filtersElem.addEventListener( 'click', function( event ) {
    // only work with buttons
    console.log(event.target)
    // if ( !matchesSelector( event.target, 'grid-item' ) ) {
    //   console.log("stopping")
    //   return;
    // }

    var filterValue = event.target.parentElement.getAttribute('data-filter');
    // use matching filter function
    console.log(filterValue)
    filterValue = filterFns[ filterValue ] || filterValue;
    iso.arrange({ filter: filterValue });
  });
}

export{initTags}
