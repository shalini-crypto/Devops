@isTest

private class AccountTriggerTest {

    @isTest
    private static void updateRatingTest() {
        // Test data setup
        List<Account> accList = new List<Account>();

        for (Integer i=1; i<=5; i++) {
            Account acc = new Account();
            acc.Name = 'MyTestAcc'+i;
            acc.Industry = 'Energy';
            accList.add(acc);
        }
        // Actual test
        Test.startTest();
            insert accList;
        Test.stopTest();

        // Asserts
        List<Account> updatedAccount = [SELECT id, Rating 
                        FROM Account WHERE id =:accList[0].Id ];
    
        System.assertEquals( 'Hot', updatedAccount[0].Rating);
    }

    @isTest
    private static void createRelatedOppTest() {

        //create data
        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 5; i++){
            
            Account acc = new Account();
            acc.Name = 'TestAcc' + i;
            accList.add(acc);   
        }
        Test.startTest();
        insert accList;
        Test.stopTest();


        // Actual test
        List<Opportunity> oppList = [SELECT id
                                        FROM Opportunity
                                        WHERE accountId =: accList[0].id];

        // Asserts
        System.assertEquals(oppList!= null,'Opportuinity was not created');
    }
}
