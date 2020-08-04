include: "//@{CONFIG_PROJECT_NAME}/views/derived_tables/user_impression_facts.view"

########### PRESENTATION LAYER ###########
view: user_impression_facts {
  extends: [user_impression_facts_config]
}


########### CORE LAYER ###########
view: user_impression_facts_core {
  extension: required
  derived_table: {
    sql:
    SELECT
  impression.User_ID  AS  user_id,
  impression.Campaign_ID  AS campaign_id,
  COUNT(DISTINCT (concat(impression.Ad_ID, impression.Advertiser_ID, impression.User_ID, cast(impression.Event_Time as string), impression.Event_Type, impression.Rendering_ID)) ) AS count_impressions
FROM `@{PROJECT_NAME}.@{DATASET_NAME}.p_impression_@{CAMPAIGN_MANAGER_ID}` AS impression
LEFT JOIN (select * from `@{PROJECT_NAME}.@{DATASET_NAME}.match_table_campaigns_@{CAMPAIGN_MANAGER_ID}` where _LATEST_DATE = _DATA_DATE)  AS match_table_campaigns ON impression.Campaign_ID = match_table_campaigns.Campaign_ID
WHERE impression._PARTITIONTIME > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -7 DAY))
GROUP BY 1,2
    ;;

  }

  dimension: user_id {
    primary_key: yes
    hidden: yes
  }

  dimension: campaign_id {
    hidden: yes
  }

  dimension: count_impressions {
    view_label: "Impressions"
    label: "Impressions Per User"
    type: number
  }

  dimension: impressions_per_user_tiered {
    view_label: "Impressions"
    label: "Impressions Per User - Tiered"
    type: tier
    style: integer
    tiers: [1,6,11,16,21,26]
    sql: ${count_impressions} ;;
  }



}
