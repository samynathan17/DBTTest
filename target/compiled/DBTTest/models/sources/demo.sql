
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  
  SELECT *
  FROM (
    WITH OPPORTUNITY AS (
       select *  from SALESFORCE_RK.opportunity 
    )
    ,renamed as(      
    SELECT         
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS Type,
        cast ('Initial version' as varchar(100)) AS opp_account_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_customer_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.stage_name AS opp_stage_name,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY     
        )  
  )
where ACCOUNT_ID ='0017000000uJA86AAG'
  