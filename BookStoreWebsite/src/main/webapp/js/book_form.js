/**
 * 
 */


/// create book 

imageInput = document.querySelector('.load-image input');

//console.log(imageInput);
let uploaded_image = "";

imageInput.addEventListener("change", function (e) {
  //console.log(imageInput.value);

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

