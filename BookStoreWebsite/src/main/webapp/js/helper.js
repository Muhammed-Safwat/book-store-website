export class Helper {
  mapping = '';
  constructor(){ 
	
	this._init();    
  }
  
  _init(){
	    this._selectData();
	    this._handelEvent();
	}
  
  _selectData(){
    this.parent = document.querySelector('.data-container');
    this.eventPanel = document.querySelector('.event-panel');
    this.overlay = document.querySelector('.overlay');
    this.cencelBtn = document.querySelector('.cencel-btn');
    this.okBtn = document.querySelector('.ok-btn');
  }

  _showPanel(id){
    this.eventPanel.classList.remove('none');
    this.eventPanel.querySelector('.id').textContent=id;
    this.overlay.classList.remove('none');
    document.body.style.overflow= "hidden";
  }

  _removePanel(){
    this.eventPanel.classList.add('none');
    this.overlay.classList.add('none');
    document.body.style.overflow= "scroll";
  }

  _handelEvent(){
    this.overlay.addEventListener('click'  , ()=>{
      this._removePanel();
    });

    this.cencelBtn.addEventListener('click' , ()=>{
      this._removePanel();
    });
    
     window.addEventListener('unload',  (e) =>{
	     let currentUrl = window.location.href;
       //e.preventDefault();
	     console.log(e.target.activeElement)
         console.log(document.body)
         
      if (e.target.activeElement.nodeName === "BODY" &&!currentUrl.endsWith(this.mapping)) {
        // Replace the last word in the URL with "user_list"
        console.log(true);
        let urlParts = currentUrl.split("/");
        urlParts[urlParts.length - 1] = this.mapping;
        let newUrl = urlParts.join("/");
        console.log("log out")
        // Redirect to the new URL
        window.location.href = newUrl;
      } 
	});
  }
  
  setMapping(mapping){
	this.mapping= mapping;
  }

  
}
 