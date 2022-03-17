view:  redaction_combined {
  derived_table: {
    sql:  SELECT User_ID,"Impression" AS File_Type FROM `@{PROJECT_NAME}.@{DATASET_NAME}.p_impression_@{CAMPAIGN_MANAGER_ID}`
            WHERE {% condition partition %}_PARTITIONTIME {% endcondition %}
          UNION ALL
          SELECT User_ID,"Click" AS File_Type FROM `@{PROJECT_NAME}.@{DATASET_NAME}.p_click_@{CAMPAIGN_MANAGER_ID}`
            WHERE {% condition partition %}_PARTITIONTIME {% endcondition %}
          UNION ALL
          SELECT User_ID,"Activity" AS File_Type FROM `@{PROJECT_NAME}.@{DATASET_NAME}.p_activity_@{CAMPAIGN_MANAGER_ID}`
            WHERE {% condition partition %}_PARTITIONTIME {% endcondition %}
      ;;
  }

  filter: partition {
    type: date
    default_value: "7 days"
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.User_ID ;;
  }

  dimension: file_type {
    type: string
    sql: ${TABLE}.File_Type ;;
  }

  dimension: redacted {
    type: yesno
    sql: ${user_id} = '0' ;;
  }

  dimension: filled {
    type: yesno
    sql: ${user_id} != '0' ;;
  }

  measure: total_count {
    type: count
  }

  measure: total_redacted {
    type: count
    filters: [redacted: "yes"]
  }

  measure: total_filled {
    type: count
    filters: [filled: "yes"]
  }

  measure: redaction_rate {
    type: number
    value_format_name: percent_2
    sql: 1.0*${total_redacted}/NULLIF(${total_count},0) ;;
  }

}
