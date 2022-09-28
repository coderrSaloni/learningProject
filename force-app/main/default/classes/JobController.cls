public without sharing class JobController {
    @AuraEnabled(cacheable=true)
    public static List<Job_Openings__c> getAllJobs(String companyName){ 
        if(companyName=='All'){
            return[ SELECT Name, Company__r.Name, Location__c, CommunityUrl__c FROM Job_Openings__c
                    ORDER BY Name ASC];
        }else{
            return[ SELECT Name, Company__r.Name, Location__c, CommunityUrl__c FROM Job_Openings__c
                    WHERE Company__r.Name = :companyName
                    ORDER BY Name ASC];
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<Job_Openings__c> getJobByJobId(Id jobId){
        return [SELECT Name, About_Job__c, Job_Description__c, Qualification_Required__c,
                Responsibilities__c, Company__r.Name, Job_Category__c, Location__c, Company__r.recordUrl__c 
                FROM Job_Openings__c WHERE Id = :jobId];
    }
}
