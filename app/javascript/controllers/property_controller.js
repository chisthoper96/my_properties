import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';
import 'datatables.net-bs5';
// Connects to data-controller="property"
export default class extends Controller {
  connect() {

    $(this.element).DataTable();
  }
}
