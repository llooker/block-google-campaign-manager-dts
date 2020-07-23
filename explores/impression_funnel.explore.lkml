include: "//@{CONFIG_PROJECT_NAME}/explores/impression_funnel.explore"

explore: impression_funnel_core {
  view_name: impression_funnel
  extension: required
  label: "(2) Impression Funnel"
  sql_always_where: TIMESTAMP(${first_ad_impression_date}) > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY))  ;;

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
