public class ContactPhNoFormatter {
 public static Boolean isFirstTime = true;
    public static void mobilevalidation(List<Contact> ContactList){
        try{
            list<contact> updateContact = new list<contact>();
            for (Contact c : ContactList){
                boolean change=false;
                if(c.Phone != null){
                    c.Phone = PhoneNoUtilities.formatNumber(c.Phone);
                    change=true;
                }
                // Phone validation ends here
                // Validation for MobilePhone starts here
                if(c.MobilePhone != null){
                    c.MobilePhone=PhoneNoUtilities.formatNumber(c.MobilePhone);
                    change=true;
                }
                // Mobile Phone Validation ends here
                // Home Phone validation starts here
                if(c.HomePhone != null){
                    c.HomePhone=PhoneNoUtilities.formatNumber(c.HomePhone);
                    change=true;
                }
                // Homephone validation ends here
                // Work Phone validation starts here
                if(c.npe01__WorkPhone__c != null){
                    c.npe01__WorkPhone__c=PhoneNoUtilities.formatNumber(c.npe01__WorkPhone__c);
                    change=true;
                }
                // Work Phone validation ends here
                // Other Phone validation starts here
                if(c.OtherPhone != null){
                    c.OtherPhone=PhoneNoUtilities.formatNumber(c.OtherPhone);
                    change=true;
                }
                // Other Phone validation ends here
                if(change) {
                    updateContact.add(c);
                }
            }
            if(updateContact.size()>0) {
                update updateContact;
            }
        } catch (Exception e){
            System.debug(e.getMessage());
        }
    }
}
