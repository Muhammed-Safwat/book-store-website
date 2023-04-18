console.log('swwelkrfslkdf,jsakl;d,fj;salkdj,fklasj,dfklasdj,fkl');


document.querySelector(".shopping-cart-container .card").addEventListener('click' , (e)=>{
  e.preventDefault();
   if(e.target.classList.contains('delete-cartItem')){
    e.target.closest('.delete-cartItem-form').submit();
    console.log('bb');
  }
});
/*
document.querySelector(".shopping-cart-container .card").addEventListener('change' , (e)=>{
   
  if(e.target.classList.contains("update-cart")) {
    let form = e.target.closest('.update-cart-form');
    if(e.target.value<=0){
     form.action='delete-item';
   }
   form.submit();
   console.log('aa');
  }
});*/


document.querySelector(".shopping-cart-container .card").addEventListener('click' , (e)=>{
  let form = e.target.closest('.update-cart-form');
  if(form!==null){
    let value = form.querySelector(".quantity-form-select").value;
    if(e.target.classList.contains("sub")){
      if(value>1){
        value--;
        console.log('sub');
        form.querySelector('.quntity').textContent=value;
        form.querySelector(".quantity-form-select").value=value;
        form.submit(); 
      }else{
        return ;
      }
    }else if(e.target.classList.contains("add")){
      value++; 
      form.querySelector('.quntity').textContent=value;
      form.querySelector(".quantity-form-select").value=value;
      form.submit();
    }
  }
});

 