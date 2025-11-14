@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'History Incident'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDD_INCT_H_ALG as select from zdt_inct_h_alg
association to parent ZR_DT_INCT_ALG as _Incident on $projection.IncUUID = _Incident.IncUUID
{
    key his_uuid as HisUUID,
    key inc_uuid as IncUUID,
    his_id as HisID,
    previous_status as PreviousStatus,
    new_status as NewStatus,
    text as Text,
    local_created_by as LocalCreatedBy,
    local_created_at as LocalCreatedAt,
    local_last_changed_at as LocalLastChangedAt,
    local_last_changed_by as LocalLastChangedBy,
    last_changed_at as LastChangedAt,
     //  Associations
      _Incident
}
