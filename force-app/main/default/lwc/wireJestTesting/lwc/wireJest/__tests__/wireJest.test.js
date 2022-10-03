/* eslint-disable no-mixed-spaces-and-tabs */
import { createElement } from 'lwc';
import WireJest from 'c/wireJest';
// import { registerApexTestWireAdapter } from '@Salesforce/sfdx-lwc-jest';
import getAccountList from '@salesforce/apex/AccountHelper.getAccountList';
// creating Mock for geting mock
jest.mock(
	'@salesforce/apex/AccountHelper.getAccountList',
	() => {
	  const {
		createApexTestWireAdapter
	  } = require('@salesforce/sfdx-lwc-jest');
	  return {
		default: createApexTestWireAdapter(jest.fn())
	  };
	},
	{ virtual: true }
  );
const mockAccountList = require('./AccountList.json');
// const accountListAdaptor = registerApexTestWireAdapter(getAccountList);
describe('c-wire-jest', () => {
	beforeEach( () =>{
		 // Arrange
		 const element = createElement('c-wire-jest', {
			is: WireJest
		});

		// Act
		document.body.appendChild(element);
	})

	afterEach(() => {
		// The jsdom instance is shared across test cases in a single file so reset the DOM
		while (document.body.firstChild) {
			document.body.removeChild(document.body.firstChild);
		}
	});

	it('wire test 1', () => {
	   const element = document.querySelector('c-wire-jest');

	   getAccountList.emit(mockAccountList);
	   return Promise.resolve().then(() => {
			const subElement = element.shadowRoot.querySelectorAll('p');
			expect(subElement.length).toEqual(mockAccountList.length);
			expect(subElement[0].textContent.Name).toEqual(mockAccountList[0].Name);
	   });
	});
});