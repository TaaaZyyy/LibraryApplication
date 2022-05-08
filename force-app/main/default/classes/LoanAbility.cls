/**
 * 所蔵品の貸出可否
 */
public class LoanAbility {
    private LoanAbility() {
        System.assert(false, 'Static Only');
    }

    public static Type valueOf(TypeToken token, String message) {
        switch on token {
            when DISABLED_FOR_BOOK_LIMIT {
                return new DisabledForBookLimit(message);
            }
            when DISABLED_FOR_AUDIO_LIMIT {
                return new DisabledForAudioLimit(message);
            }
            when DISABLED {
                return new Disabled(message);
            }
            when DISABLED_TEMPORARILY {
                return new DisabledTemporarily(message);
            }
            when ABLED {
                return new Abled(message);
            }
        }
        return null;
    }

    public enum TypeToken {
        DISABLED_FOR_BOOK_LIMIT, // 冊数制限により貸出不可
        DISABLED_FOR_AUDIO_LIMIT, // 視聴覚資料貸出不可
        DISABLED, // 新規貸出不可
        DISABLED_TEMPORARILY, // 貸出一定期間停止
        ABLED // 貸出可能
    }

    public interface Type {
        String message();
    }

    public class DisabledForBookLimit implements Type {
        private final String message;

        private DisabledForBookLimit(String message) {
            String defaultStr =  'これ以上本を貸し出すことができません。';
            this.message = String.isEmpty(message) ? defaultStr : message;
        }

        public String message() {
            return message;
        }
    }

    public class DisabledForAudioLimit implements Type {
        private final String message;

        private DisabledForAudioLimit(String message) {
            String defaultStr =  'これ以上視聴覚資料を貸し出すことができません。';
            this.message = String.isEmpty(message) ? defaultStr : message;
        }

        public String message() {
            return message;
        }
    }

    public class Disabled implements Type {
        private final String message;

        private Disabled(String message) {
            String defaultStr =  '貸出停止中です。';
            this.message = String.isEmpty(message) ? defaultStr : message;
        }

        public String message() {
            return message;
        }
    }

    public class DisabledTemporarily implements Type {
        private final String message;

        private DisabledTemporarily(String message) {
            String defaultStr =  '貸出一定期間停止中です。';
            this.message = String.isEmpty(message) ? defaultStr : message;
        }

        public String message() {
            return message;
        }
    }

    public class Abled implements Type {
        private final String message;

        private Abled(String message) {
            String defaultStr =  '';
            this.message = String.isEmpty(message) ? defaultStr : message;
        }

        public String message() {
            return message;
        }
    }
}