@isTest
private class AccountTriggerTest {

    @isTest
    private static void accountInsertTest() {
        // Test data setup
        Account acc = new Account();
        acc.Name = 'MyTestAcc';
        // Actual test
        Test.startTest();
            insert acc;
        Test.stopTest();

        // Asserts
        Account accRecord = [SELECT id, NumberOfEmployees 
                        FROM Account WHERE id =:acc.Id ];
    
        System.assertEquals(1, accRecord.NumberOfEmployees);
        List<Contact> conList = [SELECT id, Name 
                        FROM Contact WHERE AccountId =:acc.Id ];
        System.assert(conList.size()>0);
    }

}