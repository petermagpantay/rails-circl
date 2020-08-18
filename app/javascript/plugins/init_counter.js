import anime from 'animejs/lib/anime.es.js';

const initCounter = () => {

    anime({
        targets: '#about-user',
        value: [0, 6285],
        round: 1,
        easing: 'easeInOutExpo',
        duration: 2000
      });

      anime({
        targets: '#about-events',
        value: [0, 4720],
        round: 1,
        easing: 'easeInOutExpo',
        duration: 2000
      });

      anime({
        targets: '#about-friendships',
        value: [0, 2061],
        round: 1,
        easing: 'easeInOutExpo',
        duration: 2000
      });
}

export { initCounter }