import { LightningElement, wire,track } from 'lwc';
import searchUsers from '@salesforce/apex/UserAccessManagerController.searchUsers';
export default class UserAccessManagerSelectUser extends LightningElement {
    //All Properties
    @track searchResult=[];
    columns;
    searchParameter;

    constructor(){
        super();
        this.columns=[
            { label: 'Name', fieldName: 'Name', hideDefaultActions: true },
            { label: 'Username', fieldName: 'Username', hideDefaultActions: true },
            { label: 'Email', fieldName: 'Email', hideDefaultActions: true },
            { label: 'Phone', fieldName: 'Phone', hideDefaultActions: true },
            {
                type: "button", label: '', initialWidth: 100, 
                typeAttributes: {
                    label: 'Add',
                    name: 'Add',
                    title: 'Add',
                    disabled: false,
                    value: 'add',
                    iconPosition: 'left',
                    iconName:'utility:add',
                    variant:'brand-outline'
                }
            }
        ];
        let parameters = {
            searchQuery:null
        }
        this.searchParameter = JSON.stringify(parameters);
    }

    @wire(searchUsers,{searchParameters:'$searchParameter'}) searchForUser(res){
        if(res){
            this.searchResult= res.data;
        }
    }
    searchInputHandler(event){
        let searchInput = event.detail.value;
        let paramaters= {
                searchQuery:searchInput
        };        
        this.searchParameter=JSON.stringify(paramaters);
    }

}