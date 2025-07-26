public with sharing class PrioritySorter {
    public class Field {
        String fieldApi;
        Decimal amount;
        Integer priority;
        public Field(String fieldApi, Decimal amount, Integer priority){
            this.fieldApi = fieldApi;
            this.amount = amount;
            this.priority = priority;
        }
    }

    public static void sorter(){
        List<Field> fieldList = new List<Field>();
        fieldList.add(new Field('B', 50, 3));
        fieldList.add(new Field('C', 13, 1));
        fieldList.add(new Field('A', 100, 2));
        fieldList.add(new Field('D', 70, 5));
        fieldList.add(new Field('F', 14, 6));
        fieldList.add(new Field('H', 50, 7));
        fieldList.add(new Field('T', 50, 4));
        fieldList.sort(new FieldComparator());
        System.debug(fieldList);

    }

    public class FieldComparator implements Comparator<Field> {
        public Integer compare(Field f1, Field f2) {
            if(f1.amount>f2.amount){
                return -1;
            }
            else if(f1.amount==f2.amount) {
                if(f1.priority>f2.priority){
                    return 1;
                }
                else {
                    return -1;
                }
            }
            else {
                return 1;
            }
        }
    }

}