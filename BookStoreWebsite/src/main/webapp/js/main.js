
if(window.localStorage.getItem("cart")==null){
	window.localStorage.setItem("cart",JSON.stringify([]));
}/*
const myBlogs = ["https://catalins.tech", "https://exampleblog.com"];
localStorage.setItem('links', JSON.stringify(myBlogs)); 
console.log(obj.name)*/








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

 
 


/**    old requests  */
/*
const xhr = new XMLHttpRequest()
	//open a get request with the remote server URL
	xhr.open("post", "http://localhost:8086/BookStoreWebsite/")
	//send the Http request
	xhr.send()

	//EVENT HANDLERS

	//triggered when the response is completed
	xhr.onload = function() {
	  if (xhr.status === 200) {
	    //parse JSON datax`x
	    console.log(xhr);
	   let  data  = JSON.parse(xhr.response);
	    console.log(xhr.response);
	   
	   
	    console.log(data);
	     console.log(data.price);
	  }else if (xhr.status === 404) {
	    console.log("No records found")
	  }
	}
*/







