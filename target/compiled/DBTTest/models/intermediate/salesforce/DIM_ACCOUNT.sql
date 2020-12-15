

with stg_account as (
 SELECT * FROM salesforce.account),AccountDIM
 as( 
    SELECT
    cast(md5(cast(
    
    coalesce(cast(id as 
    varchar
), '')

 as 
    varchar
)) as integer) as Acount_ID,
    cast(name as VARCHAR(765)) AS Account_Name,
    cast(type as VARCHAR(765)) AS Account_Type,
    cast(id as VARCHAR(18))AS Source_ID, 
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