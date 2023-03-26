let btn  = document.querySelector(".quntity-button");

btn.addEventListener("click" , (e)=>{
  let value = document.querySelector('.quntity').textContent;
  if(e.target.classList.contains("sub")){
    if(value>1){
      value--;
    }
  }else if(e.target.classList.contains("add")){
    value++;
  }
  document.querySelector('.quntity').textContent=value;
  document.querySelector("#quantity").value=value;
})