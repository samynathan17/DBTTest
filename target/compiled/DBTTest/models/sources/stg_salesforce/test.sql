WITH source AS (

    select * from salesforce.account 

    ),renamed as (
      select 
      
    cast(name as Varchar(765))
 AS name ,
      
    cast(IS_DELETED as BOOLEAN)
 AS is_dele,
      
    cast(ANNUAL_REVENUE as Number(18,0))
 AS reven
      
      
      from source

      
    ) 

 select * from renamed