import { createElement } from 'lwc';
import ChildJest from 'c/childJest';

describe('c-child-jest', () => {
    beforeEach(()=>{
        
    })
    
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('Child Test', () => {
        const element = createElement('c-child-jest',{
            is: ChildJest
        })
        element.userdetail={"Name": "Prashant"};
        // append Child
        document.body.appendChild(element);
        const div = element.shadowRoot.querySelector('.name');
        expect(div.textContent).toBe('Prashant');
    });
});