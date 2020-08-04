include: "//@{CONFIG_PROJECT_NAME}/views/dv360/*"

view: impression_pdt {
  derived_table: {
    datagroup_trigger: new_day
    sql: select TIMESTAMP_SECONDS(CAST(Event_Time/1000000 as INT64) ) as impression_time
            , campaign_id

                , dbm_advertiser_id
                , dbm_insertion_order_id
                , dbm_line_item_id
                , dbm_site_id
                , dbm_exchange_id
                , dbm_auction_id
                , dbm_attributed_inventory_source_is_public
                --, dbm_matching_targeted_segments
                , IFNULL(dbm_designated_market_area_dma_id,'Unknown') as dbm_designated_market_area_dma_id
                , IFNULL(dbm_zip_postal_code,'Unknown') as dbm_zip_postal_code
                , IFNULL(dbm_state_region_id, 'Unknown') as dbm_state_region_id
                , IFNULL(DBM_Matching_Targeted_Segments, 'Unknown') as DBM_Matching_Targeted_Segments
                , IFNULL(DBM_Device_Type,-1) as DBM_Device_Type
                , IFNULL(DBM_Browser_Platform_ID,'Unknown') as DBM_Browser_Platform_ID
                , SUM(dbm_revenue_usd) as total_revenue
                , count(*) as total_impressions
                -- sum(dbm_total_media_cost_usd) as total_media_cost
                -- TO DO: confirm we can use active view measureable impressions
                ,sum(active_view_viewable_impressions) as active_view_viewable_impressions
                ,sum(active_view_measurable_impressions) as active_view_measurable_impressions
                ,sum(active_view_eligible_impressions) as active_view_eligible_impression
            from ${impression.SQL_TABLE_NAME}
            where _PARTITIONTIME > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY))
            and dbm_advertiser_id is not null

            group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
;;
  }
}

view: click_pdt {
  derived_table: {
    datagroup_trigger: new_day
    sql: select
          campaign_id
                      -- TO DO: THIS NEEDS TO CHANGE TO dbm_campaign_id
                      , dbm_advertiser_id
                      , dbm_insertion_order_id
                      , dbm_line_item_id
                      , dbm_site_id
                      , dbm_exchange_id
                      , dbm_auction_id
                      , dbm_attributed_inventory_source_is_public
                    -- , dbm_matching_targeted_segments
                      , IFNULL(dbm_designated_market_area_dma_id,'Unknown') as dbm_designated_market_area_dma_id
                      , IFNULL(dbm_zip_postal_code,'Unknown') as dbm_zip_postal_code
                      , IFNULL(dbm_state_region_id, 'Unknown') as dbm_state_region_id
                      , IFNULL(DBM_Matching_Targeted_Segments, 'Unknown') as DBM_Matching_Targeted_Segments
                      , IFNULL(DBM_Device_Type,-1) as DBM_Device_Type
                      , IFNULL(DBM_Browser_Platform_ID,'Unknown') as DBM_Browser_Platform_ID
                      , count(*) as count_clicks
                  from ${click.SQL_TABLE_NAME}
                  where _PARTITIONTIME > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY))
                  and dbm_advertiser_id is not null

                  group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14
      ;;
  }
}

view: activity_pdt {
  derived_table: {
    datagroup_trigger: new_day
    sql: select
          campaign_id
                      -- TO DO: THIS NEEDS TO CHANGE TO dbm_campaign_id
                      , dbm_advertiser_id
                      , dbm_insertion_order_id
                      , dbm_line_item_id
                      , dbm_site_id
                      , dbm_exchange_id
                      , dbm_auction_id
                      , dbm_attributed_inventory_source_is_public
                      --, dbm_matching_targeted_segments
                      , IFNULL(dbm_designated_market_area_dma_id,'Unknown') as dbm_designated_market_area_dma_id
                      , IFNULL(dbm_zip_postal_code,'Unknown') as dbm_zip_postal_code
                      , IFNULL(dbm_state_region_id, 'Unknown') as dbm_state_region_id
                      , IFNULL(DBM_Matching_Targeted_Segments, 'Unknown') as DBM_Matching_Targeted_Segments
                      , IFNULL(DBM_Device_Type,-1) as DBM_Device_Type
                      , IFNULL(DBM_Browser_Platform_ID,'Unknown') as DBM_Browser_Platform_ID
                      , count(*) as count_conversions
                      from ${activity.SQL_TABLE_NAME}

                      where event_type = 'CONVERSION'
                    and _PARTITIONTIME > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY))
                    and dbm_advertiser_id is not null

                      group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14
      ;;
  }
}

view: impression_funnel_dv360 {
  extends: [impression_funnel_dv360_config]
}

view: impression_funnel_dv360_core {
  extension: required
  derived_table: {
    datagroup_trigger: new_day
    partition_keys: ["impression_time"]
    sql: select line_item_impression_metrics.*
          ,line_item_click_metrics.count_clicks as count_clicks
          ,line_item_activity_metrics.count_conversions as count_conversions
          from ${impression_pdt.SQL_TABLE_NAME} line_item_impression_metrics
          left join ${click_pdt.SQL_TABLE_NAME} line_item_click_metrics

                      -- TO DO: THIS NEEDS TO CHANGE TO dbm_campaign_id
          on line_item_impression_metrics.campaign_id = line_item_click_metrics.campaign_id
          and line_item_impression_metrics.dbm_advertiser_id = line_item_click_metrics.dbm_advertiser_id
          and line_item_impression_metrics.dbm_insertion_order_id = line_item_click_metrics.dbm_insertion_order_id
          and line_item_impression_metrics.dbm_line_item_id = line_item_click_metrics.dbm_line_item_id
          and line_item_impression_metrics.dbm_site_id = line_item_click_metrics.dbm_site_id
          and line_item_impression_metrics.dbm_exchange_id = line_item_click_metrics.dbm_exchange_id
          and line_item_impression_metrics.dbm_auction_id = line_item_click_metrics.dbm_auction_id
          and line_item_impression_metrics.dbm_attributed_inventory_source_is_public = line_item_click_metrics.dbm_attributed_inventory_source_is_public
        --and line_item_impression_metrics.dbm_matching_targeted_segments = line_item_click_metrics.dbm_matching_targeted_segments
          and line_item_impression_metrics.dbm_designated_market_area_dma_id = line_item_click_metrics.dbm_designated_market_area_dma_id
          and line_item_impression_metrics.dbm_zip_postal_code = line_item_click_metrics.dbm_zip_postal_code
          and line_item_impression_metrics.dbm_state_region_id = line_item_click_metrics.dbm_state_region_id
          and line_item_impression_metrics.DBM_Matching_Targeted_Segments = line_item_click_metrics.DBM_Matching_Targeted_Segments
          and line_item_impression_metrics.DBM_Device_Type = line_item_click_metrics.DBM_Device_Type
          and line_item_impression_metrics.DBM_Browser_Platform_ID = line_item_click_metrics.DBM_Browser_Platform_ID
          left join ${activity_pdt.SQL_TABLE_NAME} line_item_activity_metrics

                      -- TO DO: THIS NEEDS TO CHANGE TO dbm_campaign_id
          on line_item_impression_metrics.campaign_id = line_item_activity_metrics.campaign_id
          and line_item_impression_metrics.dbm_advertiser_id = line_item_activity_metrics.dbm_advertiser_id
          and line_item_impression_metrics.dbm_insertion_order_id = line_item_activity_metrics.dbm_insertion_order_id
          and line_item_impression_metrics.dbm_line_item_id = line_item_activity_metrics.dbm_line_item_id
          and line_item_impression_metrics.dbm_site_id = line_item_activity_metrics.dbm_site_id
          and line_item_impression_metrics.dbm_exchange_id = line_item_activity_metrics.dbm_exchange_id
          and line_item_impression_metrics.dbm_auction_id = line_item_activity_metrics.dbm_auction_id
          and line_item_impression_metrics.dbm_attributed_inventory_source_is_public = line_item_activity_metrics.dbm_attributed_inventory_source_is_public
        -- and line_item_impression_metrics.dbm_matching_targeted_segments = line_item_activity_metrics.dbm_matching_targeted_segments
          and line_item_impression_metrics.dbm_designated_market_area_dma_id = line_item_activity_metrics.dbm_designated_market_area_dma_id
          and line_item_impression_metrics.dbm_zip_postal_code = line_item_activity_metrics.dbm_zip_postal_code
          and line_item_impression_metrics.dbm_state_region_id = line_item_activity_metrics.dbm_state_region_id
          and line_item_impression_metrics.DBM_Matching_Targeted_Segments = line_item_activity_metrics.DBM_Matching_Targeted_Segments
          and line_item_impression_metrics.DBM_Device_Type = line_item_activity_metrics.DBM_Device_Type
          and line_item_impression_metrics.DBM_Browser_Platform_ID = line_item_activity_metrics.DBM_Browser_Platform_ID
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: impression {
    type: time
    sql:${TABLE}.impression_time ;;
  }

  dimension: dbm_advertiser_id {
    type: string
    sql: ${TABLE}.dbm_advertiser_id ;;
  }

  dimension: dbm_device_type {
    type: number
    sql: ${TABLE}.DBM_Device_Type ;;
  }

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

  dimension: dbm_browser_platform_id {
    type: string
    sql: ${TABLE}.DBM_Browser_Platform_ID ;;
  }

  dimension: dbm_site_id {
    type: string
    sql: ${TABLE}.dbm_site_id ;;
  }

  dimension: dbm_exchange_id {
    type: string
    sql: ${TABLE}.dbm_exchange_id ;;
  }

  dimension: dbm_auction_id {
    type: string
    sql: ${TABLE}.dbm_auction_id ;;
  }

  dimension: dbm_attributed_inventory_source_is_public {
    type: string
    sql: ${TABLE}.dbm_attributed_inventory_source_is_public ;;
  }

  dimension: dbm_matching_targeted_segments {
    type: string
    sql: ${TABLE}.dbm_matching_targeted_segments ;;
  }

  dimension: dbm_zip_postal_code {
    type: string
    sql: ${TABLE}.dbm_zip_postal_code ;;
  }

  dimension: dbm_state_region_id {
    type: string
    sql: ${TABLE}.dbm_state_region_id ;;
  }

  dimension: count_conversions {
    type: number
    sql: ${TABLE}.count_conversions ;;
  }

  dimension: count_clicks {
    type: number
    sql: ${TABLE}.count_clicks ;;
  }

  dimension: count_impressions {
    type: number
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: active_view_viewable_impressions_d {
    type: number
    sql: ${TABLE}.active_view_viewable_impressions ;;
  }

  dimension: active_view_measurable_impressions_d {
    type: number
    sql: ${TABLE}.active_view_measurable_impressions ;;
  }

  dimension: active_view_eligible_impressions_d {
    type: number
    sql: ${TABLE}.active_view_eligible_impression ;;
  }

  dimension: total_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.total_revenue/1000000000 ;;
  }

  ### Impression measures

  measure: total_impressions {
    type: sum
    sql: ${count_impressions} ;;
  }

  measure: total_conversions {
    type: sum
    sql: ${count_conversions} ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${count_clicks} ;;
  }

  measure: active_view_viewable_impressions  {
    type: sum
    sql: ${active_view_viewable_impressions_d} ;;
  }

  measure: active_view_measurable_impressions  {
    type: sum
    sql: ${active_view_measurable_impressions_d} ;;
  }

  measure: active_view_eligible_impressions  {
    type: sum
    sql: ${active_view_eligible_impressions_d} ;;
  }


  ### copied over

  dimension: dbm_insertion_order_id {
    type: number
    sql: ${TABLE}.DBM_Insertion_Order_ID ;;
    link: {
      label: "IO Lookup Dashboard"
      url: "/dashboards-next/20?Insertion%20Order={{ value | encode_uri }}&Performance%20Metric={{ _filters['metric_selector'] | url_encode }}&Impression%20Date={{ _filters['impression.impression_date'] | url_encode }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "Link to DV360 for IO {{value}}"
      #url: "https://displayvideo.google.com/#ng_nav/p/@{dv360_partner_id}/a/{{dbm_advertiser_id._value}}/c/{{campaign_id._value}}/io/{{value}}/lis"
      icon_url: "https://www.searchlaboratory.com/wp-content/uploads/2019/02/DV360-1.png"
    }
    drill_fields: [dbm_line_item_id]
  }

  dimension: dbm_insertion_order_id_label {
    type: string
    sql: CONCAT(CAST(${dynamic_io_rank.rank} as string),'.) ',CAST(${TABLE}.DBM_Insertion_Order_ID as string)) ;;
    link: {
      label: "IO Lookup Dashboard"
      # url: "/dashboards/20?Insertion%20Order={{ dbm_insertion_order_id._value | encode_uri }}"
      url: "/dashboards-next/20?Insertion%20Order={{ dbm_insertion_order_id._value | encode_uri }}&Performance%20Metric={{ _filters['metric_selector'] | url_encode }}&Impression%20Date={{ _filters['impression.impression_date'] | url_encode }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "Link to DV360 for IO {{dbm_insertion_order_id._value}}"
      #url: "https://displayvideo.google.com/#ng_nav/p/@{dv360_partner_id}/a/{{dbm_advertiser_id._value}}/c/{{campaign_id._value}}/io/{{dbm_insertion_order_id._value}}/lis"
      icon_url: "https://www.searchlaboratory.com/wp-content/uploads/2019/02/DV360-1.png"
    }
    drill_fields: [dbm_line_item_id]
  }


  dimension: dbm_line_item_id {
    type: number
    sql: ${TABLE}.DBM_Line_Item_ID ;;
    link: {
      label: "Line Item Lookup Dashboard"
      url: "/dashboards/26?Line%20Item%20ID={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "Link to DV360 for Line Item {{value}}"
     # url: "https://displayvideo.google.com/#ng_nav/p/@{dv360_partner_id}/a/{{dbm_advertiser_id._value}}/c/{{campaign_id._value}}/io/{{dbm_insertion_order_id._value}}/li/{{value}}/details"
      icon_url: "https://www.searchlaboratory.com/wp-content/uploads/2019/02/DV360-1.png"
    }
  }

  dimension: dbm_designated_market_area_dma_id {
    type: number
    sql: ${TABLE}.DBM_Designated_Market_Area_DMA_ID ;;
    map_layer_name: dma
    drill_fields: [dbm_zip_postal_code]
  }

  dimension: campaign_id {
    link: {
      url: "Link to DV360 for Campaign {{value}}"
      #icon_url: "https://displayvideo.google.com/#ng_nav/p/@{dv360_partner_id}/a/{{dbm_advertiser_id._value}}/c/{{value}}/explorer?"
    }
#     html:
#     <html>
# <center>
# <button style="background-color: #4285F4; border: none; text-align: center; color: white; padding: 10px 25px; font-size: 12px;">
# <a style="text-decoration: none; color: white;" href="https://displayvideo.google.com/#ng_nav/p/@{dv360_partner_id}/a/{{dbm_advertiser_id._value}}/c/{{value}}/explorer?">
# <b>Go to DV360 for<br>Selected Campaign</b></a></button>
# </center>
# </html>
# ;;
  }

  dimension: is_public {
    type: string
    sql: CASE
          WHEN CAST(${dbm_attributed_inventory_source_is_public} AS STRING) = 'true' THEN 'Public'
          WHEN CAST(${dbm_attributed_inventory_source_is_public} AS STRING) = 'false' THEN 'Private'
          ELSE NULL
          END ;;
    drill_fields: [dbm_exchange_id,dbm_site_id]
  }

#   dimension: dbm_device_type_name {
#     type: string
#     sql: CASE
#       WHEN ${TABLE}.DBM_Device_Type = 0 THEN "Computer"
#       WHEN ${TABLE}.DBM_Device_Type = 1 THEN "Other"
#       WHEN ${TABLE}.DBM_Device_Type = 2 THEN "Smart Phone"
#       WHEN ${TABLE}.DBM_Device_Type = 3 THEN "Tablet"
#       WHEN ${TABLE}.DBM_Device_Type = 4 THEN "SmartTV"
#       ELSE "Other" END ;;
#     drill_fields: [dbm_browser_platform_id,dbm_operating_system_id]
#   }
#
#   dimension: dbm_browser_platform_id {
#     type: string
#     sql: ${TABLE}.DBM_Browser_Platform_ID ;;
#     drill_fields: [browser_platform_version]
#   }


  ### Line Item Metrics

  measure: line_item_count {
    type: count_distinct
    sql: ${dbm_line_item_id} ;;
    drill_fields: []
  }

  measure: line_item_count_label {
    hidden: yes
    type: count_distinct
    sql: ${dbm_line_item_id} ;;
    drill_fields: [dbm_line_item_id, ctr, cr, cpm, percent_impressions_measurable, percent_impressions_viewed]
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    html:  <a href="#drillmenu" target="_self">
          {{rendered_value}} Line Items
          </a>
          ;;
  }

  measure: insertion_order_count {
    type: count_distinct
    sql: ${dbm_insertion_order_id} ;;
    drill_fields: [dbm_insertion_order_id]
  }

  ## Cost Metrics

  measure: dbm_revenue {
    label: "Total Spend"
    type: sum
    value_format_name: usd
    sql: ${total_revenue} ;;
  }

  ## CPA Performance

  measure: cpa {
    description: "Cost Per Acquisition"
    type:  number
    value_format_name: usd
    sql: 1.0 * ${dbm_revenue}/nullif(${total_conversions},0) ;;
  }

  measure: cpa_without_campaign_level {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0 * (${campaign_facts.dbm_revenue} - ${dbm_revenue}) / nullif((${campaign_facts.total_conversions} - ${total_conversions}),0) ;;
  }

  measure: cpa_without_io_level {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0 * (${io_facts.dbm_revenue} - ${dbm_revenue}) / nullif((${io_facts.total_conversions} - ${total_conversions}),0) ;;
  }

  measure: cpa_without_line_item_level {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0 * (${line_item_facts.dbm_revenue} - ${dbm_revenue}) / nullif((${line_item_facts.total_conversions} - ${total_conversions}),0) ;;
  }

  measure: contribution_to_campaign_cpa_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${cpa_without_campaign_level} - ${cpa}) / nullif(${cpa},0) ;;
  }

  measure: contribution_to_io_cpa_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${cpa_without_io_level} - ${cpa}) / nullif(${cpa},0) ;;
  }

  measure: contribution_to_line_item_cpa_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${cpa_without_line_item_level} - ${cpa}) / nullif(${cpa},0) ;;
  }

  ## CPC

  measure: cpc {
    description: "Cost Per Click"
    type: number
    value_format_name: usd
    sql: 1.0 * ${dbm_revenue}/nullif(${total_clicks},0) ;;
  }

  measure: cpc_without_campaign_level {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0 * (${campaign_facts.dbm_revenue} - ${dbm_revenue}) / nullif((${campaign_facts.total_clicks} - ${total_clicks}),0) ;;
  }

  measure: cpc_without_io_level {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0 * (${io_facts.dbm_revenue} - ${dbm_revenue}) / nullif((${io_facts.total_clicks} - ${total_clicks}),0) ;;
  }

  measure: cpc_without_line_item_level {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0 * (${line_item_facts.dbm_revenue} - ${dbm_revenue}) / nullif((${line_item_facts.total_clicks} - ${total_clicks}),0) ;;
  }

  measure: contribution_to_campaign_cpc_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${cpc_without_campaign_level} - ${cpc}) / nullif(${cpc},0) ;;
  }

  measure: contribution_to_io_cpc_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${cpc_without_io_level} - ${cpc}) / nullif(${cpc},0) ;;
  }

  measure: contribution_to_line_item_cpc_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${cpc_without_line_item_level} - ${cpc}) / nullif(${cpc},0) ;;
  }

  ## CPM

  measure: cpm {
    description: "Cost Per 1000 Impressions"
    type: number
    value_format: "$0.00"
    sql:  1.0 * ${dbm_revenue}/nullif(${total_impressions},0)*1000;;
  }

  measure: cpm_without_campaign_level {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0 * (${campaign_facts.dbm_revenue} - ${dbm_revenue}) / nullif((${campaign_facts.total_impressions} - ${total_impressions}),0)*1000 ;;
  }

  measure: cpm_without_io_level {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0 * (${io_facts.dbm_revenue} - ${dbm_revenue}) / nullif((${io_facts.total_impressions} - ${total_impressions}),0)*1000 ;;
  }

  measure: cpm_without_line_item_level {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0 * (${line_item_facts.dbm_revenue} - ${dbm_revenue}) / nullif((${line_item_facts.total_impressions} - ${total_impressions}),0)*1000 ;;
  }

  measure: contribution_to_campaign_cpm_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${cpm_without_campaign_level} - ${cpm}) / nullif(${cpm},0) ;;
  }

  measure: contribution_to_io_cpm_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${cpm_without_io_level} - ${cpm}) / nullif(${cpm},0) ;;
  }

  measure: contribution_to_line_item_cpm_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${cpm_without_line_item_level} - ${cpm}) / nullif(${cpm},0) ;;
  }

  ### Custom Rate Metrics ###

  ## Click Through Rate

  measure: ctr {
    description: "Click Through Rate"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_clicks}/nullif(${total_impressions},0) ;;
  }

  measure: ctr_without_campaign_level {
    hidden: yes
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${campaign_facts.total_clicks} - ${total_clicks}) / nullif((${campaign_facts.total_impressions} - ${total_impressions}),0) ;;
  }

  measure: ctr_without_io_level {
    hidden: yes
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${io_facts.total_clicks} - ${total_clicks}) / nullif((${io_facts.total_impressions} - ${total_impressions}),0) ;;
  }

  measure: ctr_without_line_item_level {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0 * (${line_item_facts.total_clicks} - ${total_clicks}) / nullif((${line_item_facts.total_impressions} - ${total_impressions}),0) ;;
  }

  measure: contribution_to_campaign_ctr_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${ctr_without_campaign_level} - ${ctr}) / nullif(${ctr},0) ;;
  }

  measure: contribution_to_io_ctr_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${ctr_without_io_level} - ${ctr}) / nullif(${ctr},0) ;;
  }

  measure: contribution_to_line_item_ctr_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${ctr_without_line_item_level} - ${ctr}) / nullif(${ctr},0) ;;
  }

  ## Conversion Rate

  measure: cr {
    description: "Conversion Rate"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_conversions}/nullif(${total_impressions},0) ;;
  }

  measure: cr_without_campaign_level {
    hidden: yes
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${campaign_facts.total_conversions} - ${total_conversions}) / nullif((${campaign_facts.total_impressions} - ${total_impressions}),0) ;;
  }

  measure: cr_without_io_level {
    hidden: yes
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${io_facts.total_conversions} - ${total_conversions}) / nullif((${io_facts.total_impressions} - ${total_impressions}),0) ;;
  }

  measure: cr_without_line_item_level {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0 * (${line_item_facts.total_conversions} - ${total_conversions}) / nullif((${line_item_facts.total_impressions} - ${total_impressions}),0) ;;
  }

  measure: contribution_to_campaign_cr_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${ctr_without_campaign_level} - ${cr}) / nullif(${cr},0) ;;
  }

  measure: contribution_to_io_cr_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${cr_without_io_level} - ${cr}) / nullif(${cr},0) ;;
  }

  measure: contribution_to_line_item_cr_performance {
    group_label: "Contribution to Performance"
    type: number
    value_format_name: percent_2
    sql: 1.0 * (${cr_without_line_item_level} - ${cr}) / nullif(${cr},0) ;;
  }

  measure: percent_impressions_viewed {
    description: "Impression View Rate"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${active_view_viewable_impressions}/nullif(${active_view_measurable_impressions},0) ;;
  }

  measure: percent_impressions_measurable {
    description: "Measureable Impression Rate"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${active_view_measurable_impressions}/nullif(${active_view_eligible_impressions},0) ;;
  }

  ### Metric Selector

  parameter:  metric_selector {
    allowed_value: {
      label: "Cost Per Acquisition"
      value: "Cost Per Acquisition"
    }
    allowed_value: {
      label: "Cost Per Click"
      value: "Cost Per Click"
    }
    allowed_value: {
      label: "Click Through Rate"
      value: "Click Through Rate"
    }
    allowed_value: {
      label: "Cost Per 1000 Impressions"
      value: "Cost Per 1000 Impressions"
    }
    allowed_value: {
      label: "Conversion Rate"
      value: "Conversion Rate"
    }
    allowed_value: {
      label: "Viewable Impression Rate"
      value: "Viewable Impression Rate"
    }
    allowed_value: {
      label: "Measureable Impression Rate"
      value: "Measureable Impression Rate"
    }
  }

  measure: dynamic_measure {
    label_from_parameter: metric_selector
    type: number
    sql:  {% if metric_selector._parameter_value == "'Cost Per Acquisition'" %} ${cpa}
          {% elsif metric_selector._parameter_value == "'Cost Per Click'" %} ${cpc}
            {% elsif metric_selector._parameter_value == "'Click Through Rate'" %} ${ctr}*100
            {% elsif metric_selector._parameter_value == "'Cost Per 1000 Impressions'" %} ${cpm}
            {% elsif metric_selector._parameter_value == "'Conversion Rate'" %} ${cr}*100
            {% elsif metric_selector._parameter_value == "'Viewable Impression Rate'" %} ${percent_impressions_viewed}*100
            {% elsif metric_selector._parameter_value == "'Measureable Impression Rate'" %} ${percent_impressions_measurable}*100
            {% else %} null
          {% endif %};;
#     sql: 1 ;;
  # value_format_name: "[>=0.01]0.00;[>0]0.0000;0.00"
      value_format_name: decimal_4
      html: <a href="#drillmenu" target="_self">
            {% if metric_selector._parameter_value == "'Cost Per Acquisition'" %} ${{rendered_value}}
                  {% elsif metric_selector._parameter_value == "'Cost Per Click'" %} ${{rendered_value}}
                    {% elsif metric_selector._parameter_value == "'Click Through Rate'" %} {{rendered_value}}%
                    {% elsif metric_selector._parameter_value == "'Cost Per 1000 Impressions'" %} ${{rendered_value}}
                    {% elsif metric_selector._parameter_value == "'Conversion Rate'" %} {{rendered_value }}%
                    {% elsif metric_selector._parameter_value == "'Viewable Impression Rate'" %} {{rendered_value }}%
                    {% elsif metric_selector._parameter_value == "'Measureable Impression Rate'" %} {{rendered_value}}%
                    {% else %} {{rendered_value}}
                  {% endif %}
                  </a>;;
            # html: <a href="#drillmenu" target="_self">
            # {% if metric_selector._parameter_value == "'Cost Per Aquisition'" %} {{cpa._rendered_value}}
            # {% elsif metric_selector._parameter_value == "'Cost Per Click'" %} {{cpc._rendered_value}}
            # {% elsif metric_selector._parameter_value == "'Click Through Rate'" %} {{ctr._rendered_value }}
            # {% elsif metric_selector._parameter_value == "'Cost Per 1000 Impressions'" %} {{cpm._rendered_value}}
            # {% elsif metric_selector._parameter_value == "'Conversion Rate'" %} {{cr._rendered_value}}
            # {% elsif metric_selector._parameter_value == "'Viewable Impression Rate'" %} {{percent_impressions_viewed._rendered_value}}
            # {% elsif metric_selector._parameter_value == "'Measureable Impression Rate'" %} {{percent_impressions_viewed._rendered_value}}
            # {% else %} {{rendered_value}}
            # {% endif %}
            # </a>;;
      }

      measure: dynamic_measure_label {
        label_from_parameter: metric_selector
        type: number
        sql:  {% if metric_selector._parameter_value == "'Cost Per Acquisition'" %} ${cpa}
            {% elsif metric_selector._parameter_value == "'Cost Per Click'" %} ${cpc}
              {% elsif metric_selector._parameter_value == "'Click Through Rate'" %} ${ctr}
              {% elsif metric_selector._parameter_value == "'Cost Per 1000 Impressions'" %} ${cpm}
              {% elsif metric_selector._parameter_value == "'Conversion Rate'" %} ${cr}
              {% elsif metric_selector._parameter_value == "'Viewable Impression Rate'" %} ${percent_impressions_viewed}
              {% elsif metric_selector._parameter_value == "'Measureable Impression Rate'" %} ${percent_impressions_measurable}
              {% else %} null
            {% endif %};;
        # value_format_name: "[>=0.01]0.00;[>-0.01]0.0000;0.00"
          value_format_name: decimal_4
          html: <a href="#drillmenu" target="_self">
                    {% if metric_selector._parameter_value == "'Cost Per Acquisition'" %} ${{rendered_value}} CPA
                    {% elsif metric_selector._parameter_value == "'Cost Per Click'" %} ${{rendered_value}} CPC
                    {% elsif metric_selector._parameter_value == "'Click Through Rate'" %} {{rendered_value | times:100 }}% CTR
                    {% elsif metric_selector._parameter_value == "'Cost Per 1000 Impressions'" %} ${{rendered_value}} CPM
                    {% elsif metric_selector._parameter_value == "'Conversion Rate'" %} {{rendered_value | times:100 }}% CR
                    {% elsif metric_selector._parameter_value == "'Viewable Impression Rate'" %} {{rendered_value | times:100 }}% VIR
                    {% elsif metric_selector._parameter_value == "'Measureable Impression Rate'" %} {{rendered_value | times:100 }}% MIR
                    {% else %} {{rendered_value}}
                    {% endif %}
                                </a>;;
                          # html: <a href="#drillmenu" target="_self">
                          # {% if metric_selector._parameter_value == "'Cost Per Aquisition'" %} {{cpa._rendered_value}}
                          # {% elsif metric_selector._parameter_value == "'Cost Per Click'" %} {{cpc._rendered_value}}
                          # {% elsif metric_selector._parameter_value == "'Click Through Rate'" %} {{ctr._rendered_value }}
                          # {% elsif metric_selector._parameter_value == "'Cost Per 1000 Impressions'" %} {{cpm._rendered_value}}
                          # {% elsif metric_selector._parameter_value == "'Conversion Rate'" %} {{cr._rendered_value}}
                          # {% elsif metric_selector._parameter_value == "'Viewable Impression Rate'" %} {{percent_impressions_viewed._rendered_value}}
                          # {% elsif metric_selector._parameter_value == "'Measureable Impression Rate'" %} {{percent_impressions_viewed._rendered_value}}
                          # {% else %} {{rendered_value}}
                          # {% endif %}
                          # </a>;;
          }

          ### Campaign Benchmarking

          filter: campaign_input {
            type: string
            suggest_dimension: campaign_id
          }
          dimension: campaign_comparison {
            type: string
            sql: CASE WHEN {% condition campaign_input %} ${campaign_id} {% endcondition %}
                        THEN CONCAT('1. ',cast(${campaign_id} as string))
                        ELSE '2. Rest of Campaigns' END;;
            link: {
              label: ""
            }
          }

          ### Comparion vs. priod period

          filter: previous_period_filter {
            type: date
            description: "Use this filter for period analysis"
          }

          dimension: previous_period {
            type: string
            description: "The reporting period as selected by the Previous Period Filter"
            sql:
                      CASE
                        WHEN {% date_start previous_period_filter %} is not null AND {% date_end previous_period_filter %} is not null /* date ranges or in the past x days */
                          THEN
                            CASE
                              WHEN ${impression_raw} >=  {% date_start previous_period_filter %}
                                AND ${impression_raw} <= {% date_end previous_period_filter %}
                                THEN 'This Period'
                              WHEN ${impression_raw} >=
                              TIMESTAMP_ADD(TIMESTAMP_ADD({% date_start previous_period_filter %}, INTERVAL -1 DAY ), INTERVAL
                                -1*DATE_DIFF(DATE({% date_end previous_period_filter %}), DATE({% date_start previous_period_filter %}), DAY) + 1 DAY)
                                AND ${impression_raw} <=
                                TIMESTAMP_ADD({% date_start previous_period_filter %}, INTERVAL -1 DAY )
                                THEN 'Previous Period'
                            END
                          END ;;
          }




          set: detail {
            fields: [
              campaign_id,
              dbm_advertiser_id,
              dbm_insertion_order_id,
              dbm_line_item_id,
              dbm_site_id,
              dbm_exchange_id,
              dbm_auction_id,
              dbm_attributed_inventory_source_is_public,
              dbm_matching_targeted_segments,
              dbm_designated_market_area_dma_id,
              dbm_zip_postal_code,
              dbm_state_region_id,
              total_revenue,
              count_impressions
            ]
          }
        }
