import { LightningElement } from "lwc";

export default class CheckBoxJest extends LightningElement {
  isVisible = false;
  textInput = null;
  handelTextOnChange(event){
    this.textInput = event.target.value;
  }
  handelCheckboxOnchange() {
    if (this.isVisible === false) {
      this.isVisible = true;
    } else {
      this.isVisible = false;
    }
    // this.isVisible=event.target.checked;
  }
}
