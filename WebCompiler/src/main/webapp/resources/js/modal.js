const openBtn = document.getElementById("open");
const modal = document.querySelector(".modal");
const overlay = modal.querySelector(".modal_overlay");
const closeBtn = modal.querySelector(".close");


const infomodal = document.querySelector(".infomodal");
const info_overlay = document.querySelector(".infomodal_overlay");
const info_closeBtn = modal.querySelector(".infomodal_close");

const openModal = () => {
	modal.classList.remove("hidden");
}

const closeModal = () => {
	modal.classList.add("hidden");
}


const open_infoModal = () => {
	infomodal.classList.remove("hidden");
}

const close_infoModal = () => {
	infomodal.classList.add("hidden");
}
	
	
overlay.addEventListener("click", closeModal);
closeBtn.addEventListener("click", closeModal);
openBtn.addEventListener("click", openModal);

info_overlay.addEventListener("click", close_infoModal);


//modal_ok.addEventListener("click", closeModal);
