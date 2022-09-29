import { createElement } from 'lwc';
import ParentJest from 'c/parentJest';

describe('c-parent-jest', () => {
    beforeEach(() => {
        const element = createElement('c-parent-jest', {
            is: ParentJest
        });
        document.body.appendChild(element);
    })
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('Parent Test', () => {
        const element = document.querySelector('c-parent-jest');
        const child = element.shadowRoot.querySelectorAll('c-child-jest');
        // Assert
        // const div = element.shadowRoot.querySelector('div');
        expect(child.length).toBe(1);
    });

    it('render Parent Data', () => {
        const element = document.querySelector('c-parent-jest');
        const child = element.shadowRoot.querySelectorAll('c-child-jest');
        // Assert
        // const div = element.shadowRoot.querySelector('div');
        // We can't test Child Data here
        expect(child.userdetail.Name).toBe('Prashant');
    })
});