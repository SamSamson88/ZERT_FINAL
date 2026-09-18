CLASS lhc_zr_z4350travel DEFINITION
  INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_global_authorizations
      FOR GLOBAL AUTHORIZATION
      IMPORTING
        REQUEST requested_authorizations FOR ZrZ4350travel
      RESULT result.

    METHODS setInitialStatus
      FOR DETERMINE ON SAVE
      IMPORTING
        keys FOR ZrZ4350travel~setInitialStatus.

ENDCLASS.


CLASS lhc_zr_z4350travel IMPLEMENTATION.

  METHOD get_global_authorizations.

  ENDMETHOD.


  METHOD setInitialStatus.

    DATA travels_upd TYPE TABLE FOR UPDATE zr_z4350travel.

    READ ENTITIES OF zr_z4350travel IN LOCAL MODE
      ENTITY zrz4350travel
      FIELDS ( Status )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    LOOP AT travels ASSIGNING FIELD-SYMBOL(<travel>).

      <travel>-Status = 'N'.

    ENDLOOP.

    travels_upd = CORRESPONDING #( travels ).

    MODIFY ENTITIES OF zr_z4350travel IN LOCAL MODE
      ENTITY zrz4350travel
      UPDATE FIELDS ( Status )
      WITH travels_upd
      REPORTED DATA(reported_records).

    reported-zrz4350travel =
      CORRESPONDING #( reported_records-zrz4350travel ).

  ENDMETHOD.

ENDCLASS.
