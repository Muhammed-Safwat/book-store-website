

let editBtn = document.querySelector('.edit-book');
let deleteBtn = document.querySelector('.delete-book');
let logoutPanel = document.querySelector('.logout-panel');
let overlay = document.querySelector('.overlay');
let cencelBtn = document.querySelector('.cencel-btn');
let okBtn = document.querySelector('.ok-btn');
let table = document.querySelector('table');
let deletePanel = document.querySelector('.delete');
/*
  console.log(table);
  console.log(logoutPanel);
  console.log(overlay);
  console.log(editBtn);
  console.log(deleteBtn); 
  console.log(deletePanel); 
*/
let id  ; 

table.addEventListener('click', (e)=>{
  e.preventDefault();
  id = e.target.closest('tr').dataset.bookId; // .dataset.bookId ; 
  if(e.target.classList.contains("delete-book")){
    deletePanel.querySelector(".id").textContent=id;
    deletePanel.classList.remove('none');
    overlay.classList.remove('none');
    document.body.style.overflow= "hidden";
  }else if(e.target.classList.contains("edit-book")) {
    console.log("EDIIT EVENT");
    window.location.href = `http://localhost:8086/BookStoreWebsite/admin/edit_book?id=${id}`  ;
  } 
});


const removeMenu = function(){
  deletePanel.classList.add('none');
  overlay.classList.add('none');
  document.body.style.overflow= "scroll";
}

okBtn.addEventListener('click'  , ()=>{
  removeMenu();
  window.location.href =`http://localhost:8086/BookStoreWebsite/admin/delete_book?id=${id}` ;
});

overlay.addEventListener('click'  , removeMenu);
cencelBtn.addEventListener('click' ,removeMenu);