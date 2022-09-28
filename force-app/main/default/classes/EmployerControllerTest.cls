@isTest
public class EmployerControllerTest {
    @isTest
    static void testEmployerConsultants(){
        String employerId = '0015j00000WdS3iAAF'; // Id off Prashant Mishra Emp
        List<Consultant__c> expected = [SELECT FirstName__c, Name 
                                                FROM Consultant__c
                                                WHERE Employer__c =: employerId];
        Test.startTest();
        List<Consultant__c> actual = EmployerController.employerConsultants(employerId);
        Test.stopTest();
        
        System.assertEquals(expected, actual);
    }

    @isTest
    static void testEmployeeWithCons(){
        List<Account> empList = [SELECT Id, Name, (SELECT Id FROM Consultants__r) FROM Account];
        
        Map<Account, Set<Id>> mapEmployeeWithConsultants = new Map<Account, Set<Id>>();
        Set<Id> setConsultantId = new Set<Id>();
        
        for(Account emp : empList){
            if(emp.Consultants__r.size()>0){
                for(Consultant__c con : emp.Consultants__r){
                    setConsultantId.add(con.Id);
                }
                mapEmployeeWithConsultants.put(emp, setConsultantId);
            }
        }
        Test.startTest();
        Map<Account,Set<Id>> mapResult = EmployerController.EmployeeWithCons();
        Test.stopTest();
        System.assertEquals(mapEmployeeWithConsultants, mapResult);
    }
    
    @isTest
    static void testcheckWorkingDays(){
        Date pastDay = Date.newInstance(2022, 02, 04);
        Date futureDay = Date.newInstance(2022, 02, 15);
        
        Test.startTest();
        Integer actual = EmployerController.checkWorkingDays(pastDay, futureDay);
        Test.stopTest();
        
        System.assertEquals(7, actual);
    }
    
    @isTest
    static void testAllObj(){
        List<string> sObjectList = new List<string>();
        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
            String name = objTyp.getDescribe().getName();
            sObjectList.add(name);
        }
        
        Test.startTest();
        List<String> actual = EmployerController.allObj();
        Test.stopTest();
        
        System.assertEquals(sObjectList, actual);
    }
}