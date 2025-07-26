import { LightningElement } from 'lwc';
export default class DebugRadioGroup extends LightningElement {
    value = 'Yes';
    get options() {
        return [
            { label: 'Yes', value: 'Yes' },
            { label: 'No', value: 'No' },
        ];
    }
}