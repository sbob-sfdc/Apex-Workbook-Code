@isTest
private class TestSchedulableClass {

    // CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    static testmethod void test() {
        Test.startTest();

        Merchandise__c a = new Merchandise__c();
        a.Name = 'Pencils';
        a.Description__c='Office supplies';
        a.Price__c=1.25;
        a.Total_Inventory__c=100;
        insert a;

        // Schedule the test job
        String jobId = System.schedule('ScheduleApexClassTest',
            CRON_EXP,
            new MySchedulableClass());

        // Get the information from the CronTrigger API object
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                            FROM CronTrigger WHERE id = :jobId];

        // Verify the expressions are the same
        System.assertEquals(CRON_EXP, ct.CronExpression);

        // Verify the job has not run
        System.assertEquals(0, ct.TimesTriggered);

        // Verify the next time the job will run
        System.assertEquals('2022-03-15 00:00:00', String.valueOf(ct.NextFireTime));
        System.assertNotEquals('Updated Merchandise',
            [SELECT id, name FROM Merchandise__c WHERE id = :a.id].name);
        Test.stopTest(); 
        System.assertEquals('Updated Merchandise',
            [SELECT Id, Name FROM Merchandise__c WHERE Id = :a.Id].Name);
    }
}
