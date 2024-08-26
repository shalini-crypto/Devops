@isTest
private class CalculatorTest {
        @isTest
        private static void testAdd(){
            Calculator cal = new Calculator();
            test.startTest();
            Integer res = cal.add(5, 10);
            test.stopTest();
            System.assertEquals(15, res, 'wrong.');
        }
    
    
    @isTest
        private static void testSub(){
            Calculator cal = new Calculator();
            Integer res = cal.sub(10, 5);
            System.assertEquals(5, res, 'wrong.');
    }
}