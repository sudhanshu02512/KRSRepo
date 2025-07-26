import { LightningElement,track } from 'lwc';
export default class ToDoList extends LightningElement {
    task;
    noOfTask;
    taskDetailHandler(event){
        this.task=event.detail.value;
    }
    addTask(){
       this.refs.childComp.addTask(this.task);
       const inputElement = this.template.querySelector('lightning-input[data-id="input1"]');
       inputElement.value='';
       //console.dir(this.refs.taskBox);
       //this.refs.taskBox.value='';
    }

}