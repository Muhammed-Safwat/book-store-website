/**
 * 
 */


/// create book 

imageInput = document.querySelector('.load-image input');

//console.log(imageInput);
let uploaded_image = "";

document.getElementById('image').addEventListener('change', async (e) => {
  const reader = new FileReader();
  reader.addEventListener("load", () => {
    uploaded_image = reader.result;
    //console.log(uploaded_image);
    const markup = `<img src="${uploaded_image}" class="img-review" alt="review image"></img>`
    document.querySelector('.review-image').innerHTML = markup;
  })
  //console.log(this)
  reader.readAsDataURL(e.target.files[0]);
});
/*
document.querySelector('.create-book-form');
document.querySelector('.create-book-form .image');
*/
document.querySelector('.create-book-form .submit-btn').addEventListener('click', (e) =>{
  e.preventDefault();
  sendform();
});


async function  sendform(){
  console.log('File uploaded started');
    const fileInput = document.getElementById('image');
    const file = fileInput.files[0];
    const formData = new FormData();
    formData.append('image', file); // Appending file to FormData object
  
    try {
      const response = await fetch('http://localhost:8086/BookStoreWebsite/admin/create_book', {
        method: 'PUT',
        body: formData // Sending FormData object as request body
      });
  
      if (response.ok) {
        // File upload successful
        console.log('File uploaded successfully');
        document.querySelector('.create-book-form .image').remove();
        document.querySelector('.create-book-form').submit();
      } else {
        // File upload failed
        console.error('File upload failed with status: ' + response.status);
      }
    } catch (error) {
      // Error occurred while uploading file
      console.error('Error occurred while uploading file: ' + error);
    }
}

