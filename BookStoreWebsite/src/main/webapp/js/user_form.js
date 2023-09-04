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
console.log("full Name Valid ation".match(fullNameValidation));

UserForm.addEventListener('submit' , (e) => {
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
  }

});

const showErrorMassage = function() {
  alert("error , +==>");
}

