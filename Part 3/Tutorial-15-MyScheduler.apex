global class MyScheduler implements Schedulable {

    global void execute(SchedulableContext ctx) {
        // The query used by the batch job.
        String query = 'SELECT Id,CreatedDate FROM Merchandise  c ' +
            'WHERE Id NOT IN (SELECT Merchandise  c FROM Line_Item  c)';

        CleanUpRecords c = new CleanUpRecords(query); Database.executeBatch(c);
    }
}
