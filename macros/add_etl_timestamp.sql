{% macro add_etl_timestamp() %}
    CURRENT_TIMESTAMP as etl_timestamp_utc
{% endmacro %}