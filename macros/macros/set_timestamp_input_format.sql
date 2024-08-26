{% macro set_timestamp_input_format() %}
  ALTER SESSION SET TIMESTAMP_INPUT_FORMAT = 'MM-DD-YYYY HH24:MI:SS';
{% endmacro %}
