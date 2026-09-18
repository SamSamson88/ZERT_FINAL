CLASS zcl_4350_agency_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_agency IMPORTING i_agency        TYPE /dmo/agency_id
                       RETURNING VALUE(r_agency) TYPE zc_abapd_agency

                       RAISING   zcx_4350_no_agency.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_4350_AGENCY_MODEL IMPLEMENTATION.


  METHOD get_agency.
    SELECT SINGLE FROM zc_abapd_agency
    FIELDS *
    WHERE agencyId = @i_agency
    INTO @r_agency.

* To Do: Add suitable error handling if no data is returned

IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_4350_no_agency( agency_id = i_agency
                                            textid    = zcx_4350_no_agency=>zcx_4350_no_agency ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
