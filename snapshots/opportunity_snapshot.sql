{% snapshot opportunity_snapshot_check %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='id',
          check_cols=['account_id', 'owner_id','created_date','last_modified_date','stage_name','forecast_category'],
        )
    }}

    select * from {{ var('salesforce_schema_name') }}.{{ var('salesforce_opportunity_table_name') }}

{% endsnapshot %}