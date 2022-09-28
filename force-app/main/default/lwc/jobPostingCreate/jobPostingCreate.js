import { LightningElement, wire } from 'lwc';
import basePathName from '@salesforce/community/basePath';
import getFieldSetName from '@salesforce/apex/SelfFeedbackHandler.getFieldSetName';
export default class JobPostingCreate extends LightningElement {
    fields;
    @wire(getFieldSetName, {sObjectName: 'Job_Openings__c', fieldSetName: 'CommunityFields'})
    fieldSetApiName({error, data}){
        if(data){
            this.fields = data;
        }else if(error){
            console.log('Somthing is wrong '+error);
        }
    };
    objectApiName = 'Job_Openings__c';

    /* handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: 'Job created',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);
    } */
}