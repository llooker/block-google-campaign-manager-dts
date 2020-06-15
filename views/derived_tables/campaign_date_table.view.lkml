view: campaign_date_table {
  derived_table: {
    persist_for: "12 hours"
    sql: SELECT Campaign_ID, Ad_ID, Date FROM (
        SELECT Ad_ID, Campaign_ID FROM match_table_ads_8667
          WHERE _DATA_DATE = _LATEST_DATE
        ), (
        SELECT DATE_ADD(  DATE_ADD(CURRENT_DATE(), INTERVAL - 31 DAY), INTERVAL i DAY) as Date
            FROM `fh-bigquery.geocode.numbers_65536` WHERE i <= ABS(
       DATE_DIFF(  DATE_ADD(CURRENT_DATE(), INTERVAL - 31 DAY), DATE_ADD(CURRENT_DATE(), INTERVAL - 1 DAY), DAY)
            ) # end DATE_DIFF / ABS
        )

      ORDER BY
        Date
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.Campaign ;;
  }

  dimension: campaign_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Campaign_ID ;;
  }

  dimension_group: calendar {
    type: time
    sql: TIMESTAMP(${TABLE}.Date) ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.Ad_ID ;;
  }

  set: detail {
    fields: [campaign, campaign_id, calendar_date]
  }
}
