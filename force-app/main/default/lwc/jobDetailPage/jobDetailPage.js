import { api, LightningElement, wire } from 'lwc';

import getJobs from '@salesforce/apex/JobController.getJobByJobId';
// Import Community UR 
import basePathName from '@salesforce/community/basePath';
export default class JobDetailPage extends LightningElement {
    @api recordId;
    jobDetail;
    jobListUrl = basePathName + '/job-openings/Job_Openings__c/00B5j00000M7OWcEAN';
    @wire(getJobs, {jobId : '$recordId'}) job({error, data}){
        if(data){
            this.jobDetail = data;
            console.log("data we got>>"+data);
        }else if (error){
            console.log("something want wrong"+error);
        }
    }
}
0