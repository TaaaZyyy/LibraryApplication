/**
 * @description 会員
 */
public with sharing class Member {
    public static final String MEMBER_NUMBER_NULL_VALUE_MESSGE = '会員番号を入力してください。';

    private final MemberNumber memberNumber;
    private final Name name;
    private final MemberType memberType;

    public Member(MemberNumber memberNumber, Name name, MemberType memberType) {
        this.memberNumber = memberNumber;
        this.name = name;
        this.memberType = memberType;
    }

    public MemberNumber number() {
        return  memberNumber;
    }

    public Name name() {
        return name;
    }

    public MemberType type() {
        return memberType;
    }

    /**
     * @description 会員番号
     */
    public inherited sharing class MemberNumber {
        private final String value;

        public MemberNumber(String value) {
            if (String.isEmpty(value)) {
                throw new IllegalArgumentException(Member.MEMBER_NUMBER_NULL_VALUE_MESSGE);
            }

            this.value = value;
        }

        public String value() {
            return value;
        }
    }

    /**
     * @description 会員登録の状態
     */
    public enum MemberStatus {
        UNREGISTERED, // 未登録
        VALID, // 有効
        INVALID // 無効
    }

    /**
     * @description 会員種別
     */
    public enum MemberType {
        JUNIOR_HIGH_SCHOOL_STUDENT_AND_ABOVE, // 中学生以上
        ELEMENTARY_SCHOOL_STUDENT_AND_BELEOW // 小学生以下
    }

    /**
     * @description 名前
     */
    public inherited sharing class Name {
        private final String value;

        public Name(String value) {
            this.value = value;
        }
    }

    public class IllegalArgumentException extends Exception {}
}
