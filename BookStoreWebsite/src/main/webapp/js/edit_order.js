let editBtn = document.querySelector('.edit-button');
let detailBtn = document.querySelector('.detail-button');
let deleteBtn = document.querySelector('.delete-button');
let logoutPanel = document.querySelector('.logout-panel');
let overlay = document.querySelector('.overlay');
let cencelBtn = document.querySelector('.cencel-btn');
let okBtn = document.querySelector('.ok-btn');
let table = document.querySelector('table');
let deletePanel = document.querySelector('.delete');
 
  console.log(table);
  console.log(logoutPanel);
  console.log(overlay);
  console.log(editBtn);
  console.log(deleteBtn); 
  console.log(deletePanel); 
  console.log(detailBtn); 


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
 


 