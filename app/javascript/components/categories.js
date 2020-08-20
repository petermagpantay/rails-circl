import $ from "jquery"

const initTags = () => {
  const grid = document.querySelector('.grid');

  if(grid){

    console.log(grid)
    const iso = new Isotope( grid, {
      itemSelector: '.element-item'
    });
    console.log(iso)

    const filterFns = {
      // show if number is greater than 50
      ium: function( itemElem ) {
        console.log(itemElem)
        const name = itemElem.querySelector('.name').textContent;
        return name.match( /ium$/ );
      }
    };

    const filtersElem = document.querySelector('.filter-buttons-group');
    console.log(filtersElem)
    filtersElem.addEventListener( 'click', function( event ) {
      // only work with buttons
      console.log(event.target)
      // if ( !matchesSelector( event.target, 'grid-item' ) ) {
      //   console.log("stopping")
      //   return;
      // }

      const filterValue = event.target.parentElement.getAttribute('data-filter');
      // use matching filter function
      console.log(filterValue)
      filterValue = filterFns[ filterValue ] || filterValue;
      iso.arrange({ filter: filterValue });
    });

  }
}

export{initTags}
