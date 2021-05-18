


    WITH contact AS (
       select *  from DBT_TEST_LIVEDATA_RK.contact 
    ),User AS (
        select *  from DBT_TEST_LIVEDATA_RK.user
    ),renamed as(
      SELECT 
        md5(cast(
    
    coalesce(cast(contact.id as 
    varchar
), '')

 as 
    varchar
)) AS contact_id, 
        contact.salutation AS salutation, 
        contact. NAME AS contact_name, 
        contact.last_name AS last_name, 
        contact.first_name AS first_name, 
        contact.phone AS contact_number, 
        contact.mobile_phone AS mobile_phone, 
        contact.home_phone AS home_phone, 
        contact.email AS contact_email, 
        contact.id AS source_id, 
        contact.department AS department, 
        contact.lead_source AS lead_source, 
        user.COMPANY_NAME AS organization_id, 
        user.ID AS employee_id, 
        contact.account_id AS account_id, 
        NULL AS contact_age_group, 
        NULL AS contact_income, 
        NULL AS dependent, 
        NULL AS contact_type, 
        contact.IS_DELETED AS active, 
        contact.OWNER_ID AS owner_id,
        'D_CONTACT_DIM_LOAD' AS dw_session_nm, 
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
     FROM 
       contact
       left join user on contact.id = user.CONTACT_ID
    )    
    


select * from renamed