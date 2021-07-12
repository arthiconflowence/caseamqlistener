%dw 2.0
output application/json
---
{
  caseId: payload.caseId,
  source: payload.sourceSystem,
  status: payload.state,
  owner: payload.caseOwner,
  priority: payload.priority,
  lastUpdatedDate:payload.lastUpdatedDate,
  externalComments: payload.comments,
  externalStatus: payload.externalStatus,
  externalSystemLastUpdated: payload.externalSystemLastUpdated,
  externalOwner:payload.externalOwner,
  externalPriority:payload.externalPriority,
  comments:payload.comments
}