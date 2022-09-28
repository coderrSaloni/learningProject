public class CaseTriggerHandler {
    public static void createTaskWhenCaseClosed(List<Case> casesList) {
        List<Task> taskToCrateList = new List<Task>();
        for(Case cs : casesList){
            if(cs.Status=='Closed'){
                Task task = new Task();
                task.WhatId = cs.Id;
                task.Status = 'Completed';
                task.Subject = 'Case: "'+ cs.CaseNumber +'" is Closed';
                task.Priority = 'Normal';
                task.WhoId = cs.ContactId;
                taskToCrateList.add(task);
            }
        }
        insert taskToCrateList;
    }
}