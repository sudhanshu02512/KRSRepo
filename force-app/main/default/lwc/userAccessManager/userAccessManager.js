import { LightningElement } from 'lwc';

export default class UserAccessManager extends LightningElement {
    showHomePage;
    showNewRequest;
    showTrackMyRequests;
    constructor(){
        super();
        this.showHomePage=true;
        this.showNewRequest = false;
        this.showTrackMyRequests=false;
    }
    
    newRequestHandler(){
        //Show New Request Component
        this.showNewRequest=true;
        //Hide rest of the component
        this.showTrackMyRequests=false;
        this.showHomePage=false;
    }
    trackMyRequestHandler(){
        //Show Track My Request
        this.showTrackMyRequests=true;
        // Hide rest of the component
        this.showHomePage=false;
        this.showNewRequest = false;
        
    }
    homeHandler(){
        //Show Home Page
        this.showHomePage=true;

        //Hide Rest of Compoenet
        this.showNewRequest = false;
        this.showTrackMyRequests=false;
    }
}