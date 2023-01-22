public with sharing class PhoneNoUtilities {
    public static String formatNumber(String phone){
        String countryCode='+61';
        String newPhone=phone;
        String ph='';
        try{
            phone = phone.deleteWhitespace().replaceAll('\\D','').replaceFirst( '^0+', '');
            if (phone.startsWith('61')){
                phone = phone.replaceFirst( '61', '');
            }
            ph = Phone;
            if ((ph.startsWith('1800') || ph.startsWith('1300'))  && ph.length()==10){
                ph = ph.substring(0, 4)+' '+ph.substring(4, 7)+' '+ph.substring(7, 10);
                newPhone = ph; 
            } else if (((ph.startswith('4')) ||ph.startswith('2') || ph.startswith('3')|| ph.startswith('7')|| ph.startswith('8')) && (ph.length()==9 || ph.length()==11)){
                if(ph.startswith('4')){
                    ph = countryCode+' '+ph.substring(0, 3)+' '+ph.substring(3, 6)+' '+ph.substring(6, 9);
                } else if (ph.startswith('2') || ph.startswith('3')|| ph.startswith('7')|| ph.startswith('8')){
                    // New code to handle the rare occasion that someone enters a number like (08) 08 1234 5678
                    if (ph.length()==11){
                        String testAC=ph.subString(1,3);
                        // Only do this if there is an Australian area code
                        if (testAC.equals('02') || testAc.equals('03') || testAC.equals('07') || testAC.equals('08'))
                        {
                            ph=ph.substring(2);
                        } else {
                            return newPhone;
                        }
                    }
                    ph = countryCode+' '+ph.substring(0, 1)+' '+ph.substring(1, 5)+' '+ph.substring(5, 9);
                }
                newPhone = ph;
            }
        } catch (Exception e){
            System.debug(e.getMessage());
        }
        return newPhone;
    }
}
