
const coverEdit = () => {
  const coverContainer = document.querySelector(".book-cover-container")
  const coverImg = document.querySelector(".book-cover")
  const edit = document.querySelector(".edit-cover")
  coverContainer.addEventListener("mouseover", event => {
    coverImg.style.transition = "opacity 0.5s linear 0s";
    coverImg.style.opacity = 0.2;
    edit.setAttribute("style", "display: block")
  })
  coverContainer.addEventListener("mouseout", event => {
    coverImg.style.transition = "opacity 0.5s linear 0s";
    coverImg.style.opacity = 1;
    edit.setAttribute("style", "display: none")
  })
}


export { coverEdit };
