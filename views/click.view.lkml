include: "date_comparison.view"
include: "//@{CONFIG_PROJECT_NAME}/views/click.view"

########### PRESENTATION LAYER ###########
view: click {
  extends: [click_config]
}


########### CORE LAYER ###########
view: click_core {
  sql_table_name: `@{PROJECT_NAME}.@{DATASET_NAME}.p_click_@{CAMPAIGN_MANAGER_ID}`;;
  extends: [date_comparison]
  extension: required


  dimension_group: click {
    type: time
    timeframes: [raw, date, week, day_of_week, month, month_name, quarter, year]
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.Ad_ID ;;
  }

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.Advertiser_ID ;;
  }

  dimension: browser_platform_id {
    type: string
    sql: ${TABLE}.Browser_Platform_ID ;;
  }

  dimension: browser_platform_version {
    type: string
    sql: ${TABLE}.Browser_Platform_Version ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.Campaign_ID ;;
  }

  dimension: city_id {
    type: string
    sql: ${TABLE}.City_ID ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.Country_Code ;;
  }

  dimension: creative_version {
    type: number
    sql: ${TABLE}.Creative_Version ;;
  }

  dimension: designated_market_area_dma_id {
    type: string
    sql: ${TABLE}.Designated_Market_Area_DMA_ID ;;
  }

  dimension: event_sub_type {
    type: string
    sql: ${TABLE}.Event_Sub_Type ;;
  }

  dimension_group: event {
    type: time
    datatype: epoch
    sql: ${TABLE}.Event_Time/1000000 ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.Event_Type ;;
  }

  dimension: operating_system_id {
    type: string
    sql: ${TABLE}.Operating_System_ID ;;
  }

  dimension: partner1_id {
    type: string
    sql: ${TABLE}.Partner1_ID ;;
  }

  dimension: partner2_id {
    type: string
    sql: ${TABLE}.Partner2_ID ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}.Placement_ID ;;
  }

  dimension: rendering_id {
    type: string
    sql: ${TABLE}.Rendering_ID ;;
  }

  dimension: segment_value_1 {
    type: string
    sql: ${TABLE}.Segment_Value_1 ;;
  }

  dimension: site_id_dcm {
    type: string
    sql: ${TABLE}.Site_ID_DCM ;;
  }

  dimension: state_region {
    type: string
    sql: ${TABLE}.State_Region ;;
  }

  dimension: u_value {
    type: string
    sql: ${TABLE}.U_Value ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.User_ID ;;
  }

  dimension: zip_postal_code {
    type: string
    sql: ${TABLE}.ZIP_Postal_Code ;;
  }

  measure: count {
    type: count
    drill_fields: [match_table_campaigns.campaign_name, count]
    value_format:"[<1000]0.00;[<1000000]0.00,\" K\";0.00,,\" M\""
  }
}
