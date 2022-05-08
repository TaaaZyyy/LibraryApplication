/**
 * @description 貸出の登録画面
 */
public with sharing class LoanRegisterController {
    static LoanScenario coordinator;

    static {
        coordinator = new LoanScenario(
            new MemberQueryService()
        );
    }

    @AuraEnabled
    public static ActionResult register(LoanRequest params) {
        // TODO: org.springframework.validation.BindingResult について
        Loan.LoanRequest loanRequest = params.convert();
        Member.MemberStatus memberStatus = coordinator.memberStatus(loanRequest);
        if (memberStatus == Member.MemberStatus.UNREGISTERED) {
            return new ActionResult(
                false,
                'この番号の会員はいません。',
                null
            );
        }
        return new ActionResult(
            true,
            '',
            null
        );
    }

    public with sharing class AuraPageCtrl {
        @AuraEnabled
        public static void methodName(String param) {
            try {
            } catch (Exception e) {
                System.debug(LoggingLevel.ERROR, 'error: ' + e.getMessage());
                System.debug(LoggingLevel.ERROR, 'stacktrace: ' + e.getStackTraceString());
                throw new AuraHandledException('エラーが発生しました。');
            }
        }

        public class ActionResult {
            @AuraEnabled public Boolean isSuccess {get; private set;}
            @AuraEnabled public String  message   {get; private set;}
            @AuraEnabled public Object  value     {get; private set;}

            ActionResult(Boolean pIsSuccess, String pMessage, Object pValue) {
                this.isSuccess = pIsSuccess;
                this.message   = pMessage;
                this.value     = pValue;
            }

            public String getJson() {
                return JSON.serialize(this);
            }
        }
    }

    /**
     *  @description LWC用貸出依頼クラス
     *               LWCは引数なしのコンストラクタが必要なため、LWC用のクラスを用意する
     */
    public class LoanRequest {
        @AuraEnabled public String memberNumber {get; set;}
        @AuraEnabled public String itemNumber {get; set;}
        @AuraEnabled public Date loanDate {get; set;}

        public Loan.LoanRequest convert() {
            return new Loan.LoanRequest(
                new Member.MemberNumber(this.memberNumber),
                new MaterialItem.ItemNumber(this.itemNumber),
                new Loan.LoanDate(this.loanDate)
            );
        }
    }
}