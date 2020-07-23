include: "//@{CONFIG_PROJECT_NAME}/views/redaction_combined.view"

########### PRESENTATION LAYER ###########
view:  redaction_combined {
  extends: [redaction_combined_config]
}

########### CORE LAYER ###########
view: redaction_combined_core {
  derived_table: {
    sql:  SELECT User_ID,"Impression" AS File_Type FROM `db-platform-sol.Comcast8667.p_impression_8667`
            WHERE {% condition partition %}_PARTITIONTIME {% endcondition %}
          UNION ALL
          SELECT User_ID,"Click" AS File_Type FROM `db-platform-sol.Comcast8667.p_click_8667`
            WHERE {% condition partition %}_PARTITIONTIME {% endcondition %}
          UNION ALL
          SELECT User_ID,"Activity" AS File_Type FROM `db-platform-sol.Comcast8667.p_activity_8667`
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
#     sql: ${user_id} ;;
  }

  measure: total_redacted {
    type: count
#     sql: ${user_id} ;;
    filters: [redacted: "yes"]
  }

  measure: total_filled {
    type: count
#     sql: ${user_id} ;;
    filters: [filled: "yes"]
  }

  measure: redaction_rate {
    type: number
    value_format_name: percent_2
    sql: 1.0*${total_redacted}/NULLIF(${total_count},0) ;;
  }

}
