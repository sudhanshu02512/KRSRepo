import LightningModal from 'lightning/modal';
import { NavigationMixin } from "lightning/navigation";

export default class Modal extends NavigationMixin(LightningModal) {
    closeModal(){
       this.close();
    }
    saveModal(){
        const modalOpen = this.querySelector('c-modal-opener');
        console.log(modalOpen);
    }
}