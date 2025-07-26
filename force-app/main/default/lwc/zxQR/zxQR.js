import { LightningElement } from 'lwc';
export default class ZxQR extends LightningElement {

   qr;

   connectedCallback(){
      const url = "https://zx-node-app.onrender.com/api/qr";
         fetch(url,{method: "POST",
         body: JSON.stringify({ "text": "hello" })}
      ).then(res=>{
         console.log(res);
         this.qr= res.body;
      }).catch(err=>{
         console.log(err);
      })
   } 
}