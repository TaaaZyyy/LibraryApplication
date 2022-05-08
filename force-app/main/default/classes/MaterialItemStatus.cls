/**
 * 所蔵品の状態
 */
public class MaterialItemStatus {
    private MaterialItemStatus() {
        System.assert(false, 'Static Only');
    }

    public static Type valueOf(TypeToken token, String description) {
        switch on token {
            when UNREGISTERED {
                return new Unregistered(description);
            }
            when IN_STOCK {
                return new InStock(description);
            }
            when IN_RESERVATION {
                return new InReservation(description);
            }
            when IN_RESERVE {
                return new InReserve(description);
            }
            when CHECKED_OUT {
                return new CheckedOut(description);
            }
            when OTHER {
                return new Other(description);
            }
        }
        return null;
    }

    public enum TypeToken {
        UNREGISTERED, // 未登録
        IN_STOCK, // 在庫中
        IN_RESERVATION, // 予約中
        IN_RESERVE, // 取置中
        CHECKED_OUT, // 貸出中
        OTHER // その他
    }

    public interface Type {
        String description();
    }

    public class Unregistered implements Type {
        private final String description;

        private Unregistered(String description) {
            String defaultStr = '登録されていません';
            this.description = String.isEmpty(description) ? defaultStr : description;
        }

        public String description() {
            return description;
        }
    }

    public class InStock implements Type {
        private final String description;

        private InStock(String description) {
            String defaultStr = '在庫あり(館内閲覧中の可能性あり)';
            this.description = String.isEmpty(description) ? defaultStr : description;
        }

        public String description() {
            return description;
        }
    }

    public class InReservation implements Type {
        private final String description;

        private InReservation(String description) {
            String defaultStr = '次の予約があります';
            this.description = String.isEmpty(description) ? defaultStr : description;
        }

        public String description() {
            return description;
        }
    }

    public class InReserve implements Type {
        private final String description;

        private InReserve(String description) {
            String defaultStr = '貸出予約により取り置いています';
            this.description = String.isEmpty(description) ? defaultStr : description;
        }

        public String description() {
            return description;
        }
    }

    public class CheckedOut implements Type {
        private final String description;

        private CheckedOut(String description) {
            String defaultStr = '貸し出しています';
            this.description = String.isEmpty(description) ? defaultStr : description;
        }

        public String description() {
            return description;
        }
    }

    public class Other implements Type {
        private final String description;

        private Other(String description) {
            String defaultStr = '図書館都合により貸出を停止中です';
            this.description = String.isEmpty(description) ? defaultStr : description;
        }

        public String description() {
            return description;
        }
    }
}