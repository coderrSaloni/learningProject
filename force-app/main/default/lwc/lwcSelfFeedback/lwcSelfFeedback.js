import { api, LightningElement, wire } from 'lwc';
import getFeddbacksWihtDesig from '@salesforce/apex/SelfFeedbackHandler.getFeddbacksWihtDesig';
// import fieldSet
import getFieldSetName from '@salesforce/apex/SelfFeedbackHandler.getFieldSetName';


export default class LwcSelfFeedback extends LightningElement {
    @api recordId;
    @wire(getFeddbacksWihtDesig, {designationId: '$recordId'}) feedbacks;
    @wire(getFieldSetName, {sObjectName: 'Feedback__c', fieldSetName: 'feedbackFields'}) fieldSetApiName;
    handleClick() {
        eval("$A.get('e.force:refreshView').fire();");
    }
}