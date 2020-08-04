include: "//@{CONFIG_PROJECT_NAME}/views/dv360/*"

view: dynamic_io_rank {
  extends: [dynamic_io_rank_config]
}

# If necessary, uncomment the line below to include explore_source.
# include: "block_dv360_v2.model.lkml"
view: dynamic_io_rank_core {
  extension: required
  derived_table: {
    explore_source: impression_funnel_dv360 {
      column: dbm_insertion_order_id { field: impression_funnel_dv360.dbm_insertion_order_id }
      column: dynamic_measure { field: impression_funnel_dv360.dynamic_measure }
      derived_column: rank {
        sql: ROW_NUMBER() OVER(order by dynamic_measure
                  {% if impression_funnel_dv360.metric_selector._parameter_value == "'Cost Per Acquisition'" %} desc
                    {% elsif impression_funnel_dv360.metric_selector._parameter_value == "'Cost Per Click'" %} desc
                      {% elsif impression_funnel_dv360.metric_selector._parameter_value == "'Click Through Rate'" %} asc
                      {% elsif impression_funnel_dv360.metric_selector._parameter_value == "'Cost Per 1000 Impressions'" %} desc
                      {% elsif impression_funnel_dv360.metric_selector._parameter_value == "'Conversion Rate'" %} asc
                      {% elsif impression_funnel_dv360.metric_selector._parameter_value == "'Viewable Impression Rate'" %} asc
                      {% elsif impression_funnel_dv360.metric_selector._parameter_value == "'Measureable Impression Rate'" %} asc
                      {% else %} desc
                    {% endif %}
                    ) ;;
      }
      bind_all_filters: yes
    }
  }
  dimension: dbm_insertion_order_id {
    type: number
    hidden: yes
  }
  dimension: dynamic_measure {
    label: "Impressions Dynamic Measure"
    value_format: "#,##0.00"
    type: number
    hidden: yes
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  filter: rank_input {
    type: number
  }
  dimension: rank_comparitor {
    type: string
    sql: CASE WHEN  ${rank} = 1 then CONCAT('1. ',CAST(${impression_funnel_dv360.dbm_insertion_order_id} as string))
          WHEN  ${rank} = 2 then CONCAT('2. ',CAST(${impression_funnel_dv360.dbm_insertion_order_id} as string))
          WHEN  ${rank} = 3 then CONCAT('3. ',CAST(${impression_funnel_dv360.dbm_insertion_order_id} as string))
          ELSE 'Rest of Insertion Orders' END;;
  }
}

# If necessary, uncomment the line below to include explore_source.
# include: "campaign_manager.model.lkml"

view: campaign_facts {
  derived_table: {
    explore_source: impression_funnel_dv360 {
      column: campaign_id {}
      column: dbm_revenue {}
      column: total_impressions {}
      column: total_clicks {}
      column: total_conversions {}
      bind_all_filters: yes
    }
  }
  dimension: campaign_id {
    primary_key: yes
    hidden: yes
    label: "Campaigns Campaign ID"
  }
  measure: dbm_revenue {
    hidden: yes
    type: sum
  }
  measure: total_impressions {
    hidden: yes
    type: sum
  }
  measure: total_clicks {
    hidden: yes
    type: sum
  }
  measure: total_conversions {
    hidden: yes
    type: sum
  }
}

# If necessary, uncomment the line below to include explore_source.
# include: "campaign_manager.model.lkml"

view: io_facts {
  derived_table: {
    explore_source: impression_funnel_dv360 {
      column: dbm_revenue {}
      column: total_impressions {}
      column: total_clicks {}
      column: total_conversions {}
      column: dbm_insertion_order_id {}
      bind_all_filters: yes
    }
  }
  dimension: dbm_insertion_order_id {
    primary_key: yes
    hidden: yes
    type: number
  }
  measure: dbm_revenue {
    hidden: yes
    type: sum
  }
  measure: total_impressions {
    hidden: yes
    type: sum
  }
  measure: total_clicks {
    hidden: yes
    type: sum
  }
  measure: total_conversions {
    hidden: yes
    type: sum
  }
}

# If necessary, uncomment the line below to include explore_source.
# include: "campaign_manager.model.lkml"

view: line_item_facts {
  derived_table: {
    explore_source: impression_funnel_dv360 {
      column: dbm_revenue {}
      column: total_impressions {}
      column: total_clicks {}
      column: total_conversions {}
      column: dbm_line_item_id {}
      bind_all_filters: yes
    }
  }
  dimension: dbm_line_item_id {
    primary_key: yes
    hidden: yes
    type: number
  }
  measure: dbm_revenue {
    hidden: yes
    type: sum
  }
  measure: total_impressions {
    hidden: yes
    type: sum
  }
  measure: total_clicks {
    hidden: yes
    type: sum
  }
  measure: total_conversions {
    hidden: yes
    type: sum
  }
}
