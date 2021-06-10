import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById('banner-typed-text')) {

    new Typed('#banner-typed-text', {
      strings: ["Cut the food waste!", "Save the Rango!"],
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };