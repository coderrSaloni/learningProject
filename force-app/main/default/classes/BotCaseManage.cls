public with sharing class BotCaseManage {
	public class CaseInfo{
		@InvocableVariable(required=true)
		public String sCaseStatus;

		@InvocableVariable(required=true)
		public String sName;
	}
	
	public class CaseNumber{
		@InvocableVariable(required=true)
		public String sCaseNumber;
	}

	@InvocableMethod(label='Get Case Status')
	public static List<CaseInfo> getCaseStatus(List<CaseNumber> caseNumberList){
		// Case Number to store case numbers
		Set<String> caseNumberSet = new Set<String>();

		// Get Case Status
		for(CaseNumber caseNumber: caseNumberList){
			caseNumberSet.add(caseNumber.sCaseNumber);
		}
		// Get Case Status from case number
		Case c = [SELECT Status, SuppliedName FROM Case WHERE CaseNumber IN :caseNumberSet][0];

		List<CaseInfo> caseStatusList = new List<CaseInfo>();

		// Set Case Status value in CaseInfo.sCaseStatus
		CaseInfo ci = new CaseInfo();
		ci.sCaseStatus = c.Status;
		ci.sName = c.SuppliedName;

		// add caseStatus in list and return to Bot
		caseStatusList.add(ci);

		return caseStatusList;
	}
}