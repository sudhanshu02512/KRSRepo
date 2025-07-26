import { LightningElement } from 'lwc';
export default class RecordPicker extends LightningElement {
    filter = {
    criteria: [
            {
                fieldPath: 'Name',
                operator: 'like',
                value: '%sudhanshu%',
            },
            {
                fieldPath: 'Type',
                operator: 'eq',
                value: 'Other',
            }
        ],
        filterLogic: '1 AND 2',
    };
}