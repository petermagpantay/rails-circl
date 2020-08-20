const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-circl');

  if (navbar) {
    window.addEventListener('scroll', () => {
      console.log(window.innerHeight + 100 )
      if (window.scrollY >= window.innerHeight - 600 ) {
        navbar.classList.add('navbar-circl-white');
      } else {
        navbar.classList.remove('navbar-circl-white');
      }
    });

  }
}

export { initUpdateNavbarOnScroll };
