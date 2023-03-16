import {Helper}  from './helper.js';
class ReviewList extends Helper {
  
 handleForm(){
   this.parent.addEventListener('click', (e) =>{
     e.preventDefault(); 
     this.form = e.target.closest("form");
     if(e.target.classList.contains("delete-button")){
        let id = this.form.querySelector('input').value;
        this._showPanel(id);
     }else if(e.target.classList.contains("edit-button")) {
       this.form.action='edit_review';
       this.form.method="post";
        this.form.submit();
     }
   });
   
   this.okBtn.addEventListener('click' , ()=>{
     this.form.action='delete_review';
     this.form.method='post';
     this._removePanel();
     this.form.submit();
   });
 }
}

const obj = new ReviewList();
obj.setMapping("list_review");
obj.handleForm();