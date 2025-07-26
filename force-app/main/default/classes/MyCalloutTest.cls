@isTest
public class MyCalloutTest {
    @isTest static void unitTest(){
        Test.setMock(HttpCalloutMock.class, new MyCalloutMock(500));
         HttpResponse response = MyCallout.invokeCallout();
        System.debug(response);
    }
}