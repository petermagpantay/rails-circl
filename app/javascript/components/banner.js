import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Sport ^500", "Culture ^500", "Party ^500", "Travel ^500", "Drinking ^500", "Hanging out ^500", "Adventure ^500"],
    typeSpeed: 100,
    loop: true,
    backSpeed: 50
  });
}

export { loadDynamicBannerText };