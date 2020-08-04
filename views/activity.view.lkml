include: "date_comparison.view"
include: "/views/dv360/activity_dv360.view"
include: "//@{CONFIG_PROJECT_NAME}/views/activity.view.lkml"

########### PRESENTATION LAYER ###########
view: activity {
  extends: [activity_config, activity_dv360]
}


########### CORE LAYER ###########
view: activity_core {
  sql_table_name: `@{PROJECT_NAME}.@{DATASET_NAME}.p_activity_@{CAMPAIGN_MANAGER_ID}` ;;
  extends: [date_comparison]
  extension: required

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, day_of_week, month, month_name, quarter, year]
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: concat(${activity_id}, ${ad_id}, ${advertiser_id}, ${user_id}, cast(${TABLE}.Event_Time as string), ${event_type}, ${rendering_id}) ;;
  }

  measure: count_activities {
    type: count_distinct
    sql: ${pk} ;;
  }

  dimension: activity_id {
    type: string
    sql: ${TABLE}.Activity_ID ;;
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

  dimension: conversion_id {
    type: string
    sql: ${TABLE}.Conversion_ID ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.Country_Code ;;
  }

  dimension: creative_version {
    type: number
    sql: ${TABLE}.Creative_Version ;;
  }

  dimension: event_sub_type {
    type: string
    sql: ${TABLE}.Event_Sub_Type ;;
  }

  dimension_group: event {
    type: time
    datatype: epoch
    sql: CAST(${TABLE}.Event_Time/1000000 as INT64) ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.Event_Type ;;
  }

  dimension: floodlight_configuration {
    type: string
    sql: ${TABLE}.Floodlight_Configuration ;;
  }

  dimension_group: interaction {
    type: time
    datatype: epoch
    sql: INTEGER(${TABLE}.Interaction_Time)/1000000 ;;
  }

  dimension: operating_system_id {
    type: string
    sql: ${TABLE}.Operating_System_ID ;;
  }

  dimension: ord_value {
    type: string
    sql: ${TABLE}.ORD_Value ;;
  }

  dimension: other_data {
    type: string
    sql: ${TABLE}.Other_Data ;;
  }

  dimension: product_purchased {
    type: string
    sql: TRIM(REGEXP_EXTRACT(${other_data}, r"u4=(.+?);")) ;;
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

  dimension: tran_value {
    type: string
    sql: ${TABLE}.TRAN_Value ;;
  }

  dimension: u_value {
    type: string
    sql: ${TABLE}.U_Value ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.User_ID ;;
  }


  ### Measures
  measure: count {
    type: count
    drill_fields: [match_table_campaigns.campaign_name, count]
  }

  measure: distinct_users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: total_conversions {
    type: sum
    sql: ${TABLE}.Total_Conversions ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.Total_Revenue ;;
  }

}
