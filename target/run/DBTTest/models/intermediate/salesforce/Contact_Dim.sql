
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_intermediate.Contact_Dim  as (
    with stg_contact as (

    SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_contact
),Contact_mapping as(
    SELECT
    ID AS contact_id,
    name AS contact_name,
    phone AS contact_number,
    email AS contact_email,
    NULL AS contact_address,
    NULL AS organization_id,
    NULL AS employee_id,
    account_id,
    NULL AS contact_age_group,
    NULL AS contact_income,
    NULL AS dependent,
    NULL AS contact_type,
    NULL AS active,
    'D_CALENDAR_DIM_LOAD' AS DW_SESSION_NM,
    
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
    FROM stg_contact
)

Select * from Contact_mapping
  );
