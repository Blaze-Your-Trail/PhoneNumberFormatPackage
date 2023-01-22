public class LeadPhNoFormatter {
    public static Boolean isFirstTime = true;
    public static void mobileValidation(List<Lead> LeadList){
        try{
            list<Lead> updateLead = new list<Lead>();
            for (Lead c : LeadList){
                Boolean change=false;
                if(c.Phone != null){
                    c.Phone=PhoneNoUtilities.formatNumber(c.Phone);
                    change=true;
                }
                // Phone validation ends here
                // Validation for MobilePhone starts here
                if(c.MobilePhone != null){
                    c.MobilePhone=PhoneNoUtilities.formatNumber(c.MobilePhone);
                    change=true;
                }
                // Mobile Phone Validation ends here
                if(change){
                    updateLead.add(c);
                }
            }
            if (updateLead.size()>0){
                update updateLead;
            }
        } catch (Exception e){
            System.debug(e.getMessage());
        }
    }
}
