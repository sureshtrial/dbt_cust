{% macro set_date_input_format() %}
  ALTER SESSION SET DATE_INPUT_FORMAT = 'MM-DD-YYYY';
{% endmacro %}
