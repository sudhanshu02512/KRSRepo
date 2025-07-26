import { LightningElement, track } from 'lwc';

export default class Timer extends LightningElement {
    @track timer = 0;
    interval;

    startTimer() {
        if(this.interval==null){
            this.interval= setInterval(() => {
                this.timer = this.timer + 1;
            }, 1000);
        }
       
    }
    pauseTimer(){
        if(this.interval!=null){
            clearInterval(this.interval);
        }
    }
    stopTimer(){
        if(this.interval!=null){
            clearInterval(this.interval);
            this.time=0;
        }
    }
}