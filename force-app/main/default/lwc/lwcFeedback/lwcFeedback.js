import { api, LightningElement, track, wire } from 'lwc';
import getFeddbacksWihtDesig from '@salesforce/apex/SelfFeedbackHandler.getFeddbacksWihtDesig';
import getFieldSetName from '@salesforce/apex/SelfFeedbackHandler.getFieldSetName';

export default class LwcFeedback extends LightningElement {
    @api recordId;
    @wire(getFeddbacksWihtDesig, {designationId: '$recordId'}) feedbacks;
    @wire(getFieldSetName, {sObjectName: 'Feedback__c', fieldSetName: 'feedbackAvgFields'}) feedbackAvgFields;
    @wire(getFieldSetName, {sObjectName: 'Feedback__c', fieldSetName: 'detailFields'}) detailFields;
    @track showCreateContribution = false;
    // detailFields
    handleClick() {
        eval("$A.get('e.force:refreshView').fire();");
    }

    createContribution(){
        if(this.showCreateContribution==false) {
            this.showCreateContribution = true;
        } else {
            this.showCreateContribution = false;
        }
    }

    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.showCreateContribution = false;
    }
}