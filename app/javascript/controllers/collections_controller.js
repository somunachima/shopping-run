import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="collections"
export default class extends Controller {
  static values = {
    hash: Object
  }
  connect() {
    console.log("Hello ")
  }
  updateForm() {
    console.log(this.hashValue)
  }

}
