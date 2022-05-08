public with sharing class MemberQueryService {
    /**
     * 会員を見つける
     */
    // public Member findMember(Member.MemberNumber memberNumber) {
        // List<Contact> members = [SELECT Id FROM Contact WHERE MemberNumber__c = :memberNumber];
        // if (members.isEmpty()) {
        //     return null;
        // }
        // return new Member();
        // return members.isEmpty() ? null : members[0];
    // }

    /**
     * 会員登録の状態を確認する
     */
    public Member.MemberStatus status(Member.MemberNumber memberNumber) {
        List<Contact> members = [SELECT Id FROM Contact WHERE MemberNumber__c = :memberNumber.value()];
        if (members.isEmpty()) {
            return Member.MemberStatus.UNREGISTERED;
        }
        return Member.memberStatus.VALID;
    }
}
