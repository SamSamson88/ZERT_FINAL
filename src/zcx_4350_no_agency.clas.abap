CLASS zcx_4350_no_agency DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


  DATA agency_id TYPE /dmo/agency_id.

  constants:
    begin of ZCX_4350_NO_AGENCY,
      msgid type symsgid value 'ZC_ABAPD',
      msgno type symsgno value '002',
      attr1 type scx_attrname value 'AGENCY_ID',
      attr2 type scx_attrname value 'attr2',
      attr3 type scx_attrname value 'attr3',
      attr4 type scx_attrname value 'attr4',
    end of ZCX_4350_NO_AGENCY.




    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    METHODS constructor
      IMPORTING
      agency_id type /dmo/agency_id
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_4350_no_agency IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    previous = previous
    ).

    me->agency_id = agency_id.


    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
