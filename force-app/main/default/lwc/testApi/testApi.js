import { LightningElement,wire } from 'lwc';
import getUser from '@salesforce/apex/UserAccessManagerController.getUser';
export default class TestApi extends LightningElement {
    endPoint;
    response;
    endPointHandler(event){
        this.endPoint = event.target.value;
    }
    @wire(getUser) getRecord(res){
        console.log( res.data);
    }
    async runHandler(){

        this.response = await fetch("https://www.omdbapi.com/?i=tt3896198&apikey=f3b62097&s=Hello",{method:"GET"});

        //this.response= this.response.body.json();
       let item = await this.response.json();
       console.log(item);
    }
}