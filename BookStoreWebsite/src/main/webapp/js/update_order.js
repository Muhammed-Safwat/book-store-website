

let overlay = document.querySelector('.overlay');
let cencelBtn = document.querySelector('.cencel-btn');
let BookForm = document.querySelector('.book-form');

document.querySelector('.addNewBookLink').addEventListener('click',(e)=>{
    e.preventDefault();
    overlay.classList.add('add-panale');
    BookForm.classList.add('add-panale');
    document.body.style.overflow= "hidden";
});

let remvoePanel = ()=>{
  console.log("rmove")
  overlay.classList.remove('add-panale');
  BookForm.classList.remove('add-panale');
  document.body.style.overflow= "scroll";
}


document.querySelector('.edit-table').addEventListener('click' , (e)=>{
  e.preventDefault();
  if(e.target.classList.contains('remove-link')){
    let form = e.target.closest('.book-data').querySelector('form'); 
  	form.submit();
  }
});

document.querySelector('.edit-table').addEventListener('change' , (e)=>{
  e.preventDefault();
  if(e.target.classList.contains('book-quantity')){
    let form = e.target.closest('.quantities').querySelector('form'); 
  	form.submit();
    console.log(form);
    console.log(inputs)
  }
});

document.querySelector('.submit-button').addEventListener("click" , ()=>{
  document.querySelector('form.update-order-from').submit();
});

overlay?.addEventListener('click'  , remvoePanel);
cencelBtn?.addEventListener('click' , remvoePanel);


