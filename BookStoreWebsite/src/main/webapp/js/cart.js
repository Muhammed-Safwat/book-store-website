 
 /*
document.querySelector('.header-wishlist').addEventListener('click',(e)=>{
  e.preventDefault(); 
  console.log("eee=>>>>");
  // Retrieve the array of objects from local storage
  const cartArray = JSON.parse(localStorage.getItem('cart'));

  // Send the array of objects to the servlet via fetch
  fetch('view_cart', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    },
    body: JSON.stringify(cartArray)
  }).then(response => {
    if (response.ok) {
      window.location.pathname="BookStoreWebsite/view_cart";
    } else {
      console.error('Error sending data to servlet:', response.status);
    }
  }).catch(error => {
    console.error('Error sending data to servlet:', error);

  });
}); 
 
document.querySelector('.header-wishlist').addEventListener('click', (e) => {
  e.preventDefault();
  console.log("eee=>>>>");
  // Retrieve the array of objects from local storage
  const cartArray = JSON.parse(localStorage.getItem('cart'));

  // Create a new XHR object
  const xhr = new XMLHttpRequest();
  xhr.open('POST', 'view_cart', true);
  xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

  // Define the onload and onerror event handlers
  xhr.onload = function () {
    if (xhr.status === 200) {
      // Request completed successfully
      console.log('Data sent to servlet');
      const req = new XMLHttpRequest();
      req.open('GET', 'view_cart', true);
      req.send();
    } else {
      console.error('Error sending data to servlet:', xhr.status);
    }
  };

  xhr.onerror = function () {
    console.error('Error sending data to servlet:', xhr.statusText);
  };

  // Send the array of objects to the servlet
  xhr.send(JSON.stringify(cartArray));
});
 */