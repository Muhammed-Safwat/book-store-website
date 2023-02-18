 /*
let AddToCartBtn = document.querySelector(".cart-form");
 
function createCartObj(){
  const myid = document.querySelector("#item-id").value;
  const myQuantity = document.querySelector(".cart-form select").value;
  return {
    id : myid,
    quantity : myQuantity,
  };
}

AddToCartBtn.addEventListener('submit',(e)=>{
  e.preventDefault();
  let arr  = JSON.parse(localStorage.getItem('cart'));
  arr.push(createCartObj());
  localStorage.setItem("cart",JSON.stringify(arr)); 
  loadPage();
	/*const Http = new XMLHttpRequest();
	const url=`http://localhost:8086/BookStoreWebsite/add_to_cart?`+new URLSearchParams({id: 1});
	Http.open("GET", url);
  
  /*const body = JSON.stringify({
    title: "Hello World",
    body: "My POST request",
    bookId: `${id}`,
  });
  Http.send();
	
	Http.onreadystatechange = (e) => {
	console.log(Http.responseText);
	 if(Http.ok){
	    let obj =  JSON.parse(Http.responseText);
	    console.log(obj);
	    
    }
	} 

});*/

 /*
let cartArray  = JSON.parse(localStorage.getItem('cart'));
console.log("cart cart Array" + cartArray);
cartArray.forEach(el => {
	arr.forEach(el => console.log(el.ID));
}); */

function loadPage(){
  console.log("---------------------------------");
  AddToCartBtn.submit()
  console.log("---------------------------------");  
}

/*
const ele = `<input type='number' value="$ class="form-control quantity-form-select" name="quantity" id="quantity" style="width: 60px;"/> `

document.querySelector('.form-select-container').addEventListener('change',(e)=>{
   if(e.target.classList.contains('quantity-form-select') && e.target.value==='+10'){
    e.target.remove();
    document.querySelector('.form-select-container').insertAdjacentHTML('beforeend',ele);
    
    document.querySelector('.form-control.quantity-form-select').focus();
   }
});*/