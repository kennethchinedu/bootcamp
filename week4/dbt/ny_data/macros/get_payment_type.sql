{#
    This macro returns payment type name
#}

{% macro get_payment_type_name(payment_type) %}

    case {{payment_type}}
        WHEN 1 THEN 'Credit_card'
        WHEN 2 THEN 'Cash'
        WHEN 3 THEN 'Cheque'
        WHEN 4 THEN 'Dispute'
        WHEN 5 THEN 'Unknown'
        WHEN 6 THEN 'Voided trip'
    end

{% endmacro %}
