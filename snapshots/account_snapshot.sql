{% snapshot account_snapshot_check %}

    {{
        config(
          target_schema='snapshots',
          strategy='timestamp',
          unique_key='id',
          updated_at='last_modified_date',
        )
    }}

    select * from {{ var('salesforce_schema_name') }}.{{ var('salesforce_account_table_name') }}

{% endsnapshot %}