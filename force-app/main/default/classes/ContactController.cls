public class ContactController {
	@AuraEnabled
    public static List<Contact> getContacts(){
        if(Schema.sObjectType.Contact.isAccessible()){
            List<Contact> contacts = [SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact where Email != null and Phone != null  order by CreatedDate Desc limit 2];
        	return contacts;
        }
        else{
            return null;
        }
    }
}