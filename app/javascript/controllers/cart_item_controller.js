// Stimulus controller for updating cart items dynamically.
import { Controller } from "@hotwired/stimulus"
import { debounce } from "lib/debounce"
import { patch } from '@rails/request.js'

export default class extends Controller {

  // Defines outlets to interact with other controllers (e.g., cart).
  static outlets = [ "cart" ]

  // Defines targets for interacting with quantity controls and subtotal display.
  static targets = [ "decrease", "increase", "quantity", "subtotal" ]

  // Defines a URL value for API requests to update cart items.
  static values = {
    url: String
  }

  // Initializes event listeners for quantity adjustment buttons.
  connect() {
    this.decreaseTarget.onclick = () => this.descrease();
    this.increaseTarget.onclick = () => this.increase();
  }

  // Decreases item quantity if greater than 1 and updates the cart.
  descrease() {
    if (Number(this.quantityTarget.value) !== 1) {
      this.quantityTarget.value = Number(this.quantityTarget.value) - 1;
      debounce(this.update());  
    }      
  }

  // Increases item quantity and updates the cart.
  increase() {
    this.quantityTarget.value = Number(this.quantityTarget.value) + 1;
    debounce(this.update());  
  }

  // Sends an asynchronous PATCH request to update the cart item quantity.
  async update() {
    const response = await patch(this.urlValue, { 
      body: JSON.stringify({ quantity: this.quantityTarget.value }), 
      contentType: "application/json",
      responseKind: "json"
    });
    const response_json = await response.json;

    // If the update is successful, refresh subtotal and cart UI.
    if (response.ok) {
      this.subtotalTarget.innerText = response_json.subtotal;
      this.cartOutlet.update();
    } else {
      this.error(response_json.message);
    } 
  }
}
