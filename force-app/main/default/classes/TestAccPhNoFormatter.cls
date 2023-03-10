@isTest
public class TestAccPhNoFormatter {
    @isTest
  private static void testInsertAccount() {
    List<Account> cont = new List<Account>();
    Account c1= new Account ( NAME='Account ABC', Phone='(61)245783214.');
    cont.add(c1);
    Account c2 = new Account (NAME='Account DEF', Phone='61-490-490-479.');
    cont.add(c2);
    Account c3 = new Account (NAME='Account XYZ', Phone='61-1300907987');
    cont.add(c3);
    Insert cont;
    Account A3= [SELECT NAME, Phone FROM Account where Id=:c1.Id];
    Account A4= [SELECT NAME, Phone FROM Account where Id=:c2.Id];
    Account A5= [SELECT NAME, Phone FROM Account where Id=:c3.Id];
    System.assertEquals('+61 2 4578 3214',A3.phone);
    System.assertEquals('+61 490 490 479',A4.phone);
  }
}
