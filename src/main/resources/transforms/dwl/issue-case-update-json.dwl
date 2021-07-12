%dw 2.0
output application/json
fun format(d:String) = (d as LocalDateTime {format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ" } >> "UTC") as String {format: "yyyy-MM-dd'T'HH:mm:ss.SSS"}
fun getIncidentState(state: String) = do {
	var stateVal = if (state=="To Do") p('sfdc-mapping.state.New') else if(state=="In Progress") p('sfdc-mapping.state.Working') else if(state=="DONE") p('sfdc-mapping.state.Closed')
	else p('sfdc-mapping.state.Closed')   
    ---
    stateVal
}
---
{
  caseId: payload.sfdcCaseId,
  sourceSystem: p('application-msgs.source'),
  state: getIncidentState(payload.status),
  caseOwner: payload.externalOwner,
  priority: payload.priority,
  lastUpdatedDate:format(payload.lastUpdatedDate) as String,
  comments: payload.comments,
  externalStatus: payload.externalStatus,
  externalSystemLastUpdated: format(payload.externalSystemLastUpdated) as String,
  externalOwner:payload.externalOwner,
  externalPriority:payload.externalPriority,
  externalComments:payload.externalComments
}