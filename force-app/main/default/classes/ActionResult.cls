public with sharing class ActionResult {
    @AuraEnabled public Boolean isSuccess {get; private set;}
    @AuraEnabled public String  message {get; private set;}
    @AuraEnabled public Object  value {get; private set;}

    public ActionResult(Boolean isSuccess, String message, Object value) {
        this.isSuccess = isSuccess;
        this.message   = message;
        this.value     = value;
    }

    public String toJson() {
        return JSON.serialize(this);
    }

    // TODO:
    // public class InputValidationResults {
    //     public final Map<String, String> results;

    //     public InputValidationResults() {
    //         this.results = new Map<String, String>();
    //     }

    //     private InputValidationResults(Map<String, String> results) {
    //         this.results = results;
    //     }

    //     public InputValidationResults put(String name, String message) {
    //         Map<String, String> adding = new Map<String, String>(this.results);
    //         adding.put(name, message);
    //         return new InputValidationResults(adding);
    //     }

    //     public Object value() {
    //         return (Object) this.results.clone();
    //     }
    // }
}