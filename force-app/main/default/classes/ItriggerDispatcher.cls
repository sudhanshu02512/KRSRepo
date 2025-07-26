public Interface ItriggerDispatcher {
	void beforeInsert(SObject so);
    void afterInsert(SObject so);
    void beforeUpdate();
}