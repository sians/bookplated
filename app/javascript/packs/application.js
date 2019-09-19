import "bootstrap";

import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';
import { barchart } from '../components/barchart';

initSelect2();

const stats = document.querySelector(".stats-container");
if (stats) {
  barchart();
}


