import { LightningElement } from 'lwc';

export default class DataTable extends LightningElement {
    columns =[
        {label:'Name', fieldName:'Name'},
        {label:'Phone',fieldName:'Phone'}
    ]
    data =[
        {Name:'Sudhanshu',Id:"123",Phone:12},
        {Name:'Sa',Id:"133"}
    ]
}