with stg_account as (
 SELECT * FROM salesforce.account),AccountDIM
 as( 
    SELECT
    name AS Account_Name,
    type AS Account_Type,
    id AS Source_ID, 
    IS_DELETED as Active_Flag,
    ACCOUNT_NUMBER as ACCOUNT_NUMBER,
    INDUSTRY as INDUSTRY,
    ANNUAL_REVENUE as ANNUAL_REVENUE,
    OWNER_ID as OWNER_ID,
    'D_ACCOUNT_DIM_LOAD' AS DW_SESSION_NM,
    
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
    FROM stg_account
    )

SELECT * FROM AccountDIM