trigger TriggerOnAccount on Account (after insert, after update) {
    List<Account> accountList = new List<Account>();
    try{
        AccountList = [SELECT ID, NAME, PHONE,npo02__HouseholdPhone__c FROM ACCOUNT where ID IN :Trigger.New];
        switch on trigger.operationType{
            when AFTER_INSERT, AFTER_UPDATE{
                if(AccPhNoFormatter.isFirstTime){
                    AccPhNoFormatter.isFirstTime = false;
                    AccPhNoFormatter.accountPhoneValidation(accountList);
                }
            }
        }
    } catch (Exception e){
        system.debug(e.getMessage());
    }
} 
