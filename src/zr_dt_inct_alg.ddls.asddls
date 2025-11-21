@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root View Incidents'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZR_DT_INCT_ALG
  as select from zdt_inct_alg
  composition [0..*] of ZDD_INCT_H_ALG as _History
{
  key inc_uuid              as IncUUID,
      incident_id           as IncidentID,
      title                 as Title,
      description           as Description,
      status                as Status,
      priority              as Priority,
      creation_date         as CreationDate,
      changed_date          as ChangedDate,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      // Make association public
      _History
}
