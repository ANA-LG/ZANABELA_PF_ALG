@EndUserText.label: 'Paremetro Cambio de Status'
define abstract entity ZDD_NUEVO_STATUS_PARAM_ALG
  //  with parameters parameter_name : parameter_type
{
  @EndUserText.label: 'Cambiar Status'
  @Consumption.valueHelpDefinition: [ {
      entity.name: 'zdd_status_vh_alg',
      entity.element: 'StatusCode',
      useForValidation: true
    } ]
  status : zde_status_code_alg;
  @EndUserText.label: 'Agrega Observacion'
  text   : zde_text_alg;
}
