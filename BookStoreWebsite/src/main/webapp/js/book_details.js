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
});

document.querySelector('.shopping-cart-container').addEventListener('click', (e)=>{
  e.preventDefault();  
  if(e.target.classList.contains("wish")){
      addToWishList(e);
    }else if(e.target.classList.contains("addToCart")){
      e.target.closest('.cart-form').submit();
    }
})

function addToWishList(e){
    let formContiner = e.target.closest('.cart-form');
    let wishBtn  = formContiner.querySelector('.wish');
    const icon = wishBtn.querySelector("i");
    let cartObj = {
      id : formContiner.querySelector('.hidden_id').value,
    }
    const parsed =  JSON.stringify(cartObj);
    fetch('add_wishlist_book',{
      method: 'POST',
      headers: {
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: parsed,
    }).then(res=>{
      if(res.ok){
        updateView(icon)
      }
    });
}

function updateView(icon){
  icon.classList.toggle("save");
  icon.classList.toggle("fa-regular");
  icon.classList.toggle("fa");
  let num = document.querySelector('.header-wishlist .number');
  const message = document.querySelector(".error-message");
  message.textContent='';
  if(icon.classList.contains("save")){
    num.textContent = Number.parseInt(num.textContent)+1;  
    message.insertAdjacentHTML('afterbegin',`<i class="fav fa-heart save fa"></i><span>Book added to wishlist</span>`);
  }else {
    num.textContent = Number.parseInt(num.textContent)-1;
    message.insertAdjacentHTML('afterbegin',`<i class="error fa-regular fa-circle-xmark"></i><span>Book removed from wishlist</span>`);
  }
  message.classList.remove("hidden");
  setTimeout(() => {
    message.classList.add("hidden");
  } , 4000);
}
 
