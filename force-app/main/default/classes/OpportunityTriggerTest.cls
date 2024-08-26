@isTest
public class OpportunityTriggerTest {
    @isTest
    static void populateDescriptionTest(){

        List<Opportunity> oppoList = new List<Opportunity>();
        for (Integer i=1; i<=5; i++) {
            Opportunity oppo = new Opportunity();
            oppo.Name = 'Test Oppo'+i;
            oppo.StageName = 'Closed Won';
            oppo.CloseDate = System.today();
            oppo.Amount = 110000;
        
            oppoList.add(oppo);
        }
        Test.startTest();
        insert oppoList;
        Test.stopTest();
        List<Opportunity> updatedOpportunityList = [SELECT id, Description
                                                FROM Opportunity WHERE Id =: oppoList[0].Id];
        String v1 = 'Hot Opportunity';
        System.assertEquals(v1, updatedOpportunityList[0].Id);

        
    }
}