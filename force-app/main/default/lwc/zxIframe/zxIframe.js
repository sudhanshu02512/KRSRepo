import { LightningElement,api } from 'lwc';
export default class ZxIframe extends LightningElement {
    @api websiteUrl;
    @api width;
    @api height;
}