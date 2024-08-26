public inherited sharing class OpportunityTriggerHandler {
    public static void populateDescription(List<Opportunity> oppoList) {

        for (Opportunity oppo : oppoList) {
            if(oppo.Amount != null && (oppo.Amount >= 100000 && oppo.Amount <= 500000)){
                oppo.Description = 'Hot Opportunity';
            }   
        }
    }
}