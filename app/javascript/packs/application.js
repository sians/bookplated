import "bootstrap";

import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';
import { barchart } from '../components/barchart';
import { coverEdit } from '../components/book_show';
import { submitQuoteForm, submitNoteForm } from '../components/form_submit';
import { initTiny } from '../components/tinymce';

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

  // adding handler to form in modal for QUOTE submit
  const quoteSubmitBtn = document.querySelector(".quote-submit")
  quoteSubmitBtn.addEventListener("click", submitQuoteForm)
  // adding handler to form in modal for NOTE submit
  const noteSubmitBtn = document.querySelector(".note-submit")
  noteSubmitBtn.addEventListener("click", submitNoteForm)

  // only initialize TinyMCE on pill click
  const noteTabBtn = document.querySelector("#notes-tab-plus")
  noteTabBtn.addEventListener("click", initTiny)
}

