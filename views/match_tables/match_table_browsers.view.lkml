view: match_table_browsers {
  sql_table_name: (select * from `db-platform-sol.Comcast8667.match_table_browsers_8667` where _LATEST_DATE = _DATA_DATE) ;;

  dimension: browser_platform {
    type: string
    sql: ${TABLE}.Browser_Platform ;;
  }

  dimension: browser_platform_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.Browser_Platform_ID ;;
  }
}
