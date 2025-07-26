import { LightningElement,wire,track } from 'lwc';
import getAppStoreItems from '@salesforce/apex/AppStoreController.getAppStoreItems';


export default class AppStore extends LightningElement {

    application;
    appStoreItems;
    websiteUrl;
    spreadProperties;

    constructor(){
        super();
        this.spreadProperties={};
    }
    @wire(getAppStoreItems,{appStoreName: 'Mini_App_Store'}) getStoreItem(res){
        if(res){
            this.appStoreItems= res.data;
            console.log(this.appStoreItems);
        }
    };

    /*******************************************************************************
    @author      Sudhanshu
    @date      13 Feb,2025
    @param
    @return
    @description
    *******************************************************************************/
    appStoreItemClickHandler(event){
        //Object.defineProperty(this.spreadProperties,"websiteUrl",event.target.dataset.websiteUrl);
        if(event.target.dataset.websiteUrl){
            this.spreadProperties={
                "websiteUrl":event.target.dataset.websiteUrl,
                "width":"1080px",
                "height":"1080px"
            }
        }
        
        import("c/"+event.target.dataset.componentName).then(({ default: ctor }) => (this.application = ctor))
    }
}