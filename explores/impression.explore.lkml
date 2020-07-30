include: "//@{CONFIG_PROJECT_NAME}/explores/impression.explore"

explore: impression_core {
  view_name: impression
  extension: required
  label: "(1) Impressions"
  view_label: "Impressions"

  sql_always_where: ${impression_raw} > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY)) ;;

  join: match_table_ads {
    view_label: "Ads"
    sql_on: ${impression.ad_id} = ${match_table_ads.ad_id} ;;
    relationship: many_to_one
  }

  join: match_table_campaigns {
    view_label: "Campaigns"
    sql_on: ${impression.campaign_id} = ${match_table_campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: match_table_advertisers {
    view_label: "Advertisers"
    sql_on: ${impression.advertiser_id} = ${match_table_advertisers.advertiser_id} ;;
    relationship: many_to_one
  }

  join: match_table_ad_placement_assignments {
    view_label: "Ad Placements"
    sql_on: ${impression.ad_id} = ${match_table_ad_placement_assignments.ad_id} and ${impression.placement_id} = ${match_table_ad_placement_assignments.placement_id} ;;
    relationship: many_to_one
  }

  join: match_table_browsers {
    view_label: "Browsers"
    sql_on: ${impression.browser_platform_id} = ${match_table_browsers.browser_platform_id} ;;
    relationship: many_to_one
  }

  join: match_table_creatives {
    view_label: "Creatives"
    sql_on: ${impression.rendering_id} = ${match_table_creatives.rendering_id} ;;
    relationship: many_to_one
  }
  join: match_table_operating_systems {
    view_label: "Operating System"
    sql_on: ${impression.operating_system_id_key} = ${match_table_operating_systems.operating_system_id_key} ;;
    relationship: many_to_one
  }

  join: user_impression_facts {
    relationship: one_to_one
    sql_on: ${impression.user_id} = ${user_impression_facts.user_id} and ${impression.campaign_id} = ${user_impression_facts.campaign_id} ;;
  }

}
