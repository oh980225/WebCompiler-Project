function changeName() {
		  const buttonName = document.querySelector(".btn_name");
		  const userName = document.querySelector("#user_name");
		  const currentName = userName.innerText;
		  const nameInput = document.querySelector("#input_name");

		  if(buttonName.innerText == "닉네임 변경") {
		    buttonName.innerText = "변경하기";
		    nameInput.style.display = 'block';
		    userName.style.display = 'none';
		    nameInput.value = currentName;
		    console.log("gi");
		  }  else {
		    buttonName.innerText = "닉네임 변경";
		    nameInput.style.display = 'none';
		    userName.style.display = 'block';
		    document.getElementById('name_form').submit(); 
		  }

}

		function changeIntroduce() {
		  const buttonIntroduce = document.querySelector(".btn_introduce");
		  const userIntroduce = document.querySelector("#user_introduce");
		  const currentIntroduce = userIntroduce.innerText;
		  const introduceInput = document.querySelector("#input_introduce");

		  if(buttonIntroduce.innerText == "소개 변경") {
		    buttonIntroduce.innerText = "변경하기";
		    introduceInput.style.display = 'block';
		    userIntroduce.style.display = 'none';
		    introduceInput.value = currentIntroduce;
		  }  else {
		    buttonIntroduce.innerText = "소개 변경";
		    introduceInput.style.display = 'none';
		    userIntroduce.style.display = 'block';
		  }

		}