global class ApexSoapService {
    webservice static Id createContact(String contactLastName, String accId){
        Contact c = new Contact();
        c.LastName = contactLastName;
        c.AccountId = accId;
        insert c;
        return c.Id;
    }
}