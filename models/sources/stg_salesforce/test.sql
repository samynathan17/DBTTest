
WITH source AS (

    select * from {{ var('salesforce_schema_name') }}.{{ var('salesforce_account_table_name') }} 

    ),renamed as (
      select 
      {{ convert_Varchar765('name') }} AS name ,
      {{ convert_boolean('IS_DELETED') }} AS is_dele,
      {{ convert_Number18('ANNUAL_REVENUE') }} AS reven
      
      
      from source

      
    ) 

 select * from renamed