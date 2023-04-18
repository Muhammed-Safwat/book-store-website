document.addEventListener('DOMContentLoaded', function() {
  // Your code here
  console.log('Page loaded!');
  

});

// search 
console.log(document.querySelector('.search-btn'));
document.querySelector('.search-btn').addEventListener('click' , ()=>{
  let keyword =  document.querySelector(".search-input").value ;
  console.log(keyword);
  if(keyword.length!=0){
    window.location.href =`http://localhost:8086/BookStoreWebsite/search?key=${keyword}` ;
  }
});
 


let editBtn = document.querySelector('.edit-button');
let logoutPanel = document.querySelector('.logout-panel');
let overlay = document.querySelector('.overlay');
let cencelBtn = document.querySelector('.cencel-btn');
let okBtn = document.querySelector('.ok-btn');
 
console.log(logoutPanel);
console.log(overlay);
console.log(cencelBtn);
console.log(okBtn);
// logout 
// log out button 

document.querySelector('.logout').addEventListener('click',(e) => {
  e.preventDefault();
  overlay.classList.remove('none');
  logoutPanel.classList.remove('none');
  document.body.style.overflow= "hidden";
})

const removeMenu = function(){
  logoutPanel.classList.add('none');
  overlay.classList.add('none');
  document.body.style.overflow= "scroll";
}

okBtn.addEventListener('click'  , ()=>{
  removeMenu();
  window.location.href =`http://localhost:8086/BookStoreWebsite/admin/logout` ;
});

overlay.addEventListener('click'  , removeMenu);
cencelBtn.addEventListener('click' ,removeMenu);

document.querySelector('.scroll-up').addEventListener('click', function() {
  window.scrollTo({ top: 0, behavior: 'smooth' });
});







