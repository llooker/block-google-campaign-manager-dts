include: "//@{CONFIG_PROJECT_NAME}/views/date_comparison.view"

########### PRESENTATION LAYER ###########
view: date_comparison {
  extends: [date_comparison_config]
}

########### CORE LAYER ###########
view: date_comparison_core {
  extension: required

  parameter: comparison_type {
    label: "Date Range"
    view_label: "Date Comparison"
    type: unquoted
    allowed_value: {
      # label: "This Year vs Last Year to Date"
      label: "Last 7 Days"
      value: "seven"
    }
    allowed_value: {
      # label: "This Year vs Last Year to Date"
      label: "Last 14 Days"
      value: "fourteen"
    }
    allowed_value: {
      # label: "This Quarter vs Last Quarter to Date"
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
    # label: "No Compai"
    type: yesno
    sql: ${selected_comparison} LIKE '%Last%'  ;;
  }

  # dimension: last_7_days_vs_previous_7_days {
  #   view_label: "Date Comparison"
  #   type: string
  #   sql: CASE
  #       WHEN (( ${event_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -6 DAY)))) AND ${event_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -6 DAY), INTERVAL 7 DAY))))))
  #       THEN 'Last 7 Days'

  #       WHEN (( ${event_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY)))) AND ${event_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY), INTERVAL 7 DAY))))))
  #       THEN 'Prior 7 Days'
  #     END
  #     ;;
  # }

    dimension: last_7_days_vs_previous_7_days {
    view_label: "Date Comparison"
    type: string
    sql: CASE
        WHEN (( ${event_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -6 DAY)))) AND ${event_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -6 DAY), INTERVAL 7 DAY))))))
        THEN 'Last 7 Days'

        WHEN (( ${event_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY)))) AND ${event_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY), INTERVAL 7 DAY))))))
        THEN 'Prior 7 Days'
      END
      ;;
  }

  dimension: last_14_days_vs_previous_14_days {
    view_label: "Date Comparison"
    type: string
    sql: CASE
        WHEN (( ${event_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY)))) AND ${event_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY), INTERVAL 14 DAY))))))
        THEN 'Last 14 Days'

        WHEN (( ${event_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -27 DAY)))) AND ${event_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -27 DAY), INTERVAL 14 DAY))))))
        THEN 'Prior 14 Days'
      END
      ;;
  }

  dimension: last_30_days_vs_previous_30_days {
    view_label: "Date Comparison"
    type: string
    sql: CASE
        WHEN (( ${event_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -29 DAY)))) AND ${event_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -29 DAY), INTERVAL 30 DAY))))))
        THEN 'Last 30 Days'

        WHEN (( ${event_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -59 DAY)))) AND ${event_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -59 DAY), INTERVAL 30 DAY))))))
        THEN 'Prior 30 Days'
      END
      ;;
  }

  # 7 DAYS
  # (( ${created_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -6 DAY)))) AND ${created_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -6 DAY), INTERVAL 7 DAY))))))
  # (( ${created_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY)))) AND ${created_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY), INTERVAL 7 DAY))))))


  # 14 DAYS
  # (( ${created_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY)))) AND ${created_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -13 DAY), INTERVAL 14 DAY))))))
  # (( ${created_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -27 DAY)))) AND ${created_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -27 DAY), INTERVAL 14 DAY))))))


  # 30 DAYS
  # (( ${created_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -29 DAY)))) AND ${created_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -29 DAY), INTERVAL 30 DAY))))))
  # (( ${created_raw} >= ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -59 DAY)))) AND ${created_raw} < ((UNIX_SECONDS(TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -59 DAY), INTERVAL 30 DAY))))))



}
