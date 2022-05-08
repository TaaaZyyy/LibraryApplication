/**
 * @description 貸出
 * @import Member, MaterialItem
 */
public with sharing class Loan {
    // 最上位オブジェクトのみStatic可能なため、各エラーメッセージは外部オブジェクトで定義する
    public static final String LOAN_DATE_NULL_VALUE_MESSAGE = '貸出日を入力してください。';

    private final LoanNumber loanNumber;
    private final Member member;
    // Item item;
    private final LoanDate loanDate;

    public Loan(LoanNumber loanNumber, Member member,
    // Item item,
    LoanDate loanDate) {
        this.loanNumber = loanNumber;
        this.member = member;
        // this.item = item;
        this.loanDate = loanDate;
    }

    public Member member() {
        return member;
    }

    public LoanDate date() {
        return loanDate;
    }

    public LoanNumber loanNumber() {
        return loanNumber;
    }

    // public Item item() {
    //     return item;
    // }

    public Member.MemberNumber memberNumber() {
        return member.number();
    }

    public LoanDate loanDate() {
        return loanDate;
    }

    public static LoanDate createLoanDate(Date d) {
        return new LoanDate(d);
    }

    public static LoanDate createLoanDate(String s) {
        return new LoanDate(Date.parse(s));
    }

    /**
     * 貸出日
     */
    public class LoanDate {
        private final Date value;

        public LoanDate(Date value) {
            if (value == null) {
                throw new InvalidArgumentException(Loan.LOAN_DATE_NULL_VALUE_MESSAGE);
            }
            this.value = value;
        }

        public LoanDate(String value) {
            if (String.isEmpty(value)) {
                throw new InvalidArgumentException(Loan.LOAN_DATE_NULL_VALUE_MESSAGE);
            }
            this.value = Date.valueOf(value);
        }

        public String show() {
            // TODO: 曜日が英語なので、日本語で出力されるように修正する。
            return Datetime.newInstance(value.year(), value.month(), value.day()).format('M月d日(E)');
        }

        public Date value() {
            return value;
        }

        public LoanDate minusDays(Integer days) {
            return new LoanDate(this.value().addDays(-days));
        }

        public Boolean sameValue(LoanDate other) {
            return (value == other.value);
        }
    }

    /**
     * @description 貸出番号
     */
    public class LoanNumber {
        private final String value;
        public LoanNumber(String value) {
            this.value = value;
        }

        public String value() {
            return value;
        }
    }

    /**
     * @description 貸出依頼
     */
    public class LoanRequest {
        private final Member.MemberNumber memberNumber;
        private final MaterialItem.ItemNumber itemNumber;
        private final LoanDate loanDate = Loan.createLoanDate(Date.today());

        public LoanRequest(Member.MemberNumber memberNumber, MaterialItem.Itemnumber itemNumber, LoanDate loanDate) {
            if (memberNumber == null) {
                throw new InvalidArgumentException(Member.MEMBER_NUMBER_NULL_VALUE_MESSGE);
            }
            if (itemNumber == null) {
                throw new InvalidArgumentException(MaterialItem.ITEM_NUMBER_NULL_VALUE_MESSAGE);
            }
            if (loanDate == null) {
                throw new InvalidArgumentException(Loan.LOAN_DATE_NULL_VALUE_MESSAGE);
            }

            this.memberNumber = memberNumber;
            this.itemNumber = itemNumber;
            this.loanDate = loanDate;
        }

        public Member.MemberNumber memberNumber() {
            return memberNumber;
        }

        public MaterialItem.ItemNumber itemNumber() {
            return itemNumber;
        }

        public LoanDate loanDate() {
            return loanDate;
        }
    }

    public class InvalidArgumentException extends Exception {}
}
