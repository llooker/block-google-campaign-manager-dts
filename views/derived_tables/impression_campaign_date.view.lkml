# include: "impression.view.lkml"
# view: impression_campaign_date {
#   extends: [impression]
#   sql_table_name: ( SELECT * FROM
#     `ekoblov-test.dcm1684.impression_1684` WHERE
#     {% condition campaign_date_table.calendar_date %} TIMESTAMP(_DATA_DATE) {% endcondition %}
#     )
#      ;;
# }

include: "/**/impression.view.lkml"
view: impression_campaign_date {
  extends: [impression]
  sql_table_name: ( SELECT * FROM
    ${impression.SQL_TABLE_NAME} WHERE
    {% condition campaign_date_table.calendar_date %} TIMESTAMP(_DATA_DATE) {% endcondition %}
    )
     ;;
}
