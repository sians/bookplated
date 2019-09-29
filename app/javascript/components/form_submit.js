const submitQuoteForm = () => {
  document.querySelector(".simple_form.quote").submit();
}

const submitNoteForm = () => {
  tinyMCE.triggerSave();
  document.querySelector(".simple_form.note").submit();
}

export { submitQuoteForm, submitNoteForm };
