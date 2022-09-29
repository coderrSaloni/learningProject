import { createElement } from 'lwc';
import CheckBoxJest from 'c/checkBoxJest';

describe('c-check-box-jest', () => {
    beforeEach(() => {
        const element = createElement('c-check-box-jest', {
            is: CheckBoxJest
        })
        document.body.appendChild(element);
        // The jsdom instance is shared across test cases in a single file so reset the DOM
    });

    it('Password checkbox Test With Flase', () => {
        const element = document.querySelector('c-check-box-jest');
        const passwordElement = element.shadowRoot.querySelector('.userInfo');
        expect(passwordElement.textContent).toBe('My Password is ********');

    });

    it('Password checkbox Test With True', () => {
        const element = document.querySelector('c-check-box-jest');
        
        const checkBoxValue = element.shadowRoot.querySelector(".checkBox");
        checkBoxValue.value=true;
        checkBoxValue.dispatchEvent(new CustomEvent('change'));
        const passwordElement = element.shadowRoot.querySelector('.userInfo');
        return Promise.resolve().then(()=>{
            expect(passwordElement.textContent).toBe('My Password is Password');
        })

    });
});