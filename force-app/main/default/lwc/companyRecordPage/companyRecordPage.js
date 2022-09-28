import { api, LightningElement, wire } from 'lwc';
// import fields
import fieldSet from '@salesforce/apex/GetFieldSetName.getFieldsNameFromFieldSet';
export default class CompanyRecordPage extends LightningElement {
    @api recordId;
    @api title;
    @wire(fieldSet, {sObjectName: 'Account', fieldSetName: 'CommunityFields'})
    fieldsApiName;
}