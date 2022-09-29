import { createElement } from 'lwc';
import Hello from 'c/hello';

describe('p', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('displays greeting', () => {
        // Create Element
        const element = createElement('c-hello', {
            is: Hello
        });

        // Act
        document.body.appendChild(element);

        // Assert (Verify displayed greeting)
        const div = element.shadowRoot.querySelectorAll('div>div');
        // const div = element.shadowRoot.querySelector('div');
        // expect(div1.textContent).toBe('Hi, World!');
        expect(div[0].textContent).toBe('Hello, World!');
        expect(div[1].textContent).toBe('Hi, World!');
    });
});