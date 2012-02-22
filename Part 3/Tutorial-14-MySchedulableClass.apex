global class MySchedulableClass implements Schedulable {

    global void execute(SchedulableContext ctx) {
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                            FROM CronTrigger WHERE Id = :ctx.getTriggerId()];

        System.debug(ct.CronExpression); 
        System.debug(ct.TimesTriggered);

        Merchandise__c[] a = [SELECT Id, Name 
                                FROM Merchandise__c WHERE Name = 'Pencils'];
        System.assert(a.size() > 0);
        a[0].name = 'Updated Merchandise';
        update a[0];
    }
}
