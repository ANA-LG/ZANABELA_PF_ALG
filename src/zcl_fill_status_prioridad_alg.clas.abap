CLASS zcl_fill_status_prioridad_alg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FILL_STATUS_PRIORIDAD_ALG IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE FROM zdt_priority_alg.
    DELETE FROM zdt_status_alg.
**********    Priority Value
     INSERT zdt_priority_alg FROM TABLE @( VALUE #( ( priority_code = 'H'
                                                     priority_description = 'High' )
                                                   ( priority_code = 'M'
                                                     priority_description = 'Medium' )
                                                   ( priority_code = 'L'
                                                     priority_description = 'Low' ) ) ).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } Priorities agregados correctamente| ).
    ENDIF.


****   ----Status value
     INSERT zdt_status_alg FROM TABLE @( VALUE #( ( status_code = 'OP'
                                                   status_description = 'Open-ALG' )
                                                 ( status_code = 'IP'
                                                   status_description = 'In Progress-ALG' )
                                                 ( status_code = 'PE'
                                                   status_description = 'Pending-ALG' )
                                                 ( status_code = 'CO'
                                                   status_description = 'Completed-ALG' )
                                                 ( status_code = 'CL'
                                                   status_description = 'Closed-ALG' )
                                                 ( status_code = 'CN'
                                                   status_description = 'Canceled-ALG' ) ) ).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } Status agregados correctamente| ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
