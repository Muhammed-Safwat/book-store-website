

const submitBtn = document.querySelector(".form_button .submitBtn ").addEventListener('click' , (e)=>{
  const pass = document.getElementById('password').value;
  const conPass = document.getElementById('confirm-password').value;
  if(pass === conPass) {
    document.querySelector(".error-passward").classList.add("hidden")
      e.target.closest("form").submit();
  }else {
    document.querySelector(".error-passward").classList.remove("hidden");
    e.preventDefault();
  }
});