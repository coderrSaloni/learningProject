import { createElement } from 'lwc';
import LoopJest from 'c/loopJest';
const Expected = ['Karni','Singh','Rathore','KSR'];
describe('c-loop-jest', () => {
    beforeEach(() => {
        const element = createElement('c-loop-jest', {
            is: LoopJest
        })
        document.body.appendChild(element);
    });

    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('Loop Test', () => {
        const element = document.querySelector('c-loop-jest');
        const forList = element.shadowRoot.querySelectorAll('.forEachList>li');
        // const div = element.shadowRoot.querySelector('div');
        expect(forList.length).toBe(4);
    });

    it('Loop Element Test', () => {
        const element = document.querySelector('c-loop-jest');
        const forList = Array.from(element.shadowRoot.querySelectorAll('.forEachList>li'));
        const forListValue = forList.map(li=>li.textContent);
        expect(forListValue).toEqual(Expected);
    })
});