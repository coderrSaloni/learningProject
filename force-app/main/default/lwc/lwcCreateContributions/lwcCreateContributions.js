import { LightningElement } from 'lwc';
//Pillars__c Assessment__c Details__c Note__c
import CONTACT_FIELD from '@salesforce/schema/Contribution__c.Contact__c';
import PILLARS_FIELD from '@salesforce/schema/Contribution__c.Pillars__c';
import ASSESSMENT_FIELD from '@salesforce/schema/Contribution__c.Assessment__c';
import DETAILS_FIELD from '@salesforce/schema/Contribution__c.Details__c';
import NOTE_FIELD from '@salesforce/schema/Contribution__c.Note__c';

export default class LwcCreateContributions extends LightningElement {
    fields = [CONTACT_FIELD, PILLARS_FIELD, ASSESSMENT_FIELD, DETAILS_FIELD, NOTE_FIELD];
}