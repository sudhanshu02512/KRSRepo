import { LightningElement, wire } from 'lwc';
import apexToLwc from '@salesforce/apex/ApexToLwc.toLwc';

export default class ApexToLwc extends LightningElement {
    arr = [4,3,1,7,3,8,9];

    constructor(){
        super();
        console.log('inside contructor');
    }
    @wire(apexToLwc,{accId:'001dL00000116SeQAI',accList:[{Name:'sudhanshu'}]}) wiredMethod(res){
        console.log('inside wiredMethod');
        console.log(res);
    }

    connectedCallback(){
        // apexToLwc({accId:'001dL00000116SeQAI',accList:[{Name:'sudhanshu'}]}).then(res=>{
        //     console.log(res);
        // })
        console.log('inside connectedCallback');
    }
    renderedCallback(){
        console.log('inside rendered Callback');
        this.arr = this.arr.sort((a,b)=> b-a);
        //(4,3) 3-4 = (-) a comes before b
        //4-3 +ve =1
        //a-b -ve a before a-b +v a after b
        for(let i =0;i<this.arr.length;i++){
            console.log(this.arr[i]);
        }
    }
    // async handler(){
    //     await apexToLwc({accId:'001dL00000116SeQAI',accList:[{Name:'sudhanshu'}]}).then(res=>{
    //         console.log(res);
    //     })
    // }
   
    div1Click(event){
        console.log('click div1');
        event.preventDefault();
    }
    div2Click(event){
        console.log('click div2');
        //event.stopPropagation();
        event.preventDefault();
        
    }

    div3Click(event){
        console.log('click div3');
        event.preventDefault();
    }
    buttonHandler(event){
        console.log('button click');
        event.preventDefault();
    }
}