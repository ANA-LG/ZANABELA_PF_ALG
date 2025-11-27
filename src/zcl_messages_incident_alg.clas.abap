CLASS zcl_messages_incident_alg DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .
    INTERFACES if_abap_behv_message .

    CONSTANTS:
      gc_msgid TYPE symsgid VALUE 'ZMC_INCT_MESSAGE_ALG',


      BEGIN OF status_invalid,
        msgid TYPE symsgid VALUE 'ZMC_MESSAGE_INCI_ALG',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MV_STATUS',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF status_invalid,

      BEGIN OF title_empty,
        msgid TYPE symsgid VALUE 'ZMC_MESSAGE_INCI_ALG',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'MV_TITLE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF title_empty,


      BEGIN OF description_empty,
        msgid TYPE symsgid VALUE 'ZMC_MESSAGE_INCI_ALG',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'MV_DESCRIPTION',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF description_empty,


     BEGIN OF priority_empty,
        msgid TYPE symsgid VALUE 'ZMC_MESSAGE_INCI_ALG',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE 'MV_PRIORITY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF priority_empty,

       BEGIN OF status_init_open,
        msgid TYPE symsgid VALUE 'ZMC_MESSAGE_INCI_ALG',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE 'MV_STATUSO',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF status_init_open.


    METHODS constructor
      IMPORTING
        textid      LIKE if_t100_message=>t100key OPTIONAL
        attr1       TYPE string OPTIONAL
        attr2       TYPE string OPTIONAL
        attr3       TYPE string OPTIONAL
        attr4       TYPE string OPTIONAL
        title       TYPE zde_title_Alg OPTIONAL
        description TYPE zde_description_alg OPTIONAL
        priority    TYPE zde_priority_code_alg OPTIONAL
        status      TYPE zde_status_code_alg OPTIONAL
        uname       TYPE syuname OPTIONAL
        severity    TYPE if_abap_behv_message=>t_severity OPTIONAL.


    DATA:
      mv_attr1       TYPE string,
      mv_attr2       TYPE string,
      mv_attr3       TYPE string,
      mv_attr4       TYPE string,
      mv_title       TYPE zde_title_Alg,
      mv_description TYPE zde_description_alg,
      mv_priority    TYPE zde_priority_code_alg,
      mv_status      TYPE zde_status_code_alg.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_messages_incident_alg IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(  previous = previous ) .

    me->mv_attr1                 = attr1.
    me->mv_attr2                 = attr2.
    me->mv_attr3                 = attr3.
    me->mv_attr4                 = attr4.
    me->mv_title                 = title.
    me->mv_description           = description.
    me->mv_priority              = priority.
    me->mv_status                = status.
*    me->mv_uname                 = uname.


    if_abap_behv_message~m_severity = severity.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
