import "bootstrap";

import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';
import { barchart } from '../components/barchart';
import { coverEdit } from '../components/book_show';

initSelect2();

// checking if it's the stats page!
const stats = document.querySelector(".stats-container");
// if it's the stats page, load loads of charts woo!
if (stats) {
  barchart();
}

// checking if it's the book#show page!
const show = document.querySelector(".show-container")
if (show) {
  coverEdit();
}
