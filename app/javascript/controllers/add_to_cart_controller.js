// Stimulus controller for handling "Add to Cart" functionality.
import { Controller } from "@hotwired/stimulus"
import { post } from '@rails/request.js'

export default class extends Controller {
  
  // Defines the URL value for sending the request.
  static values = {
    url: String
  }

  // Initializes the controller and sets up the button click event.
  connect() {
    this.button = this.element.querySelector('button');
    this.button.onclick = () => this.addToCart();
  }

  // Sends a POST request to add the product to the cart.
  async addToCart() {
    const response = await post(this.urlValue);

    // If successful, update the button to indicate the item is added.
    if (response.ok) {
      this.success();
    } else {
      const response_json = await response.json;
      this.error(response_json.message);
    }
  }

  // Handles a successful add-to-cart action.
  success() {
    alert('Product added to cart.');
    this.button.disabled = true;
    this.button.innerText = '✔';
  }

  // Handles errors by displaying a message and updating the button style.
  error(message) {
    console.error(message);
    this.button.classList.add('error');
    this.button.innerText = 'Check console.';
  }
}
