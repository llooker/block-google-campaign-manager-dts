view: user_impression_facts {
  derived_table: {
    datagroup_trigger: new_day
    sql:
      SELECT
        impression.User_ID  AS  user_id,
        impression.Campaign_ID  AS campaign_id,
        COUNT(DISTINCT (concat(impression.Ad_ID, impression.Advertiser_ID, impression.User_ID, cast(impression.Event_Time as string), impression.Event_Type, impression.Rendering_ID)) ) AS count_impressions,
        (COUNT(DISTINCT (concat(impression.Ad_ID, impression.Advertiser_ID, impression.User_ID, cast(impression.Event_Time as string), impression.Event_Type, impression.Rendering_ID)) ))/NULLIF((COUNT(DISTINCT impression.User_ID )),0)  AS impressions_per_user
      FROM `@{PROJECT_NAME}.@{DATASET_NAME}.p_impression_@{CAMPAIGN_MANAGER_ID}` AS impression
      WHERE impression._PARTITIONTIME > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY))
      GROUP BY 1,2 ;;
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
    tiers: [1,10,20,30,40,50]
    sql: ${count_impressions} ;;
  }



}
