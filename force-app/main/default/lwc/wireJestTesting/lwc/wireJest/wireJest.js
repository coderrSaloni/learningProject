import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountHelper.getAccountList';
export default class WireJest extends LightningElement {
    @wire(getAccountList) accountList;
}