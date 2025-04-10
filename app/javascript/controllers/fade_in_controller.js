// app/javascript/controllers/fade_controller.js
import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  connect() {
    // Hide and fade in the element (uses jQuery, which is already available)
    $(this.element).hide().fadeIn(2000);
  }
}
