{% macro day_diff(minuend, subtrahend) %}
    DATE_DIFF({{minuend}}, {{subtrahend}}, DAY)
{% endmacro %}