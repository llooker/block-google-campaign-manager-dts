include: "//@{CONFIG_PROJECT_NAME}/views/derived_tables/match_table_creatives.view"

###########  PRESENTATION LAYER ###########
view: match_table_creatives {
  extends: [match_table_creatives_config]
}


########### CORE LAYER ###########
view: match_table_creatives_core {
  extension: required
derived_table: {
  sql:
  SELECT * FROM (
  SELECT
    _DATA_DATE,
    _LATEST_DATE,
    Advertiser_ID,
    Rendering_ID,Creative_ID,Creative,Creative_Type,Creative_Image_URL,
    Creative_Last_Modified_Date,
    Creative_Version
    Creative_Pixel_Size,
    ROW_NUMBER() OVER(
      PARTITION BY Rendering_ID
      ORDER BY _DATA_DATE DESC
    ) AS Recency
  FROM `@{PROJECT_NAME}.@{DATASET_NAME}.match_table_creatives_@{CAMPAIGN_MANAGER_ID`)
  WHERE Recency = 1
 ;;
}

  dimension_group: _data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.Advertiser_ID ;;
  }

  dimension: creative {
    type: string
    sql: ${TABLE}.Creative ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}.Creative_ID ;;
  }

  dimension: creative_image_url {
    type: string
    sql: ${TABLE}.Creative_Image_URL ;;
  }

  dimension: creative_last_modified_date {
    type: string
    sql: ${TABLE}.Creative_Last_Modified_Date ;;
  }

  dimension: creative_pixel_size {
    type: string
    sql: ${TABLE}.Creative_Pixel_Size ;;
  }

  dimension: creative_type {
    type: string
    sql: ${TABLE}.Creative_Type ;;
  }

  dimension: creative_version {
    type: number
    sql: ${TABLE}.Creative_Version ;;
  }

  dimension: rendering_id {
    type: string
    sql: ${TABLE}.Rendering_ID ;;
  }

}
