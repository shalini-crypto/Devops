public inherited sharing class AccountTriggerHandler {
    // public AccountTriggerHandler() {

    // }

    public void beforeInsert(List<Account> accList){
        for(Account acc :accList){
            System.debug('Inside AccountTriggerHandler acc');
            if(acc.NumberOfEmployees == NULL){
                acc.NumberOfEmployees = 1;
            }
            System.debug('Inside AccountTriggerHandler acc');
        }
    }
    public void afterInsert(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account acc : accList){
            System.debug('Inside AccountTriggerHandler acc'+acc);
            for (Integer i=0; i<acc.NumberOfEmployees; i++) {
                Contact con = new Contact();
                con.LastName = acc.Name+i;
                con.AccountId = acc.Id;
                conList.add(con);
            }
        }
        System.debug('Inside AccountTriggerHandler conList'+conList);
        if(conList.size()>0){
            insert conList;
        }
    }
    
}