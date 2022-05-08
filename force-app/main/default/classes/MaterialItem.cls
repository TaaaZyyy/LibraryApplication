/**
 * @describe 所蔵品
 * @import MaterialEntry
 */
public with sharing class MaterialItem {
    public static final String ITEM_NUMBER_NULL_VALUE_MESSAGE = '所蔵品番号を入力してください。';

    private final ItemNumber itemNumber;
    private final MaterialEntry entry;

    public MaterialItem(ItemNumber itemNumber, MaterialEntry entry) {
        this.itemNumber = itemNumber;
        this.entry = entry;
    }

    /**
     * @return 所蔵品目
     */
    public MaterialEntry entry() {
        return entry;
    }

    /**
     * @return 所蔵品番号
     */
    public ItemNumber itemNumber() {
        return itemNumber;
    }

    public String show() {
        return String.format('[%s] %s', new List<Object>{itemNumber.toString(), entry.show()});
    }

    /**
     * 所蔵品番号
     */
    public class ItemNumber {
        // TODO: NotBlank
        private final String value;

        public ItemNumber(String value) {
            if (String.isEmpty(value)) {
                throw new IllegalArgumentException(MaterialItem.ITEM_NUMBER_NULL_VALUE_MESSAGE);
            }
            this.value = value;
        }

        public Boolean sameValue(ItemNumber other) {
            return (this.toString() == other.toString());
        }

        public override String toString() {
            return value;
        }
    }

    public class IllegalArgumentException extends Exception {}
}
