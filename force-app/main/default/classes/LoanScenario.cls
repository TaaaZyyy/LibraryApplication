public with sharing class LoanScenario {
    private final MemberQueryService memberQueryService;

    public LoanScenario(MemberQueryService memberQueryService) {
        this.memberQueryService = memberQueryService;
    }

    /**
     * @description 貸出制限を判断する
     */
    // public MaterialItemLoanAbility loanability(MaterialItem.ItemNumber itemNumber) {
    //     MaterialItemStatus status = itemQuery
    // }

    /**
     * 会員番号の有効性を確認する
     */
    public Member.MemberStatus memberStatus(Loan.LoanRequest loanRequest) {
        return memberQueryService.status(loanRequest.memberNumber());
    }
}
