import { api, LightningElement, wire } from 'lwc';
import getContributionsWihtDesig from '@salesforce/apex/ContributionsOnDesignation.getContributionsWihtDesig';
import getFieldSetName from '@salesforce/apex/ContributionsOnDesignation.getFieldSetName';

// Importing detail Fields Details__c, Note__c
import DETAILS_FIELD from '@salesforce/schema/Contribution__c.Details__c';
import NOTE_FIELD from '@salesforce/schema/Contribution__c.Note__c';

// Importing horizontal Fields Name, Pillars__c, Assessment__c
import NAME_FIELD from '@salesforce/schema/Contribution__c.Name';
import PILLARS_FIELD from '@salesforce/schema/Contribution__c.Pillars__c';
import ASSESSMENT_FIELD from '@salesforce/schema/Contribution__c.Assessment__c';

// Imorting Vertical Fields Expertise__c, Generosity__c, Leadership__c, Advocacy__c
import EXPERTISE_FIELD from '@salesforce/schema/Contribution__c.Expertise__c';
import GENEROSITY_FIELD from '@salesforce/schema/Contribution__c.Generosity__c';
import LEADERSHIP_FIELD from '@salesforce/schema/Contribution__c.Leadership__c';
import ADVOCACY_FIELD from '@salesforce/schema/Contribution__c.Advocacy__c';

export default class LwcNomineeContributions extends LightningElement {
    @api recordId;
    @wire(getContributionsWihtDesig, {designationId: '$recordId'}) contributions;
    // @wire(getFieldSetName, {sObjectName: 'Contribution__c', sFieldSetName: 'detailFields'}) fieldSetNames;
    // detailFields Contribution__c

    horizontalFields = [NAME_FIELD, PILLARS_FIELD, ASSESSMENT_FIELD];
    verticalFields = [EXPERTISE_FIELD, GENEROSITY_FIELD, LEADERSHIP_FIELD, ADVOCACY_FIELD];
    detailFields = [DETAILS_FIELD, NOTE_FIELD];
    
    // eval("$A.get('e.force:refreshView').fire();");
    handleClick() {
        eval("$A.get('e.force:refreshView').fire();");
    }
}