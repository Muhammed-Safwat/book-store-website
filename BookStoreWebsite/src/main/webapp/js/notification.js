
let massage = document.querySelector(".error-message");
if(massage!==null){
  setTimeout(() => {
    massage.classList.remove("hidden");
  } , 300);
  setTimeout(() => {
    massage.classList.add("hidden");
  } , 4000);
}
