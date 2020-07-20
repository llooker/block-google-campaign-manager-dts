view: match_table_campaigns {
  sql_table_name: (select * from `db-platform-sol.Comcast8667.match_table_campaigns_8667` where _LATEST_DATE = _DATA_DATE) ;;

  dimension: advertiser_id {
    type: string
    hidden: yes
    sql: ${TABLE}.Advertiser_ID ;;
  }

  dimension: billing_invoice_code {
    type: string
    sql: ${TABLE}.Billing_Invoice_Code ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.Campaign ;;
  }

#   dimension: campaign_title {
#     type: string
#     sql: ${campaign_name} ;;
#     html:
#     <p><font color= "#4285F4"size="4.5" weight="bold"><i class="fa fa-eye" aria-hidden="true"></i> <strong>{{rendered_value}}</strong> </font></p>
#
#     ;;
#   }

  dimension_group: campaign_end {
    type: time
    datatype: yyyymmdd
    timeframes: [date, week, month, year]
    sql: ${TABLE}.Campaign_End_Date ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: string
    sql: ${TABLE}.Campaign_ID ;;
  }

  dimension_group: campaign_start {
    type: time
    datatype: yyyymmdd
    timeframes: [date, week, month, year]
    sql: ${TABLE}.Campaign_Start_Date ;;
  }
}
