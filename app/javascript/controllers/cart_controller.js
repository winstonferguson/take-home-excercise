// Stimulus controller for updating cart summary dynamically.
import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

export default class extends Controller {
  
  // Defines targets for updating item count, subtotal, and total price in the UI.
  static targets = [ "itemCount", "subtotal", "total" ]

  // Defines a URL value for fetching cart updates.
  static values = {
    url: String
  }

  connect() {}

  // Fetches updated cart data and updates the UI.
  async update() {
    const response = await get(this.urlValue, { 
      contentType: "application/json", 
      responseKind: "json" 
    });

    const response_json = await response.json;

    // If the request is successful, update the cart summary in the UI.
    if (response.ok) {
      this.subtotalTarget.innerText = response_json.subtotal;
      this.itemCountTarget.innerText = `${response_json.item_count} items`;
      this.totalTarget.innerText = response_json.total;
    } else {
      this.error(response_json.message);
    } 
  }
}
