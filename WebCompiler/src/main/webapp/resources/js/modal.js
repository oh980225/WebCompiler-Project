const openBtn = document.getElementById("open");
const modal = document.querySelector(".modal");
const infomodal = document.querySelector(".infomodal");

const overlay = modal.querySelector(".modal_overlay");
const info_overlay = document.querySelector(".infomodal_overlay");

const closeBtn = modal.querySelector(".close");
const info_closeBtn = modal.querySelector(".infomodal_close");

const openModal = () => {
	infomodal.classList.remove("hidden");
}

const closeModal = () => {
	infomodal.classList.add("hidden");
}


const open_infoModal = () => {
	infomodal.classList.remove("hidden");
}

const close_infoModal = () => {
	infomodal.classList.add("hidden");
}
	
	
overlay.addEventListener("click", closeModal);
info_overlay.addEventListener("click", close_infoModal);

closeBtn.addEventListener("click", closeModal);

openBtn.addEventListener("click", openModal);
//modal_ok.addEventListener("click", closeModal);
