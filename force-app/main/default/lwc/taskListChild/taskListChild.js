import { LightningElement,api,track } from 'lwc';
export default class TaskListChild extends LightningElement {
   @track taskList=[];
   @api addTask(task){
       this.taskList.push(task);
   }

}