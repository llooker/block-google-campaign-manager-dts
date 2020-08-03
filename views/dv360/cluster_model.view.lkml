include: "//@{CONFIG_PROJECT_NAME}/views/dv360/clustering_model.view"


view: clustering_dataset {
  extends: [clustering_dataset_config]
}


view: clustering_dataset_core {
  extension: required
  derived_table: {
    explore_source: impression_funnel_dv360 {
      column: campaign_id {}
      column: total_clicks {}
      column: total_conversions {}
      column: total_impressions {}
      column: dbm_revenue {}
      # column: cpa {}
      # column: cpc {}
      # column: cpm {}
      # column: cr {}
      # column: ctr {}
      derived_column: row_num {
        sql: ROW_NUMBER() OVER () ;;
      }
      filters: {
        field: impression_funnel_dv360.dbm_revenue
        value: ">= .01"
      }
      filters: {
        field: impression_funnel_dv360.total_conversions
        value: "not 0"
      }
    }
  }
  dimension: campaign_id {
    view_label: "Cluster Predict"
  }
  dimension: total_clicks {
    type: number
    hidden: yes
  }
  dimension: total_conversions {
    type: number
    hidden: yes
  }
  dimension: total_impressions {
    type: number
    hidden: yes
  }
  dimension: dbm_revenue {
    label: "Impression Funnel Dv360 Total Spend"
    value_format: "$#,##0.00"
    type: number
    hidden: yes
  }
  dimension: cpa {
    description: "Cost Per Acquisition"
    value_format: "$#,##0.00"
    type: number
    hidden: yes
  }
  dimension: cpc {
    description: "Cost Per Click"
    value_format: "$#,##0.00"
    type: number
    hidden: yes
  }
  dimension: cpm {
    description: "Cost Per 1000 Impressions"
    value_format: "$0.00"
    type: number
    hidden: yes
  }
  dimension: cr {
    description: "Conversion Rate"
    value_format: "#,##0.00%"
    type: number
    hidden: yes
  }
  dimension: ctr {
    description: "Click Through Rate"
    value_format: "#,##0.00%"
    type: number
    hidden: yes
  }
  dimension: row_num {
    hidden: yes
  }
}

view: cluster_model {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql_create:
      CREATE OR REPLACE MODEL
      ${SQL_TABLE_NAME} OPTIONS(model_type='kmeans') AS
      SELECT
         * EXCEPT(campaign_id,impression_funnel_dv360_dbm_advertiser_id,row_num)
      FROM ${clustering_dataset.SQL_TABLE_NAME};;
  }
}

view: cluster_model_evaluate {
  #This table only has one row with two numbers. Would be good on a dashboard with other metrics on the centroids.
  derived_table: {
    sql: SELECT * FROM ml.EVALUATE(
      MODEL ${cluster_model.SQL_TABLE_NAME}) ;;
  }
  dimension: davies_bouldin_index {
    description: "A measure of how good your clusters are: A smaller number indicates the clusters are more differentiated, meaning a good fit."
    type: number
    sql: ${TABLE}.davies_bouldin_index ;;
  }
  dimension: mean_squared_distance {
    description: "A measure of how good your clusters are: A smaller number indicates the members of a cluster are more similar, meaning a good fit."
    type: number
    sql: ${TABLE}.mean_squared_distance ;;
  }
}


view: cluster_predict {
#   extends: [clustering_dataset]
#This table will have all the same dimensions as the original, plus what I've included below.
#While we could join it back to the original data, it also makes sense to just explore it on its own.
derived_table: {
  sql: SELECT *,ROW_NUMBER() OVER () AS row_num FROM ml.PREDICT(
          MODEL ${cluster_model.SQL_TABLE_NAME},
          (SELECT * EXCEPT(campaign_id,impression_funnel_dv360_dbm_advertiser_id,row_num)
            FROM ${clustering_dataset.SQL_TABLE_NAME}))
       ;;
}
dimension: centroid_id {
  description: "Which cluster this data point is closest to. In other words: to which 'group' does this data point belong?"
  type: number
  sql: ${TABLE}.centroid_id ;;
}

dimension: centroid_distance {
  description: "What the distance is to the nearest cluster's center. In other words: how much like this 'group' is this data point? (lower is better fit)"
  type: number
  sql:  ${TABLE}.NEAREST_CENTROIDS_DISTANCE[OFFSET(0)].DISTANCE ;;
}

measure: average_centroid_distance {
  description: "How close are these data points to their nearest clusters' centers. In other words: How well do these data points fit into their respective 'groups'? (lower is better fit) "
  type: average
  sql: ${centroid_distance} ;;
}
dimension: total_clicks {
  type: number
}
dimension: total_conversions {
  type: number
}
dimension: total_impressions {
  type: number
}
dimension: dbm_revenue {
  label: "Impression Funnel Dv360 Total Spend"
  value_format: "$#,##0.00"
  type: number
}
dimension: cpa {
  description: "Cost Per Acquisition"
  value_format: "$#,##0.00"
  type: number
}
dimension: cpc {
  description: "Cost Per Click"
  value_format: "$#,##0.00"
  type: number
}
dimension: cpm {
  description: "Cost Per 1000 Impressions"
  value_format: "$0.00"
  type: number
}
dimension: cr {
  description: "Conversion Rate"
  value_format: "#,##0.00%"
  type: number
}
dimension: ctr {
  description: "Click Through Rate"
  value_format: "#,##0.00%"
  type: number
}
dimension: row_num {
  hidden: yes
}

}
