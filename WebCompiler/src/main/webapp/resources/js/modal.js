const openBtn = document.getElementById("open");
const modal = document.querySelector(".modal");
const overlay = modal.querySelector(".modal_overlay");
const closeBtn = modal.querySelector(".close");
//const modalTable = document.querySelectorAll(".row");

const openModal = () => {
  let modal = document.querySelector(".${}");
  modal.classList.remove("hidden");
}

const closeModal = () => {
  let modal = document.querySelector(".modal");
  modal.classList.add("hidden");
}

overlay.addEventListener("click", closeModal);
closeBtn.addEventListener("click", closeModal);
openBtn.addEventListener("click", openModal);

//const modalCell1 = document.getElementById("1");
//const modalCell2 = document.getElementById("2");
//const modalCell3 = document.getElementById("3");
/*
const selectCell = (event) => {
  let id = event.currentTarget.id;
  for(let i=0; i < modalTable.length; i++) {
    let item = modalTable.item(i);
    item.style.background = 'transparent';
    item.style.color = 'black';
  }
  let selectId = document.getElementById(id);
  selectId.style.background = 'rgb(231, 251, 255)';
  selectId.style.color = 'rgb(46, 173, 179)';
}
*/

//modalCell1.addEventListener("click", selectCell);
//modalCell2.addEventListener("click", selectCell);
//modalCell3.addEventListener("click", selectCell);
