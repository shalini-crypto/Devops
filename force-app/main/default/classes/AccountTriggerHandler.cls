public inherited sharing class AccountTriggerHandler {
    // public AccountTriggerHandler() {

    // }

    public void updateRating(List<Account> accList){
        for(Account acc :accList){
            System.debug('Inside AccountTriggerHandler acc');
            if(acc.Industry == 'Media' || acc.Industry == 'Energy'){
                acc.Rating = 'Hot';
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

    public  void createRelatedOpportunity(List<Account> accList){
        List<Opportunity> oppoList = new List<Opportunity>();
        for (Account acc : accList) {
            Opportunity oppo = new Opportunity();

            oppo.Name = acc.Name;
            oppo.AccountId = acc.Id;
            oppo.StageName = 'Prospecting';
            oppo.CloseDate = System.today();
            oppoList.add(oppo); 
        }
        if (!oppoList.isEmpty()) {
            insert oppoList;
        }
    }
    
}