@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View History Incident'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_INCT_H_ALG 
as projection on ZDD_INCT_H_ALG
{
    key HisUUID,
    key IncUUID,
    HisID,
    PreviousStatus,
    NewStatus,
    Text,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedAt,
    LocalLastChangedBy,
    LastChangedAt,
    /* Associations */
    _Incident : redirected to parent ZC_DT_INCT_ALG 
}
