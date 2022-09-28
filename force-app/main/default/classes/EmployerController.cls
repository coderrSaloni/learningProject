public class EmployerController {
    // Create a class and a static function 
    // which takes EmployerId as argument and returns all names of the consultants working for that employer as a list.
    public static List<Consultant__c> employerConsultants(Id employerId){
        List<Consultant__c> consultantForEmp = [SELECT FirstName__c, Name 
                                                FROM Consultant__c
                                                WHERE Employer__c =: employerId];
        return consultantForEmp; 
    }
    
    
    // Create a function which returns a map where the key is Account and value is set of ConsultantId in it.
    public static Map<Account,Set<Id>> EmployeeWithCons(){
        List<Account> empList = [SELECT Name, (SELECT Id FROM Consultants__r) FROM Account];
        
        Map<Account, Set<Id>> mapEmployeeWithConsultants = new Map<Account, Set<Id>>();
        Set<Id> setConsultantId = new Set<Id>();

        for(Account emp : empList){
            if(emp.Consultants__r.size()>0){
                for(Consultant__c con : emp.Consultants__r){
                    setConsultantId.add(con.Id);
                }
                mapEmployeeWithConsultants.put(emp, setConsultantId);
                /*for(Consultant__c con : emp.Consultants__r){
                    if(!mapEmployeeWithConsultants.containsKey(emp)){
                        mapEmployeeWithConsultants.put(emp, new Set<Id>());
                    }
                    mapEmployeeWithConsultants.get(emp).add(con.Id); 
                }*/
            }
        }
        System.debug('empWithCons: '+ mapEmployeeWithConsultants);
        return mapEmployeeWithConsultants;
    }

    // Create a function which takes two dates as argument and returns the number of working days between two dates excluding both days. 
    // (Saturday and Sunday is non-working days)
    public static Integer checkWorkingDays(Date pastDay, Date futureDay){
        Integer workingDays = 0;
        for(Integer i=0; i<pastDay.daysBetween(futureDay); i++){
            Date dt = pastDay + i; // create dt for checking next day info
            
            // Constructs a Datetime from Integer representations of the specified year, month (1=Jan), and day at midnight in the local time zone.
            Datetime currDate = Datetime.newInstance(dt.year(), dt.month(), dt.day());
            
            String todayDay = currDate.format('EEEE');
            if(todayDay !='Saturday' && todayDay != 'Sunday'){
                workingDays = workingDays + 1;
            }
        }
        System.debug('Working days: '+ workingDays);
        return workingDays;
    }
    
    // Create a class which shows the list of sobjects exists in the org.
    public static List<String> allObj(){
        List<string> sObjectList = new List<string>();
        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
            String name = objTyp.getDescribe().getName();
            sObjectList.add(name);
        }
        System.debug('sObjectList: '+sObjectList);
        return sObjectList;
    }
}