import { api, LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountHelper.getAccountList';
import sList from '@salesforce/apex/AccountHelper.sList';
import getContributionsWihtDesig from '@salesforce/apex/ContributionsOnDesignationLWC.getContributionsWihtDesig';
import getFeddbacksWihtDesig from '@salesforce/apex/SelfFeedbackHandler.getFeddbacksWihtDesig';
import getFieldSetName from '@salesforce/apex/SelfFeedbackHandler.getFieldSetName';

export default class AccountListForEachLWC extends LightningElement {
    @api recordId;
    @wire(getAccountList) accounts;
    @wire(getContributionsWihtDesig, {designationId: '$recordId'}) contributions;
    @wire(sList, {a: 'Acc', b: 'test'}) stringList;
    @wire(getFeddbacksWihtDesig, {designationId: '$recordId'}) feedbacks;
    @wire(getFieldSetName, {sObjectName: 'Feedback__c', fieldSetName: 'feedbackFields'}) fieldSetApiName;
}