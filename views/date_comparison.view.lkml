view: date_comparison {
  extension: required

    parameter: comparison_type {
      label: "Date Range"
      view_label: "Date Comparison"
      type: unquoted
      allowed_value: {
        label: "Last 7 Days"
        value: "seven"
      }
      allowed_value: {
        label: "Last 14 Days"
        value: "fourteen"
      }
      allowed_value: {
        label: "Last 30 Days"
        value: "thirty"
      }
      default_value: "seven"
    }

    dimension: selected_comparison {
      view_label: "Date Comparison"
      sql: {% if comparison_type._parameter_value == "seven" %}
            ${last_7_days_vs_previous_7_days}
            {% elsif comparison_type._parameter_value == "fourteen" %}
            ${last_14_days_vs_previous_14_days}
            {% elsif comparison_type._parameter_value == "thirty" %}
            ${last_30_days_vs_previous_30_days}
            {% else %}
            0
            {% endif %};;
    }

    dimension: no_comparison {
      view_label: "Date Comparison"
      type: yesno
      sql: ${selected_comparison} LIKE '%Last%'  ;;
    }


    dimension: last_7_days_vs_previous_7_days {
      view_label: "Date Comparison"
      type: string
      sql: CASE
          WHEN (( ${TABLE}._PARTITIONTIME >= (TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -6 DAY))) AND ${TABLE}._PARTITIONTIME < (TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -6 DAY), INTERVAL 7 DAY)))
          THEN 'Last 7 Days'

          WHEN (( ${TABLE}._PARTITIONTIME >= (TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY))) AND ${TABLE}._PARTITIONTIME < (TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY), INTERVAL 7 DAY)))
          THEN 'Prior 7 Days'
        END
        ;;
    }


    dimension: last_14_days_vs_previous_14_days {
      view_label: "Date Comparison"
      type: string
      sql: CASE
          WHEN (( ${TABLE}._PARTITIONTIME >= (TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY))) AND ${TABLE}._PARTITIONTIME < (TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY), INTERVAL 14 DAY)))
          THEN 'Last 14 Days'

          WHEN (( ${TABLE}._PARTITIONTIME >= (TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -27 DAY))) AND ${TABLE}._PARTITIONTIME < (TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -27 DAY), INTERVAL 14 DAY)))
          THEN 'Prior 14 Days'
        END
        ;;
    }


    dimension: last_30_days_vs_previous_30_days {
      view_label: "Date Comparison"
      type: string
      sql: CASE
          WHEN (( ${TABLE}._PARTITIONTIME >= (TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -29 DAY))) AND ${TABLE}._PARTITIONTIME < (TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -29 DAY), INTERVAL 30 DAY)))
          THEN 'Last 30 Days'

          WHEN (( ${TABLE}._PARTITIONTIME >= (TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -59 DAY))) AND ${TABLE}._PARTITIONTIME < (TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -59 DAY), INTERVAL 30 DAY)))
          THEN 'Prior 30 Days'
        END
        ;;
    }
  }
