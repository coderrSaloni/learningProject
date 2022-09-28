import { api, LightningElement, track, wire } from 'lwc';
import getFieldSetName from '@salesforce/apex/MVPNomineeBasicInfoHandler.getFieldSetName';
import getContactId from '@salesforce/apex/MVPNomineeBasicInfoHandler.getContactId';

export default class MvpBasicInfoLwc extends LightningElement {
    @api recordId; // from record page
    @track contactId; // from apex method
    @track error; // to store error if accures 
    @api column; // column count from Design
    @api title; // title from Design
    @api header; // header checkbox from Design
    @api fieldSet; // fieldSet Picklist from Design

    // Geting contact Id
    @wire(getContactId, {designationId: '$recordId'})
    getingcontactId({error, data}) {
        if(data) {
            this.contactId = data;
            this.error = error;
        }else if(error) {
            this.error = error;
            this.contactId = undefined;
        }
    }

    // get Contact fields 
    @wire(getFieldSetName, {sObjectName: 'Contact', fieldSetName: '$fieldSet'})
    fieldsApiName;
    
}