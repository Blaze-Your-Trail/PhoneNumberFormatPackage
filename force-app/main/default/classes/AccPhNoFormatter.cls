public class AccPhNoFormatter {
    public static Boolean isFirstTime = true;
    public static void accountPhoneValidation(List<Account> AccountList){
        list<Account> updateAccount = new list<Account>();
        try{
            for (Account acc : AccountList){
                Boolean changeMade=false;
                if (acc.Phone != null){
                    acc.Phone=PhoneNoUtilities.formatNumber(acc.Phone);
                    changeMade=true;
                }
                if(acc.npo02__HouseholdPhone__c!=null){
                    acc.npo02__HouseholdPhone__c=PhoneNoUtilities.formatNumber(acc.npo02__HouseholdPhone__c);
                    changeMade=true;
                }
                if (changeMade){
                    updateAccount.add(acc);
                }
            }
            if (updateAccount.size()>0){
                update updateAccount;
            }
        } catch (Exception e){
            System.debug(e.getMessage());
        }
    }
}
