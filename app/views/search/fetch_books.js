function populateModal() {
  const modalBody = document.getElementById('fetched-books-modal-body');
  modalBody.innerHTML = '<%= j render "search/list" %>';
  // modalBody.innerHTML = '<%= j render 'search/fetched_list', top_3: @top_3 %>';
  // modalBody.innerHTML = '<%= j render(partial: "search/fetched_list") %>';
  // modalBody.insertAdjacentHTML('beforeend', '<%= j render "search/fetched_list", top_3: @top_3 %>');
}


populateModal();


