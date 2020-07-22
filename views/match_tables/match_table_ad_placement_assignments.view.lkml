view: match_table_ad_placement_assignments {
  sql_table_name: (select * from `@{PROJECT_NAME}.@{DATASET_NAME}.match_table_ad_placement_assignments_@{CAMPAIGN_MANAGER_ID}` where _LATEST_DATE = _DATA_DATE) ;;

  dimension: ad_id {
    type: string
    sql: ${TABLE}.Ad_ID ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}.Placement_ID ;;
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${ad_id},'-',${placement_id}) ;;
  }
}
