/**
 *  -------------------------------- user_form.jsp ----------------------------------
 *  ----------------------------  validate user inputs --------------------------------
*/

const UserForm = document.querySelector('.create-user-form');
const emailValidation = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
const passwordValidation = /^(?=.*\d)(?=.*[A-Z])(.{8,50})$/ ;
const fullNameValidation = /(^[a-zA-Z]{3,12})([ ])([a-zA-Z]{3,12})([ ])([a-zA-Z]{3,12})/ ; 
// /(^[A-Za-z]{3,12})([ ]{1})([A-Za-z]{3,16})([ ]{1})([A-Za-z]{3,12})/ ;

let UserEmail ;
let UserPassword ;
let UserName ;

// console.log(emailValidation.test("muham@gamil.com"));
// To check a password between 6 to 20 characters which contain  at least one numeric digit, one uppercase and one lowercase letter
// console.log(passwordValidation.test("Safwat21"));
console.log("full Name Valid ation".match(fullNameValidation));

UserForm.addEventListener('submit' , (e) => {
   
  console.log("submit functon ===>");

  UserEmail = document.querySelector('input[type="email"]');
  UserPassword = document.querySelector('input[type="password"]');
  UserName = document.querySelector('input[type="name"]');
  console.log("value" , UserPassword.value);
  
  if(!emailValidation.test(UserEmail.value)){
    UserEmail.classList.add('error-input');
    e.preventDefault();
  }

  if(!passwordValidation.test(UserPassword.value) ){
    UserPassword.classList.add('error-input');
    e.preventDefault();
  }

  if(!fullNameValidation.test(UserName.value) ){
    UserName.classList.add('error-input');
    e.preventDefault();
  }else {
    console.error('dlskfjklsdf')
  }
    
 
  /*{
    console.log(UserName.value.match(fullNameValidation)[0]);
   // UserForm.submit();
  }*/
 
  console.log("After prevent onsubmit functon");
});

const showErrorMassage = function() {
  alert("error , +==>");
}

