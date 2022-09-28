import { LightningElement, wire } from 'lwc';

import GetAllJobs from '@salesforce/apex/JobController.getAllJobs';
import CompaniesData from '@salesforce/apex/CompanyController.companiesData'

export default class JobsList extends LightningElement {
    records;
    companiesRecords;
    companyName = 'All'
    @wire(GetAllJobs, {companyName: '$companyName'})allJobs({error, data}){
        if(data){
            this.records = data;
        } else if(error){
            console.log('Something went wrong:', error);
        }
    }
    @wire(CompaniesData) companies({error, data}){
        if(data){
            this.companiesRecords = data;
        } else if(error){
            console.log('Something went wrong:', error);
        }
    }

    HandleFilterChange(event){
        this.companyName = event.target.value;
        console.log(this.companyName);
    }
}