import { CountUp } from './js/countUp.min.js';

window.onload = function() {
  var countUp = new CountUp('#test', 2000);
  countUp.start();
}