trigger TriggerOnLead on Lead (after insert, after update) {
    List<Lead> LeadList = new List<Lead>();
    try{
        LeadList = [SELECT ID, Phone, MobilePhone FROM Lead where ID IN :Trigger.New];
        switch on trigger.operationType{
            when AFTER_INSERT, AFTER_UPDATE{
                if(LeadPhNoFormatter.isFirstTime){
                    LeadPhNoFormatter.isFirstTime = false;
                    LeadPhNoFormatter.mobileValidation(LeadList);
                }
            }
        }
    } catch (Exception e){
        System.debug(e.getMessage());
    }
 }
