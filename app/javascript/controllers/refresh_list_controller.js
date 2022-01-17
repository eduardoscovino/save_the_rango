import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "list", "searchInput", "basketLink"];

  connect() {
    this.basketLinkTarget.textContent = I18n.products_index_cart_button;
    this.searchInputTarget.placeholder = I18n.products_search_input_placeholder;
  }

  update() {
    const url = `${this.formTarget.action}?query=${this.searchInputTarget.value}`;
    fetch(url, { headers: { Accept: "text/plain" } })
      .then((response) => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      });
  }
}
