@isTest
private class TestLeadPhNoFormatter {
  @isTest
  private static void testInsertLead() {
    List<Lead> cont = new List<Lead>();
    Lead c1= new Lead ( lastNAME='Lead ABC', Phone='(61)1800908909.', MobilePhone='0 490490490', Company='ABC',Status='Open - Not Contacted' );
    cont.add(c1);
    Lead c2 = new Lead (lastNAME='Lead DEF', Phone='61-245783214', MobilePhone='61 490490491', Company='DEF',Status='Open - Not Contacted');
    cont.add(c2);
    Insert cont;
    Lead c3= [SELECT Id, Phone, MobilePhone FROM Lead where Id=:c1.Id];
    Lead c4= [SELECT Id, Phone, MobilePhone FROM Lead where Id=:c2.Id];
    System.assertEquals('+61 490 490 490',c3.MobilePhone);
    System.assertEquals('+61 2 4578 3214',c4.phone);
    System.assertEquals('+61 490 490 491',c4.MobilePhone);
  }
}
