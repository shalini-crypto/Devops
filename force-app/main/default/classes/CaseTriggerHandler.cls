public inherited sharing class CaseTriggerHandler {
    public CaseTriggerHandler() {

    }
    public void populateLatestCaseNumber(List<Case> caseList){
        List<Account> accList = new List<Account>();
        for (Case  cs : caseList) {
            if (cs.AccountId != null) {
                Account acc = new Account();
                acc.Id = cs.AccountId;   
            }
        }
    }
}