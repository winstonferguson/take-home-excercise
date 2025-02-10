// Stimulus controller for updating cart items dynamically.
import { Controller } from "@hotwired/stimulus"
import { debounce } from "lib/debounce"
import { patch } from '@rails/request.js'

export default class extends Controller {

  // Defines outlets to interact with other controllers (e.g., cart).
  static outlets = [ "cart" ]

  // Defines targets for interacting with slider and amount display.
  static targets = [ "amount", "input" ]

  // Defines a URL value for API requests to update cart adjustment.
  static values = {
    url: String
  }

  // Initializes event listeners for quantity adjustment buttons.
  connect() {
    this.inputTarget.onchange = () => debounce(this.update())
  }


  // Sends an asynchronous PATCH request to update the cart adjustment amount.
  async update() {
    const response = await patch(this.urlValue, { 
      body: JSON.stringify({ amount: this.inputTarget.value }), 
      contentType: "application/json",
      responseKind: "json"
    });
    const response_json = await response.json;

    // If the update is successful, refresh amount and cart UI.
    if (response.ok) {
      this.amountTarget.innerText = response_json.amount;
      this.cartOutlet.update();
    } else {
      this.error(response_json.message);
    } 
  }
}
