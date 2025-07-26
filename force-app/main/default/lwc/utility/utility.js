import getType from '@salesforce/apex/MyApexController.getType';
import getApplicationType from '@salesforce/apex/MyApexController.getApplicationType';

async function isCommercialApplication(){
    let applicationType = await getType();
    let isCommercial;
    if(applicationType=="Commercial"){
        isCommercial = true;
    }
    else{
        isCommercial = false;
    }
    return isCommercial;
}

function getComy(){
    let promise = new Promise(function(resolve,reject){
        getType().then(data=>{
            resolve(data);
        })
    })
    return promise;
}


async function isCommercialType(){
    let response =  await getApplicationType();
    let type = JSON.stringify(response.Type);
    if(type.includes("Customer - Channel")){
        return true;
    }
    else{
        return false;
    }
}

export {isCommercialApplication,getComy,isCommercialType};