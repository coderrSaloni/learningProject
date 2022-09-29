import { LightningElement } from "lwc";

export default class CheckBoxJest extends LightningElement {
  isVisible = false;
  handelCheckboxOnchange(event) {
    if (this.isVisible === false) {
      this.isVisible = true;
    } else {
      this.isVisible = false;
    }
    // this.isVisible=event.target.checked;
  }
}
