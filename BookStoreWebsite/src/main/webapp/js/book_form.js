
imageInput = document.querySelector('.load-image input');
let uploaded_image = "";

document.getElementById('image').addEventListener('change', async (e) => {
  const reader = new FileReader();
  reader.addEventListener("load", () => {
    uploaded_image = reader.result;
    const markup = `<img src="${uploaded_image}" class="img-review" alt="review image"></img>`
    document.querySelector('.review-image').innerHTML = markup;
  })
  reader.readAsDataURL(e.target.files[0]);
});

document.querySelector('.create-book-form .submit-btn').addEventListener('click', (e) =>{
  e.preventDefault();
  sendform();
});

async function  sendform(){
  console.log('File uploaded started');
    const fileInput = document.getElementById('image');
    const file = fileInput.files[0];
    const formData = new FormData();
    formData.append('image', file);
    try {
      const response = await fetch('http://localhost:8086/BookStoreWebsite/admin/create_book', {
        method: 'PUT',
        body: formData 
      });
  
      if (response.ok) {
        console.log('File uploaded successfully');
        document.querySelector('.create-book-form .image').remove();
        document.querySelector('.create-book-form').submit();
      } 
    } catch (error) {
      // show error message for user 
    }
}

