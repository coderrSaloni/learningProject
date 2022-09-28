import { LightningElement, track, wire } from 'lwc';
import CompaniesData from '@salesforce/apex/CompanyController.companiesData'
import NAME_FIELD from '@salesforce/schema/Account.Name'
import TV_Icon from '@salesforce/resourceUrl/ThinkvibesLogo'

const COLUMNS=[
    {label: 'Compony Name', fieldName: NAME_FIELD.fieldApiName, type: 'text'}
]

export default class Companies extends LightningElement {
    recordLink;
    records;
    url;
    columns = COLUMNS;
    @wire(CompaniesData) companies({error, data}){
        if(data){
            this.records = data;
        } else if(error){
            console.log('Something went wrong:', error);
        }
    }
    tvLogo = TV_Icon;
    /* idx=0;
    onLoadAddUrlAndRecordId(){
        this.url = 'https://pmtvsample-developer-edition.ap27.force.com/s/company/a085j0000050QRnAAM/tcs';
        idx++;
    } */
}