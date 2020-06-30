view: impression {
  sql_table_name: `db-platform-sol.Comcast8667.p_impression_8667` ;;


#   dimension: block_name {
#     type: string
#     sql: "DoubleClick" ;;
#     link: {
#       # url: "https://googlecloud.looker.com/dashboards/20"
#       url: "https://googlemarscisandbox.cloud.looker.com/dashboards/4"
#       label: "DoubleClick Dashboard"
#       icon_url: "http://www.looker.com/favicon.ico"
#     }
#   }

  dimension_group: impression {
    type: time
    timeframes: [raw, date, week, day_of_week, month, month_name, quarter, year]
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  measure: active_view_eligible_impressions {
    type: sum
    sql: ${TABLE}.Active_View_Eligible_Impressions ;;
  }

  dimension: pk {
    type: string
    sql: concat(${ad_id}, ${advertiser_id}, ${user_id}, cast(${TABLE}.Event_Time as string), ${event_type}, ${rendering_id}) ;;
    hidden: yes
    primary_key: yes
  }

  measure: count_impressions {
    type: count_distinct
    sql: ${pk} ;;
    drill_fields: [campaign_id, site_id_dcm]
#     drill_fields: [user_id, state_region, country_code, imrematch_table_ads.ad_name, match_table_ads.ad_type, match_table_campaigns.campaign_name]
  }

  measure: active_view_measurable_impressions {
    type: sum
    sql: ${TABLE}.Active_View_Measurable_Impressions ;;
  }

  measure: active_view_viewable_impressions {
    type: sum
    sql: ${TABLE}.Active_View_Viewable_Impressions ;;
  }

  #match_table_ads
  dimension: ad_id {
    type: string
    view_label: "Ads"
    sql: ${TABLE}.Ad_ID ;;
  }

  #match_table_advertisers
  dimension: advertiser_id {
    view_label: "Advertisers"
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

  #match_table_campaigns
  dimension: campaign_id {
    view_label: "Campaigns"
    type: string
    sql: ${TABLE}.Campaign_ID ;;
    link: {
      label: "Campaign Performance Dashboard for {{value}}"
      url: "/dashboards/5?Campaign%20ID={{value}}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "View in Campaign Manager"
      icon_url: "https://seeklogo.com/images/G/google-campaign-manager-logo-03026740FA-seeklogo.com.png"
      url: "https://www.google.com/dfa/trafficking"
    }
    action: {
      label: "Pause Campaign"
      url: "https://##/"
      icon_url: "https://cdn3.iconfinder.com/data/icons/shadcon/512/pause-512.png"
    }
    action: {
      label: "Update Campaign Bid"
      icon_url: "https://cdn1.iconfinder.com/data/icons/social-messaging-ui-color/254000/52-512.png"
      url: "https://##/"
      form_param: {
        name: "Campaign Id"
        type: string
        default: "{{value}}"
      }
      form_param: {
        name: "Campaign Name"
        type: string
        default: "{{match_table_campaigns.campaign_name._value}}"
      }
      form_param: {
        name: "Billing Code"
        type: string
        default: "{{match_table_campaigns.billing_invoice_code._value}}"
      }
      form_param: {
        name: "Start Date"
        type: string
        default: "{{match_table_campaigns.campaign_start_date._value}}"
      }
      form_param: {
        name: "End Date"
        type: string
        default: "{{match_table_campaigns.campaign_end_date._value}}"
      }

    }

  }

  #match_table_cities
  dimension: city_id {
    type: string
    sql: ${TABLE}.City_ID ;;
  }

  dimension: country_code {
    map_layer_name: countries
    sql: CASE WHEN ${TABLE}.Country_Code = 'UK' THEN 'GB' ELSE ${TABLE}.Country_Code END ;;
    drill_fields: [state_region,zip_postal_code]
  }

  dimension: creative_version {
    type: number
    sql: ${TABLE}.Creative_Version ;;
  }

  dimension: dbm_ad_position {
    type: number
    sql: ${TABLE}.DBM_Ad_Position ;;
  }

  dimension: dbm_advertiser_id {
    type: string
    sql: ${TABLE}.DBM_Advertiser_ID ;;
  }

  dimension: dbm_adx_page_categories {
    type: string
    sql: ${TABLE}.DBM_Adx_Page_Categories ;;
  }

  dimension: dbm_attributed_inventory_source_external_id {
    type: string
    sql: ${TABLE}.DBM_Attributed_Inventory_Source_External_ID ;;
  }

  dimension: dbm_attributed_inventory_source_is_public {
    type: yesno
    sql: ${TABLE}.DBM_Attributed_Inventory_Source_Is_Public ;;
  }

  dimension: dbm_auction_id {
    type: string
    sql: ${TABLE}.DBM_Auction_ID ;;
  }

  dimension: dbm_bid_price_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_Bid_Price_Advertiser_Currency ;;
  }

  dimension: dbm_bid_price_partner_currency {
    type: number
    sql: ${TABLE}.DBM_Bid_Price_Partner_Currency ;;
  }

  dimension: dbm_bid_price_usd {
    type: number
    sql: ${TABLE}.DBM_Bid_Price_USD ;;
  }

  dimension: dbm_billable_cost_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_Billable_Cost_Advertiser_Currency ;;
  }

  dimension: dbm_billable_cost_partner_currency {
    type: number
    sql: ${TABLE}.DBM_Billable_Cost_Partner_Currency ;;
  }

  dimension: dbm_billable_cost_usd {
    type: number
    sql: ${TABLE}.DBM_Billable_Cost_USD ;;
  }

  dimension: dbm_browser_platform_id {
    type: string
    sql: ${TABLE}.DBM_Browser_Platform_ID ;;
  }

  dimension: dbm_browser_timezone_offset_minutes {
    type: number
    sql: ${TABLE}.DBM_Browser_Timezone_Offset_Minutes ;;
  }

  dimension: dbm_city_id {
    type: string
    sql: ${TABLE}.DBM_City_ID ;;
  }

  dimension: dbm_country_code {
    type: string
    sql: ${TABLE}.DBM_Country_Code ;;
  }

  dimension: dbm_cpm_fee_1_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_1_Advertiser_Currency ;;
  }

  dimension: dbm_cpm_fee_1_partner_currency {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_1_Partner_Currency ;;
  }

  dimension: dbm_cpm_fee_1_usd {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_1_USD ;;
  }

  dimension: dbm_cpm_fee_2_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_2_Advertiser_Currency ;;
  }

  dimension: dbm_cpm_fee_2_partner_currency {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_2_Partner_Currency ;;
  }

  dimension: dbm_cpm_fee_2_usd {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_2_USD ;;
  }

  dimension: dbm_cpm_fee_3_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_3_Advertiser_Currency ;;
  }

  dimension: dbm_cpm_fee_3_partner_currency {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_3_Partner_Currency ;;
  }

  dimension: dbm_cpm_fee_3_usd {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_3_USD ;;
  }

  dimension: dbm_cpm_fee_4_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_4_Advertiser_Currency ;;
  }

  dimension: dbm_cpm_fee_4_partner_currency {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_4_Partner_Currency ;;
  }

  dimension: dbm_cpm_fee_4_usd {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_4_USD ;;
  }

  dimension: dbm_cpm_fee_5_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_5_Advertiser_Currency ;;
  }

  dimension: dbm_cpm_fee_5_partner_currency {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_5_Partner_Currency ;;
  }

  dimension: dbm_cpm_fee_5_usd {
    type: number
    sql: ${TABLE}.DBM_CPM_Fee_5_USD ;;
  }

  dimension: dbm_creative_id {
    type: string
    sql: ${TABLE}.DBM_Creative_ID ;;
  }

  dimension: dbm_data_fees_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_Data_Fees_Advertiser_Currency ;;
  }

  dimension: dbm_data_fees_partner_currency {
    type: number
    sql: ${TABLE}.DBM_Data_Fees_Partner_Currency ;;
  }

  dimension: dbm_data_fees_usd {
    type: number
    sql: ${TABLE}.DBM_Data_Fees_USD ;;
  }

  dimension: dbm_designated_market_area_dma_id {
    type: string
    sql: ${TABLE}.DBM_Designated_Market_Area_DMA_ID ;;
  }

  dimension: dbm_device_type {
    type: number
    sql: ${TABLE}.DBM_Device_Type ;;
  }

# slide34 - device type
  dimension: DBM_Device_Type_Name {
    type: string
    sql: CASE
          WHEN DBM_Device_Type=0 THEN "Computer"
          WHEN DBM_Device_Type=1 THEN "Other"
          WHEN DBM_Device_Type=2 THEN "Smartphone"
          WHEN DBM_Device_Type=3 THEN "Tablet"
          WHEN DBM_Device_Type=4 THEN "Smart TV"
          ELSE 'Unknown'
         END ;;
  }

  dimension: dbm_exchange_id {
    type: string
    sql: ${TABLE}.DBM_Exchange_ID ;;
  }

  dimension: dbm_insertion_order_id {
    type: number
    sql: ${TABLE}.DBM_Insertion_Order_ID ;;
  }

  dimension: dbm_isp_id {
    type: string
    sql: ${TABLE}.DBM_ISP_ID ;;
  }

  dimension: dbm_language {
    type: string
    sql: ${TABLE}.DBM_Language ;;
  }

  dimension: dbm_line_item_id {
    type: number
    sql: ${TABLE}.DBM_Line_Item_ID ;;
  }

  dimension: dbm_matching_targeted_keywords {
    type: string
    sql: ${TABLE}.DBM_Matching_Targeted_Keywords ;;
  }

  dimension: dbm_matching_targeted_segments {
    type: string
    sql: ${TABLE}.DBM_Matching_Targeted_Segments ;;
  }

  dimension: dbm_media_cost_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Cost_Advertiser_Currency ;;
  }

  dimension: dbm_media_cost_partner_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Cost_Partner_Currency ;;
  }

  dimension: dbm_media_cost_usd {
    type: number
    sql: ${TABLE}.DBM_Media_Cost_USD ;;
  }

  dimension: dbm_media_fee_1_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_1_Advertiser_Currency ;;
  }

  dimension: dbm_media_fee_1_partner_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_1_Partner_Currency ;;
  }

  dimension: dbm_media_fee_1_usd {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_1_USD ;;
  }

  dimension: dbm_media_fee_2_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_2_Advertiser_Currency ;;
  }

  dimension: dbm_media_fee_2_partner_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_2_Partner_Currency ;;
  }

  dimension: dbm_media_fee_2_usd {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_2_USD ;;
  }

  dimension: dbm_media_fee_3_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_3_Advertiser_Currency ;;
  }

  dimension: dbm_media_fee_3_partner_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_3_Partner_Currency ;;
  }

  dimension: dbm_media_fee_3_usd {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_3_USD ;;
  }

  dimension: dbm_media_fee_4_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_4_Advertiser_Currency ;;
  }

  dimension: dbm_media_fee_4_partner_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_4_Partner_Currency ;;
  }

  dimension: dbm_media_fee_4_usd {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_4_USD ;;
  }

  dimension: dbm_media_fee_5_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_5_Advertiser_Currency ;;
  }

  dimension: dbm_media_fee_5_partner_currency {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_5_Partner_Currency ;;
  }

  dimension: dbm_media_fee_5_usd {
    type: number
    sql: ${TABLE}.DBM_Media_Fee_5_USD ;;
  }

  dimension: dbm_mobile_make_id {
    type: string
    sql: ${TABLE}.DBM_Mobile_Make_ID ;;
  }

  dimension: dbm_mobile_model_id {
    type: string
    sql: ${TABLE}.DBM_Mobile_Model_ID ;;
  }

  dimension: dbm_net_speed {
    type: number
    sql: ${TABLE}.DBM_Net_Speed ;;
  }

  dimension: dbm_operating_system_id {
    type: string
    sql: ${TABLE}.DBM_Operating_System_ID ;;
  }

  dimension: dbm_request_time {
    type: number
    sql: ${TABLE}.DBM_Request_Time ;;
  }

  dimension: dbm_revenue_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_Revenue_Advertiser_Currency ;;
  }

  dimension: dbm_revenue_partner_currency {
    type: number
    sql: ${TABLE}.DBM_Revenue_Partner_Currency ;;
  }

  dimension: dbm_revenue_usd {
    type: number
    sql: ${TABLE}.DBM_Revenue_USD ;;
  }

  dimension: dbm_site_id {
    type: string
    sql: ${TABLE}.DBM_Site_ID ;;
  }

  dimension: dbm_state_region_id {
    type: string
    sql: ${TABLE}.DBM_State_Region_ID ;;
  }

  dimension: dbm_total_media_cost_advertiser_currency {
    type: number
    sql: ${TABLE}.DBM_Total_Media_Cost_Advertiser_Currency ;;
  }

  dimension: dbm_total_media_cost_partner_currency {
    type: number
    sql: ${TABLE}.DBM_Total_Media_Cost_Partner_Currency ;;
  }

  dimension: dbm_total_media_cost_usd {
    type: number
    sql: ${TABLE}.DBM_Total_Media_Cost_USD ;;
  }

  dimension: dbm_url {
    type: string
    sql: ${TABLE}.DBM_URL ;;
  }

  # slide35 - URLs & Domains
  dimension: domain {
    type: string
    sql: REGEXP_EXTRACT(${dbm_url}, r"(?:https?:\/\/)?(?:[^@\/\n]+@)?(?:www\.)?([^:\/\n]+)") ;;
  }


  dimension: dbm_view_state {
    type: string
    sql: ${TABLE}.DBM_View_State ;;
  }

  dimension: dbm_zip_postal_code {
    type: string
    sql: ${TABLE}.DBM_ZIP_Postal_Code ;;
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
    sql: CAST(${TABLE}.Event_Time/1000000 as INT64) ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.Event_Type ;;
  }

  dimension: operating_system_id {
    type: string
    sql: ${TABLE}.Operating_System_ID ;;
  }

  dimension: operating_system_id_key {
    type: number
    sql: IF(CAST(${operating_system_id} AS INT64) > 22,
       CAST(${operating_system_id} AS INT64),
       POWER(2,CAST(${operating_system_id} AS INT64))) ;;

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

  dimension: site_id_dcm {
    type: string
    sql: ${TABLE}.Site_ID_DCM ;;
  }

  dimension: state_region {
    map_layer_name: us_states
    sql: ${TABLE}.State_Region ;;
    drill_fields: [zip_postal_code]
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
    type: zipcode
    sql: ${TABLE}.ZIP_Postal_Code ;;
    map_layer_name: us_zipcode_tabulation_areas
  }

  measure: count {
    type: count
    drill_fields: [campaign_id, site_id_dcm]
#     drill_fields: [ user_id, state_region, country_code, imrematch_table_ads.ad_name, match_table_ads.ad_type, match_table_campaigns.campaign_name]
  }

  measure: distinct_users {
    label: "Reach Count"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [user_id, state_region, country_code]
  }

#   Seems to be several ways to calc Reach/Frequency. Need to confirm
  measure: reach_percentage {
    type: number
    sql: 1.0*${distinct_users}/NULLIF(${count},0) ;;
    value_format_name: percent_2
  }

  measure: average_frequency {
    type: number
    sql: 1.0*${count}/${distinct_users} ;;
    value_format_name: decimal_2
  }


  measure: campaign_count {
    type: count_distinct
    sql: ${campaign_id} ;;
    drill_fields: [campaign_id, match_table_campaigns.campaign_name, count, distinct_users]
  }

  measure: impressions_per_user {
    type: number
    sql: ${count_impressions}/NULLIF(${distinct_users},0) ;;
    value_format_name: decimal_1
    drill_fields: [campaign_id, site_id_dcm]
  }

  measure: ad_count {
    type: count_distinct
    sql: ${ad_id} ;;
    drill_fields: [ad_id, match_table_ads.ad_name, match_table_ads.ad_type, count, distinct_users]
  }
}
