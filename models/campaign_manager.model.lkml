connection: "db-platform-sol-cm"

# include all the views
include: "/**/*.view"

# include all the dashboards
# include: "*.dashboard"

persist_for: "24 hours"

explore: impression {
  label: "(1) Impressions"
  view_label: "Impressions"

  sql_always_where: ${impression_raw} > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -3 DAY)) ;;

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

  join: match_table_creatives_8667 {
    view_label: "Creatives"
    sql_on: ${impression.rendering_id} = ${match_table_creatives_8667.rendering_id} ;;
    relationship: many_to_one
  }
}

explore: impression_funnel {
  label: "(2) Impression Funnel"

  sql_always_where: ${first_ad_impression_date} > '2020-06-05'  ;;

  join: match_table_campaigns {
    view_label: "Campaigns"
    sql_on: ${impression_funnel.campaign_id} =  ${match_table_campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: match_table_ads {
    view_label: "Ads"
    sql_on: ${impression_funnel.ad_id} = ${match_table_ads.ad_id} ;;
    relationship: many_to_one
  }

  join: match_table_advertisers {
    view_label: "Advertisers"
    sql_on: ${impression_funnel.advertiser_id} = ${match_table_advertisers.advertiser_id} ;;
    relationship: many_to_one
  }

  join: user_campaign_facts {
    view_label: "Users"
    sql_on: ${impression_funnel.campaign_id} = ${user_campaign_facts.campaign_id} AND ${impression_funnel.user_id} = ${user_campaign_facts.user_id} ;;
    relationship: many_to_one
  }
}

explore: activity {
  label: "(3) Activities"
  view_label: "Activities"

  sql_always_where: ${activity_raw} > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -3 DAY)) ;;
  join: match_table_ads {
    view_label: "Ads"
    sql_on: ${activity.ad_id} = ${match_table_ads.ad_id} ;;
    relationship: many_to_one
  }

  join: match_table_campaigns {
    view_label: "Campaigns"
    sql_on: ${activity.campaign_id} = ${match_table_campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: match_table_advertisers {
    view_label: "Advertisers"
    sql_on: ${activity.advertiser_id} = ${match_table_advertisers.advertiser_id} ;;
    relationship: many_to_one
  }

  join: match_table_ad_placement_assignments {
    view_label: "Ad Placements"
    sql_on: ${activity.ad_id} = ${match_table_ad_placement_assignments.ad_id} and ${activity.placement_id} = ${match_table_ad_placement_assignments.placement_id} ;;
    relationship: many_to_one
  }

  join: match_table_browsers {
    view_label: "Browsers"
    sql_on: ${activity.browser_platform_id} = ${match_table_browsers.browser_platform_id} ;;
    relationship: many_to_one
  }
}

explore: click {
  label: "(4) Clicks"
  view_label: "Clicks"

  sql_always_where: ${click_raw} > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -3 DAY)) ;;
  join: match_table_ads {
    view_label: "Ads"
    sql_on: ${click.ad_id} = ${match_table_ads.ad_id} ;;
    relationship: many_to_one
  }

  join: match_table_campaigns {
    view_label: "Campaigns"
    sql_on: ${click.campaign_id} = ${match_table_campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: match_table_advertisers {
    view_label: "Advertisers"
    sql_on: ${click.advertiser_id} = ${match_table_advertisers.advertiser_id} ;;
    relationship: many_to_one
  }

  join: match_table_ad_placement_assignments {
    view_label: "Ad Placements"
    sql_on: ${click.ad_id} = ${match_table_ad_placement_assignments.ad_id} and ${click.placement_id} = ${match_table_ad_placement_assignments.placement_id} ;;
    relationship: many_to_one
  }

  join: match_table_browsers {
    view_label: "Browsers"
    sql_on: ${click.browser_platform_id} = ${match_table_browsers.browser_platform_id} ;;
    relationship: many_to_one
  }
}
