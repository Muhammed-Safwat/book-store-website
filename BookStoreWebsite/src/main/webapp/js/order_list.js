import {Helper}  from './helper.js';
class OrderList extends Helper {
  
 handleForm(){
   this.parent.addEventListener('click', (e) =>{
     e.preventDefault(); 
     this.form = e.target.closest("form");
     if(e.target.classList.contains("delete-button")){
        let id = this.form.querySelector('input').value;
        this._showPanel(id);
     }else if(e.target.classList.contains("edit-button")) {
       this.form.action='edit_order';
       this.form.method="post";
        this.form.submit();
     }else if(e.target.classList.contains("detail-button")){
       this.form.action='order_detail';
       this.form.method="post";
       this.form.submit();
     }
   });
   
   this.okBtn.addEventListener('click' , ()=>{
     this.form.action='delete_order';
     this.form.method='post';
     this._removePanel();
     this.form.submit();
   });
 }
}

const obj = new OrderList();
obj.setMapping("list_order");
obj.handleForm();






/*


let editBtn = document.querySelector('.edit-button');
let detailBtn = document.querySelector('.detail-button');
let deleteBtn = document.querySelector('.delete-button');
let logoutPanel = document.querySelector('.logout-panel');
let overlay = document.querySelector('.overlay');
let cencelBtn = document.querySelector('.cencel-btn');
let okBtn = document.querySelector('.ok-btn');
let table = document.querySelector('table');
let deletePanel = document.querySelector('.delete');
 
 
let id  ; 
let outerForm ;
table.addEventListener('click', (e)=>{
  e.preventDefault();
  id = e.target.closest('tr').dataset.orderId; // .dataset.bookId ; 
  if(e.target.classList.contains("delete-button")){
    deletePanel.querySelector(".id").textContent=id;
    deletePanel.classList.remove('none');
    overlay.classList.remove('none');
    document.body.style.overflow= "hidden";
    outerForm = e.target.closest("form");
  }else if(e.target.classList.contains("edit-button")) {
    const form = e.target.closest("form");
    form.action='edit_order';
    form.submit();
   // window.location.href = `http://localhost:8086/BookStoreWebsite/admin/edit_order?id=${id}`  ;
  } 
  else if(e.target.classList.contains("detail-button")) {
    console.log("detail EVENT");
    const form = e.target.closest("form");
    form.action='order_detail';
    form.submit();
    //window.location.href = `http://localhost:8086/BookStoreWebsite/admin/order_detail?id=${id}`  ;
  } 
});


const removeMenu = function(){
  deletePanel.classList.add('none');
  overlay.classList.add('none');
  document.body.style.overflow= "scroll";
}

okBtn.addEventListener('click'  , ()=>{ 
  outerForm.action='delete_order';
  outerForm.method='POST';
  outerForm.submit();
    removeMenu();
  // window.location.href =`http://localhost:8086/BookStoreWebsite/admin/delete_order?id=${id}` ;
});

overlay.addEventListener('click'  , removeMenu);
cencelBtn.addEventListener('click' ,removeMenu);
 
*/

 