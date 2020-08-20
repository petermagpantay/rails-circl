import anime from 'animejs/lib/anime.es.js';

const initCounter = () => {

    anime({
        targets: '#about-user',
        value: [0, 628],
        round: 1,
        easing: 'easeInOutExpo',
        duration: 2000
      });

      anime({
        targets: '#about-events',
        value: [0, 472],
        round: 1,
        easing: 'easeInOutExpo',
        duration: 2000
      });

      anime({
        targets: '#about-friendships',
        value: [0, 206],
        round: 1,
        easing: 'easeInOutExpo',
        duration: 2000
      });
}

export { initCounter }
