public class UnitOFWorkMock implements fflib_ISObjectUnitOfWork {
    public static Integer registerNewCount=0;
    public static Integer registerDirtyCount=0;
    public static Integer registerRelationshipCount=0;
    public static Integer commitCount=0;
    public static Integer registerDeleteCount=0;
    public static Integer registerWorkCount=0;
    public static Integer registerEmailCount=0;
    public static Integer registerUpsertCount=0;
    public static Integer registerEmptyRecycleBinCount=0;
    public static Integer registerPermanentlyDeletedCount=0;
    public static Integer registerPublishCount=0;
    public void registerNew(SObject record){
        registerNewCount++;
    }
    public void registerNew(List<SObject> records){
        registerNewCount++;
    }
    public void registerNew(SObject record, Schema.SObjectField relatedToParentField, SObject relatedToParentRecord){
        registerNewCount++;
    }
    public void registerRelationship(SObject record, Schema.sObjectField relatedToField, SObject relatedTo){
        registerRelationshipCount++;
    }
    public void registerRelationship(Messaging.SingleEmailMessage emailMsg, SObject record){
        registerRelationshipCount++;
    }
    public void registerRelationship(SObject record, Schema.SObjectField relatedToParentField1, Schema.SObjectField relatedToParentField2, Object relatedToParentRecord){
        registerRelationshipCount++;
    }
    public void registerDirty(SObject record){
        registerDirtyCount++;
    }
    public void registerDirty(SObject record, List<SObjectField> dirtyFields){
        registerDirtyCount++;
    }
    public void registerDirty(SObject record, Schema.sObjectField relatedToParentField, SObject relatedToParentRecord){
        registerDirtyCount++;
    }
    public void registerDirty(List<SObject> records){
        registerDirtyCount++;
    }
    public void registerDirty(List<SObject> record, List<Schema.SObjectField> schema){
        registerDirtyCount++;
    }
    public void registerDeleted(SObject record){
        registerDeleteCount++;
    }
    public void registerDeleted(List<SObject> records){
        registerDeleteCount++;
    }
    public void commitWork(){
        commitCount++;
    }
    public void registerWork(fflib_SObjectUnitOfWork.IDoWork work){
        registerWorkCount++;
    }
    public void registerEmail(Messaging.Email email){
        registerEmailCount++;
    }
    public void registerEmptyRecycleBin(SObject record){
        registerEmptyRecycleBinCount++;
    }
    public void registerEmptyRecycleBin(List<SObject> record){
        registerEmptyRecycleBinCount++;
    }
    public void registerUpsert(SObject record){
        registerUpsertCount++;
    }
    public void registerUpsert(List<SObject> record){
        registerUpsertCount++;
    }
    public void registerPermanentlyDeleted(List<SObject> record){
        registerPermanentlyDeletedCount++;
    }
    public void registerPermanentlyDeleted(SObject record){
        registerPermanentlyDeletedCount++;
    }
    public void registerPublishBeforeTransaction(SObject record){
        registerPublishCount++;
    }
    public void registerPublishBeforeTransaction(List<SObject> record){
        registerPublishCount++;
    }
    public void registerPublishAfterSuccessTransaction(SObject record){
        registerPublishCount++;
    }
    public void registerPublishAfterSuccessTransaction(List<SObject> record){
        registerPublishCount++;
    }
    public void registerPublishAfterFailureTransaction(SObject record){
        registerPublishCount++;
    }
    public void registerPublishAfterFailureTransaction(List<SObject> record){
        registerPublishCount++;
    }
}
