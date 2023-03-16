import {Helper}  from './helper.js';
class BookList extends Helper {
  
 handleForm(){
   this.parent.addEventListener('click', (e) =>{
     e.preventDefault(); 
     this.form = e.target.closest("form");
     if(e.target.classList.contains("delete-button")){
       let id = this.form.querySelector('input').value;
       this._showPanel(id);
     } else if(e.target.classList.contains("edit-button")) {
       this.form.action='';
       this.form.method="post";
       this.form.submit();
     }
   });
   
   this.okBtn.addEventListener('click' , ()=>{
     this.form.action='';
     this.form.method='post';
     this._removePanel();
     this.form.submit();
   });
 }
}

const obj = new BookList();
obj.setMapping("list_customer");
obj.handleForm();

console.log(obj);
 