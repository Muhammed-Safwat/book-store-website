console.log('swwelkrfslkdf,jsakl;d,fj;salkdj,fklasj,dfklasdj,fkl');


document.querySelector(".shopping-cart-container").addEventListener('click' , (e)=>{
  e.preventDefault();
   if(e.target.classList.contains('delete-cartItem')){
    e.target.closest('.delete-cartItem-form').submit();
    console.log('bb');
  }
});

document.querySelector(".shopping-cart-container").addEventListener('change' , (e)=>{
   
  if(e.target.classList.contains("update-cart")) {
    let form = e.target.closest('.update-cart-form');
    if(e.target.value<=0){
     form.action='delete-item';
   }
   form.submit();
   console.log('aa');
  }
});


 