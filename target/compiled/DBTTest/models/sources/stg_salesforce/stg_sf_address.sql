


    WITH source AS (
       select *  from salesforce.contact 
    ),renamed as(
    SELECT
        NULL AS Address_id,
        concat(MAILING_STREET,'|',OTHER_STREET) AS STREET,
        concat(MAILING_CITY,'|',OTHER_CITY) AS CITY,
        concat(MAILING_STATE,'|',OTHER_STATE) AS STATE,
        concat(MAILING_POSTAL_CODE,'|',OTHER_POSTAL_CODE) AS POSTAL_CODE,
        concat(MAILING_COUNTRY,'|',OTHER_COUNTRY) AS COUNTRY,
        NULL AS address_type,
        'D_ADDRESS_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
     FROM
        source
    )    
    


select * from renamed