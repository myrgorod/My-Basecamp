import { Controller } from "@hotwired/stimulus"

export default class extends Controller {  
  initialize(){ }
  connect() { }
  toggleForm(event){
    console.log("I clicked the edit button");
    event.preventDefault();
    event.stopPropagation();
    const formID = event.params["form"];
    const discussionBodyID = event.params["body"];
    const editButtonID = event.params["edit"];
    const form = document.getElementById(formID);
    form.classList.toggle("d-none");
    form.classList.toggle("mt-5");
    const discussionBody = document.getElementById(discussionBodyID);
    const editButton = document.getElementById(editButtonID);
    discussionBody.classlist.toggle("d-none");
    this.toggleEditButton(editButton);
  }
  
}
