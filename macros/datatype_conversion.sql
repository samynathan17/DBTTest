
{% macro cents_to_dollars(column_name, precision=2) %}
    ({{ column_name }} / 100)::numeric(16, {{ precision }})
{% endmacro %}
{% macro convert_integer(column_name) %}
    cast({{ column_name }} as {{ dbt_utils.type_int() }})
{% endmacro %}

{% macro convert_datetime(column_name) %}
    cast({{ column_name }} as datetime)
{% endmacro %}

{% macro convert_Varchar765(column_name) %}
    cast({{ column_name }} as Varchar(765))
{% endmacro %}

{% macro convert_Varchar18(column_name) %}
    cast({{ column_name }} as Varchar(18))
{% endmacro %}

{% macro convert_Varchar120(column_name) %}
    cast({{ column_name }} as Varchar(120))
{% endmacro %}

{% macro convert_Varchar100(column_name) %}
    cast({{ column_name }} as Varchar(100))
{% endmacro %}

{% macro convert_Number18(column_name) %}
    cast({{ column_name }} as Number(18,0))
{% endmacro %}

{% macro convert_boolean(column_name) %}
    cast({{ column_name }} as BOOLEAN)
{% endmacro %}


