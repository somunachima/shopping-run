import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modals"
export default class extends Controller {
  connect() {}
  close(e) {
    // Prevent default action
    e.preventDefault();
    // Remove from parent
    const adding = document.getElementById("adding");
    adding.innerHTML = "";

    // Remove the src attribute from the adding
    adding.removeAttribute("src");

    // Remove complete attribute
    adding.removeAttribute("complete");
  }
}
