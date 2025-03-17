import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["welcome", "title", "form", "content", "titleError", "contentError"]

  toggle() {
    console.log("asdfgsdas")
    this.formTarget.classList.toggle("hidden");
  }

  click(){
    console.log("clicked")
  }

  create(event){
    let isValid = true;

    if(this.titleTarget.value.trim() === ""){
      isValid = false;
      this.titleErrorTarget.classList.remove("hidden")
    } else {
      this.titleErrorTarget.classList.add("hidden")
    }

    if(this.contentTarget.value.trim() === ""){
      isValid = false;
      this.contentErrorTarget.classList.remove("hidden")
    } else {
      this.contentErrorTarget.classList.add("hidden")
    }

    if(!isValid){
      event.preventDefault()
    } else {
      this.formTarget.classList.toggle("hidden");
      // this.titleTarget.value = "";
      // this.contentTarget.value = "";
    }
  }

}
