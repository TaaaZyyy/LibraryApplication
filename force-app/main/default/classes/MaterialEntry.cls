public with sharing class MaterialEntry {
    private final EntryNumber entryNumber;
    private final Title title;
    private final WorkOf workOf;
    private final EntryType entryType;

    public MaterialEntry(EntryNumber entryNumber, Title title, WorkOf workOf, EntryType entryType) {
        this.entryNumber = entryNumber;
        this.title = title;
        this.workOf = workOf;
        this.entryType = entryType;
    }

    public EntryNumber entryNumber() {
        return entryNumber;
    }

    public Boolean isSame(MaterialEntry other) {
        return entryNumber.sameValue(other.entryNumber);
    }

    public Title title() {
        return title;
    }

    public WorkOf workOf() {
        return workOf;
    }

    public String show() {
        return String.format('%s (%s)', new List<Object>{title(), workOf()});
    }

    /**
     * 所蔵品目種別
     */
    public EntryType entryType() {
        return entryType;
    }

    /**
     * @description 所蔵品目番号
     */
    public class EntryNumber {
        // TODO: NotNul
        private final Integer value;

        public EntryNumber(Integer value) {
            this.value = value;
        }

        public EntryNumber(String value) {
            this.value = Integer.valueOf(value);
        }

        public Integer value() {
            return value;
        }

        public Boolean sameValue(EntryNumber other) {
            return this.value == other.value;
        }

        public override String toString() {
            return String.valueOf(value);
        }
    }

    /**
     * @description 所蔵品目種別
     *              図書と視聴覚資料（DVD等）ごとに貸出可能数が異なる
     */
    public enum EntryType {
        BOOK, // 図書
        AUDIOVISUAL // 視聴覚資料
    }

    /**
     * 所蔵品目の題目
     */
    public class Title {
        private final String value;

        public Title(String value) {
            this.value = value;
        }

        public override String toString() {
            return value;
        }
    }

    /**
     * @description
     */
    public class WorkOf {
        private final String value;

        public WorkOf(String value) {
            this.value = value;
        }

        public override String toString() {
            return value;
        }
    }
}
