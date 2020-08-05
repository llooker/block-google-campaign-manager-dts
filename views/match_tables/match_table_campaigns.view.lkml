include: "//@{CONFIG_PROJECT_NAME}/views/match_tables/match_table_campaigns.view"

########### PRESENTATION LAYER ###########
view: match_table_campaigns {
  extends: [match_table_campaigns_config]
}

########### CORE LAYER ###########
view: match_table_campaigns_core {
  sql_table_name: (select * from `@{PROJECT_NAME}.@{DATASET_NAME}.match_table_campaigns_@{CAMPAIGN_MANAGER_ID}` where _LATEST_DATE = _DATA_DATE) ;;

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
