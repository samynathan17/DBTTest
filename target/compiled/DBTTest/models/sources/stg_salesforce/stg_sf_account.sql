


    WITH source AS (

    select * from salesforce.account 

    ),renamed as (
      select
        md5(cast(
    
    coalesce(cast(id as 
    varchar
), '')

 as 
    varchar
)) AS Account_ID,
        NAME AS Account_Name,
        TYPE AS Account_Type,
        ID AS Source_ID,
        IS_DELETED AS Active_Flag,
        ACCOUNT_NUMBER AS ACCOUNT_NUMBER,
        INDUSTRY AS INDUSTRY,
        ANNUAL_REVENUE AS ANNUAL_REVENUE,
        OWNER_ID AS OWNER_ID,
        'D_ACCOUNT_DIM_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
    FROM source
    )
    


select * from renamed