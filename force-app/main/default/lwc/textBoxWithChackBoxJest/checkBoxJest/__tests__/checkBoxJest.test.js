import { createElement } from "lwc";
import CheckBoxJest from "c/checkBoxJest";

describe("c-check-box-jest", () => {
  beforeEach(() => {
    const element = createElement("c-check-box-jest", {
      is: CheckBoxJest
    });
    document.body.appendChild(element);
    // The jsdom instance is shared across test cases in a single file so reset the DOM
  });

  it("Password checkbox Test With Flase", () => {
    const element = document.querySelector("c-check-box-jest");
    const passwordElement = element.shadowRoot.querySelector(".userInfo");
    expect(passwordElement.textContent).toBe("My Password is ********");
  });

  it("Password checkbox Test With True", () => {
    const element = document.querySelector("c-check-box-jest");

    // Set value in text Box
    const textBoxValue = element.shadowRoot.querySelector(".textBox");
    textBoxValue.value = "test";
    textBoxValue.dispatchEvent(new CustomEvent("change"));

    // Set true value in Checkbox
    const checkBoxValue = element.shadowRoot.querySelector(".checkBox");
    checkBoxValue.value = true;
    checkBoxValue.dispatchEvent(new CustomEvent("change"));

    // Getting actual Result
    const passwordElement = element.shadowRoot.querySelector(".userInfo");

    // assert using Promise
    return Promise.resolve().then(() => {
      expect(passwordElement.textContent).toBe("My Password is test");
    });
  });
});
