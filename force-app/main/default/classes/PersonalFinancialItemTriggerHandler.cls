public with sharing class PersonalFinancialItemTriggerHandler {
    public static void doBeforeInsertAction(List<Personal_Financial_Item__c> newList){
        Set<Id> setOfPfsIds = new Set<Id>();
        Map<Id,Id> mapOfPfsWithApps = new Map<Id,Id>();
        Set<Id> setOfAppsIds = new Set<Id>();
        Map<Id,List<Id>> mapOfAppsWithCog = new Map<Id,List<Id>>();
        for(Personal_Financial_Item__c pfi: newList){
            if(pfi.Personal_Financial_Summary__c!=null){
                setOfPfsIds.add(pfi.Personal_Financial_Summary__c);
            }
        }

        if(!setOfPfsIds.isEmpty()){
            List<Personal_Financial_Summary__c> pfsList =[Select Id,Application__c from Personal_Financial_Summary__c where Id In : setOfPfsIds];
            if(!pfsList.isEmpty()){
                for(Personal_Financial_Summary__c pfs : pfsList){
                    mapOfPfsWithApps.put(pfs.Id,pfs.Application__c);
                    setOfAppsIds.add(pfs.Application__c);
                }
                List<OpportunityContactRole> ocrList = [Select Id,ContactId,Role,Application__c from OpportunityContactRole where Application__c In :setOfAppsIds and Role = 'Co-Guarantor'];
                if(!ocrList.isEmpty()){
                    for(OpportunityContactRole ocr : ocrList){
                        List<Id> cogIds;
                        if(mapOfAppsWithCog.get(ocr.Application__c)==null){
                            cogIds = new List<Id>();
                        }
                        else{
                            cogIds = mapOfAppsWithCog.get(ocr.Application__c);
                        }
                        cogIds.add(ocr.ContactId);
                        mapOfAppsWithCog.put(ocr.Application__c,cogIds);
                    }

                    Map<Id,List<Personal_Financial_Item__c>> mapOfPfswithPfis = new Map<Id,List<Personal_Financial_Item__c>>();
                    List<Personal_Financial_Item__c>  currentPfiList= [Select Id,Personal_Financial_Summary__c,Account_Number__c,Guarantor__c from Personal_Financial_Item__c where Personal_Financial_Summary__c In: setOfPfsIds];
                    if(!currentPfiList.isEmpty()){
                        //Make List of current PFS and PFI Map
                        for(Personal_Financial_Item__c currentPfi : currentPfiList){
                            if(currentPfi.Personal_Financial_Summary__c!=null){
                                List<Personal_Financial_Item__c> pfiList;
                                if(mapOfPfswithPfis.get(currentPfi.Personal_Financial_Summary__c)==null){
                                    pfiList = new List<Personal_Financial_Item__c>();
                                }
                                else{
                                    pfiList = mapOfPfswithPfis.get(currentPfi.Personal_Financial_Summary__c);
                                }
                                pfiList.add(currentPfi);
                                mapOfPfswithPfis.put(currentPfi.Personal_Financial_Summary__c,pfiList);
                            }
                        }
                        //System.debug('Map of PFS after cuurent present-->'+ mapOfPfswithPfis);

                        
                    }

                    // Add current created record as well

                    for(Personal_Financial_Item__c pfi : newList){
                        if(pfi.Personal_Financial_Summary__c!=null){
                            List<Personal_Financial_Item__c> pfiList;
                            if(mapOfPfswithPfis.get(pfi.Personal_Financial_Summary__c)==null){
                                pfiList = new List<Personal_Financial_Item__c>();
                            }
                            else{
                                pfiList = mapOfPfswithPfis.get(pfi.Personal_Financial_Summary__c);
                            }
                            pfiList.add(pfi);
                            mapOfPfswithPfis.put(pfi.Personal_Financial_Summary__c,pfiList);
                        }
                    }

                    System.debug('Map of PFS after current creation-->'+ mapOfPfswithPfis);

                    for(Personal_Financial_Item__c pfi: newList){
                        System.debug('PFI--->'+ pfi);
                        Boolean duplicate = false;
                        Integer duplicateCountInNewRecords=0;
                        if(mapOfPfswithPfis.get(pfi.Personal_Financial_Summary__c)!=null
                        && mapOfAppsWithCog.get(mapOfPfsWithApps.get(pfi.Personal_Financial_Summary__c)).contains(pfi.Guarantor__c)){
                            for(Personal_Financial_Item__c currentPfi: mapOfPfswithPfis.get(pfi.Personal_Financial_Summary__c)){
                                //System.debug('Inside current Pfi');
                                //System.debug('Current PFI----->' + currentPfi);
                                if(currentPfi.Account_Number__c == pfi.Account_Number__c 
                                ){
                                    if(currentPfi.Id!=null){
                                        duplicate= true;
                                    }
                                    else{
                                        duplicateCountInNewRecords++;
                                        //System.debug('Duplicate Count:'+ duplicateCountInNewRecords);
                                    }
                                }
                            }
                        } 
                        System.debug('Duplicate Var--->'+duplicate);
                        System.debug('Duplicate Count:'+ duplicateCountInNewRecords);   
                        if(duplicate || duplicateCountInNewRecords >1){
                            pfi.Status__c = 'Do not include';
                        }
                        // List<Personal_Financial_Item__c> pfiList;
                        // if(mapOfPfswithPfis.get(pfi.Personal_Financial_Summary__c)==null){
                        //     pfiList = new List<Personal_Financial_Item__c>();
                        // }
                        // else{
                        //     pfiList = mapOfPfswithPfis.get(pfi.Personal_Financial_Summary__c);
                        // }
                        // pfiList.add(pfi);
                        // mapOfPfswithPfis.put(pfi.Personal_Financial_Summary__c,pfiList);
                    }

                }

            }
        }

       
    }
    public static void doAfterInsertAction(List<Personal_Financial_Item__c> newList){
        System.debug('After Insert');
        if(!newList.isEmpty()){
            Set<Id> setOfPfsIds = new Set<Id>();
            Map<Id,Id> mapOfPfsWithApps = new Map<Id,Id>();
            Set<Id> setOfAppsIds = new Set<Id>();
            Map<Id,List<Id>> mapOfAppsWithCog = new Map<Id,List<Id>>();
            Map<Id,List<Personal_Financial_Item__c>> mapOfPfswithPfis = new Map<Id,List<Personal_Financial_Item__c>>();
            List<Personal_Financial_Item__c> pfiToUpdate = new List<Personal_Financial_Item__c>();
            for(Personal_Financial_Item__c pfi: newList){
                if(pfi.Personal_Financial_Summary__c!=null){
                    setOfPfsIds.add(pfi.Personal_Financial_Summary__c);
                }
            }
            if(!setOfPfsIds.isEmpty()){
                List<Personal_Financial_Summary__c> pfsList =[Select Id,Application__c from Personal_Financial_Summary__c where Id In : setOfPfsIds];
                if(!pfsList.isEmpty()){
                    for(Personal_Financial_Summary__c pfs : pfsList){
                        mapOfPfsWithApps.put(pfs.Id,pfs.Application__c);
                        setOfAppsIds.add(pfs.Application__c);
                    }
                    List<OpportunityContactRole> ocrList = [Select Id,ContactId,Role,Application__c from OpportunityContactRole where Application__c In :setOfAppsIds and Role = 'Co-Guarantor'];
                    if(!ocrList.isEmpty()){
                        for(OpportunityContactRole ocr : ocrList){
                            List<Id> cogIds;
                            if(mapOfAppsWithCog.get(ocr.Application__c)==null){
                                cogIds = new List<Id>();
                            }
                            else{
                                cogIds = mapOfAppsWithCog.get(ocr.Application__c);
                            }
                            cogIds.add(ocr.ContactId);
                            mapOfAppsWithCog.put(ocr.Application__c,cogIds);
                        }
                        List<Personal_Financial_Item__c>  currentPfiList= [Select Id,Personal_Financial_Summary__c,Account_Number__c from Personal_Financial_Item__c where Personal_Financial_Summary__c In: setOfPfsIds];

                        if(!currentPfiList.isEmpty()){
                            for(Personal_Financial_Item__c currentPfi : currentPfiList){
                                List<Personal_Financial_Item__c> pfiList;
                                if(mapOfPfswithPfis.get(currentPfi.Personal_Financial_Summary__c)==null){
                                    pfiList = new List<Personal_Financial_Item__c>();
                                }
                                else{
                                    pfiList = mapOfPfswithPfis.get(currentPfi.Personal_Financial_Summary__c);
                                }
                                pfiList.add(currentPfi);
                                mapOfPfswithPfis.put(currentPfi.Personal_Financial_Summary__c,pfiList);
                            }
                        }
                        


                        for(Personal_Financial_Item__c pfi: newList){
                            System.debug('PFI--->'+ pfi);
                            Boolean duplicateExist = false;
                            if(mapOfPfswithPfis.get(pfi.Personal_Financial_Summary__c)!=null){
                                for(Personal_Financial_Item__c currentPfi: mapOfPfswithPfis.get(pfi.Personal_Financial_Summary__c)){
                                    System.debug('Inside current Pfi');
                                    System.debug('Current PFI----->' + currentPfi);
                                    if(pfi.Id!=currentPfi.Id &&currentPfi.Account_Number__c == pfi.Account_Number__c && mapOfAppsWithCog.get(mapOfPfsWithApps.get(pfi.Personal_Financial_Summary__c)).contains(pfi.Guarantor__c)){
                                        duplicateExist=true;
                                    }
                                }
                                if(duplicateExist){
                                    Personal_Financial_Item__c pfiVar = new Personal_Financial_Item__c();
                                    pfiVar.id=pfi.Id;
                                    pfiVar.Status__c='Do not include';
                                    pfiToUpdate.add(pfiVar);
                                }
                            }   
                        }
                        if(!pfiToUpdate.isEmpty()){
                            update pfiToUpdate;
                        }
    
                    }
    
                }
            }
        }
        
    }
    public static void doBeforeUpdateAction(){
        System.debug('Before Update');
    }
    public static void doAfterUpdateAction(){
        System.debug('After Update');
    }
}