import {Helper}  from './helper.js';
class CategoryList extends Helper {
  
 handleForm(){
   this.parent.addEventListener('click', (e) =>{
     e.preventDefault(); 
     this.form = e.target.closest("form");
     if(e.target.classList.contains("delete-button")){
   let id = this.form.querySelector('input').value;
       this._showPanel(id);
     }else if(e.target.classList.contains("edit-button")) {
       this.form.action='edit_category';
       this.form.method="post";
        this.form.submit();
     }
   });
   
   this.okBtn.addEventListener('click' , ()=>{
     this.form.action='delete_category';
     this.form.method='post';
     this._removePanel();
     this.form.submit();
   });
 }
}

const obj = new CategoryList();
obj.setMapping("list_category");
obj.handleForm();


/*
let table = document.querySelector('table tbody');
let deleteUser = document.querySelector('.delete-user');
let overlay = document.querySelector('.overlay');
let cencelBtn = document.querySelector('.cencel-btn');
let okBtn = document.querySelector('.ok-btn');
let deleteKey = false ;
let id = 0 ; 
// console.log(table);

table.addEventListener('click', (e)=>{
  e.preventDefault();
  id = e.target.closest('tr').querySelector('.user-id').textContent;
 console.log(id.textContent);
  if(e.target.classList.contains("delete-button")){
    deleteUser.querySelector('.id').textContent=id;
    deleteUser.classList.remove('none');
    overlay.classList.remove('none');
    document.body.style.overflow= "hidden";
  }else if(e.target.classList.contains("edit_category")) {
    console.log("EDIIT EVENT");
    window.location.href = `http://localhost:8086/BookStoreWebsite/admin/edit_category?id=${id}`  ;
  }
});


const removeMenu = function(){
  deleteUser.classList.add('none');
  overlay.classList.add('none');
  document.body.style.overflow= "scroll";
}
okBtn.addEventListener('click'  , ()=>{
  removeMenu();
  window.location.href =`http://localhost:8086/BookStoreWebsite/admin/delete_category?id=${id}` ;
});
overlay.addEventListener('click'  , removeMenu);
cencelBtn.addEventListener('click' ,removeMenu);*/