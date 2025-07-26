import { LightningElement,api } from 'lwc';

export default class AppStoreItem extends LightningElement {
    //Properties
    appIconUrl;

    @api appName;

    //App Icon Getter & Setter
    @api get appIcon(){
        return appIconUrl;
    };
    set appIcon(value){
        this.appIconUrl= "/appstore/resource/"+value;
    }



}