CLASS zcl_4350_flight DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.


  METHODS constructor
      IMPORTING
                i_carrier_id    TYPE /dmo/carrier_id
                i_connection_id TYPE /dmo/connection_id
                i_plane_type    TYPE /dmo/plane_type_id
      RAISING   zcx_c_abapd_no_connection.


    DATA carrier_id TYPE /dmo/carrier_id READ-ONLY.
    DATA connection_id TYPE /dmo/connection_id READ-ONLY.
    DATA airport_from_id TYPE /dmo/airport_from_id READ-ONLY.
    DATA airport_to_id TYPE  /dmo/airport_to_id READ-ONLY.




  PROTECTED SECTION.

      DATA plane_type TYPE /dmo/plane_type_id.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_4350_flight IMPLEMENTATION.

METHOD constructor.

    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.
    me->plane_type = i_plane_type.

                SELECT SINGLE
                         FROM /dmo/connection
                       FIELDS airport_from_id, airport_to_id
                        WHERE carrier_id = @carrier_id
                          AND connection_id = @connection_id
                         INTO ( @airport_from_id,@airport_to_id ).

               IF sy-subrc <> 0.
                  RAISE EXCEPTION TYPE zcx_c_abapd_no_connection.
               ENDIF.

  ENDMETHOD.


ENDCLASS.
