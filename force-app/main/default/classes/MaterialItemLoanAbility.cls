/**
 * 所蔵品の貸出可否
 */
public class MaterialItemLoanAbility {
    private MaterialItemLoanAbility() {
        System.assert(false, 'Static Only');
    }

    public static Type valueOf(TypeToken token, String message) {
        switch on token {
            when ABLED {
                return new Abled(message);
            }
            when CHECKED_OUT {
                return new CheckedOut(message);
            }
            when IN_RESERVATION {
                return new InReservation(message);
            }
            when OTHER {
                return new Other(message);
            }
        }
        return null;
    }

    public enum TypeToken {
        ABLED, // 貸出可能
        CHECKED_OUT, // 貸出中により貸出不可能
        IN_RESERVATION, // 予約中により貸出不可能
        OTHER // その他
    }

    public interface Type {
        String message();
    }

    public class Abled implements Type {
        private final String message;

        private Abled(String message) {
            String defaultStr = '';
            this.message = String.isEmpty(message) ? defaultStr : message;
        }

        public String message() {
            return message;
        }
    }

    public class CheckedOut implements Type {
        private final String message;

        private CheckedOut(String message) {
            String defaultStr = '貸出中であるため貸し出すことができません。';
            this.message = String.isEmpty(message) ? defaultStr : message;
        }

        public String message() {
            return message;
        }
    }

    public class InReservation implements Type {
        private final String message;

        private InReservation(String message) {
            String defaultStr = '予約中であるため貸し出すことができません。';
            this.message = String.isEmpty(message) ? defaultStr : message;
        }

        public String message() {
            return message;
        }
    }

    public class Other implements Type {
        private final String message;

        private Other(String message) {
            String defaultStr = '貸し出すことができません。';
            this.message = String.isEmpty(message) ? defaultStr : message;
        }

        public String message() {
            return message;
        }
    }
}