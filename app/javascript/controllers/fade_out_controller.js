// app/javascript/controllers/fade_controller.js
import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  connect() {
    // Fade out and remove the element
    $(this.element).fadeOut(2000, function() {
      this.remove();
    });
  }
}
