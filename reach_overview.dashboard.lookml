- dashboard: reach_overview
  title: Reach Overview
  layout: newspaper
  elements:
  - name: Top 25 Campaigns by User Impression Count
    title: Top 25 Campaigns by User Impression Count
    model: campaign_manager
    explore: impression
    type: looker_bar
    fields: [impression.distinct_users, impression.count, impression.campaign_id]
    filters: {}
    sorts: [impression.distinct_users desc]
    limit: 25
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    map: auto
    map_projection: ''
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    quantize_colors: false
    series_types: {}
    map_latitude: 34.45221847282654
    map_longitude: 0.3515625
    map_zoom: 2
    colors: ["#5245ed", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080",
      "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    series_colors: {}
    font_size: '8'
    listen:
      Impression Date: impression.event_date
    row: 12
    col: 0
    width: 16
    height: 14
  - name: Users by Browser Type
    title: Users by Browser Type
    model: campaign_manager
    explore: impression
    type: looker_pie
    fields: [impression.distinct_users, match_table_browsers.browser_platform]
    sorts: [impression.distinct_users desc]
    limit: 1000
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    show_view_names: true
    map: auto
    map_projection: ''
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    quantize_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    map_latitude: 34.45221847282654
    map_longitude: 0.3515625
    map_zoom: 2
    colors: 'palette: Santa Cruz'
    listen:
      Impression Date: impression.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 12
    col: 16
    width: 8
    height: 6
  - name: Users by State
    title: Users by State
    model: campaign_manager
    explore: impression
    type: looker_geo_choropleth
    fields: [impression.state_region, impression.distinct_users]
    filters:
      impression.country_code: US
      impression.state_region: "-NULL"
    sorts: [impression.distinct_users desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Impression Date: impression.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 43
    col: 0
    width: 12
    height: 8
  - name: Users by Zip (Top 1000)
    title: Users by Zip (Top 1000)
    model: campaign_manager
    explore: impression
    type: looker_geo_coordinates
    fields: [impression.distinct_users, impression.zip_postal_code]
    filters:
      impression.country_code: US
      impression.zip_postal_code: "-NULL"
    sorts: [impression.distinct_users desc]
    limit: 1000
    column_limit: 50
    query_timezone: America/Los_Angeles
    map: auto
    map_projection: ''
    show_view_names: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    quantize_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    map_latitude: 34.45221847282654
    map_longitude: 0.3515625
    map_zoom: 2
    listen:
      Impression Date: impression.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 43
    col: 12
    width: 12
    height: 8
  - name: Users by Country
    title: Users by Country
    model: campaign_manager
    explore: impression
    type: looker_map
    fields: [impression.distinct_users, impression.country_code]
    filters:
      impression.country_code: "-NULL"
    sorts: [impression.distinct_users desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    map: auto
    map_projection: ''
    quantize_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    map_latitude: 48.864714761802794
    map_longitude: 3.7353515625000004
    map_zoom: 4
    heatmap_gridlines_empty: false
    reverse_map_value_colors: false
    listen:
      Impression Date: impression.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 34
    col: 0
    width: 24
    height: 9
  - name: Daily Users and Impressions
    title: Daily Users and Impressions
    model: campaign_manager
    explore: impression
    type: looker_line
    fields: [impression.distinct_users, impression.event_date, impression.count]
    filters: {}
    sorts: [impression.event_date]
    limit: 1000
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    map: auto
    map_projection: ''
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    quantize_colors: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types:
      impression.count: column
    map_latitude: 34.45221847282654
    map_longitude: 0.3515625
    map_zoom: 2
    colors: ["#5245ed", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080",
      "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    series_colors: {}
    listen:
      Impression Date: impression.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 4
    col: 0
    width: 24
    height: 8
  - name: Impressions by Advertiser
    title: Impressions by Advertiser
    model: campaign_manager
    explore: impression
    type: looker_pie
    fields: [impression.count_impressions, impression.advertiser_id]
    sorts: [impression.count_impressions desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    show_view_names: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors: 'palette: Santa Cruz'
    listen:
      Impression Date: impression.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 18
    col: 16
    width: 8
    height: 8
  - name: Users
    title: Users
    model: campaign_manager
    explore: impression
    type: single_value
    fields: [impression.distinct_users]
    filters: {}
    sorts: [impression.distinct_users desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    value_labels: legend
    label_type: labPer
    show_view_names: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors: 'palette: Santa Cruz'
    value_format: 0.000,," M"
    listen:
      Impression Date: impression.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 0
    col: 6
    width: 6
    height: 2
  - name: Impressions
    title: Impressions
    model: campaign_manager
    explore: impression
    type: single_value
    fields: [impression.count_impressions]
    sorts: [impression.count_impressions desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    value_labels: legend
    label_type: labPer
    show_view_names: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors: 'palette: Santa Cruz'
    value_format: 0.000,," M"
    listen:
      Impression Date: impression.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 0
    col: 0
    width: 6
    height: 2
  - name: Active Ads Count
    title: Active Ads Count
    model: campaign_manager
    explore: impression
    type: single_value
    fields: [impression.ad_count]
    filters: {}
    sorts: [impression.ad_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Impression Date: impression.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 0
    col: 18
    width: 6
    height: 2
  - name: Active Campaigns
    title: Active Campaigns
    model: campaign_manager
    explore: impression
    type: single_value
    fields: [impression.campaign_count]
    filters: {}
    sorts: [impression.campaign_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Impression Date: impression.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 0
    col: 12
    width: 6
    height: 2
  - name: Clicks
    title: Clicks
    model: campaign_manager
    explore: click
    type: single_value
    fields: [click.count]
    sorts: [click.count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Impression Date: click.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 2
    col: 6
    width: 6
    height: 2
  - name: Conversions
    title: Conversions
    model: campaign_manager
    explore: activity
    type: single_value
    fields: [activity.count]
    filters:
      activity.activity_date: 2016/09/15 to
      activity.event_type: CONVERSION
    sorts: [activity.count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    value_format: 0.000,," M"
    listen:
      Impression Date: activity.event_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 2
    col: 0
    width: 6
    height: 2
  - name: Action Rate
    title: Action Rate
    model: campaign_manager
    explore: impression_funnel
    type: single_value
    fields: [impression_funnel.action_rate]
    sorts: [impression_funnel.action_rate desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    value_format: 00.00%
    listen:
      Impression Date: impression_funnel.first_ad_impression_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 2
    col: 12
    width: 6
    height: 2
  - name: Average Impressions per User
    title: Average Impressions per User
    model: campaign_manager
    explore: impression_funnel
    type: single_value
    fields: [impression_funnel.impressions_per_user]
    sorts: [impression_funnel.impressions_per_user desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Impression Date: impression_funnel.first_ad_impression_date
      Campaign ID: match_table_campaigns.campaign_name
    row: 2
    col: 18
    width: 6
    height: 2
  # - title: Campaign Performance over Time
  #   name: Campaign Performance over Time
  #   model: campaign_manager
  #   explore: impression
  #   type: looker_line
  #   fields: [impression.count, click.count, activity.count,
  #     impression.dbm_revenue, match_table_campaigns.campaign_start_week]
  #   fill_fields: [match_table_campaigns.campaign_start_week]
  #   sorts: [match_table_campaigns.campaign_start_week desc]
  #   limit: 10
  #   dynamic_fields: [{table_calculation: click_through_rate, label: Click Through
  #         Rate, expression: "${click.count} / ${impression.count}",
  #       value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
  #       _type_hint: number}, {table_calculation: conversion_rate, label: Conversion
  #         Rate, expression: "${activity.count} / ${impression.count}",
  #       value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
  #       _type_hint: number}, {table_calculation: cost_per_click, label: Cost per Click,
  #       expression: "${click.count} / ${impression.dbm_revenue}", value_format: !!null '',
  #       value_format_name: usd, _kind_hint: measure, _type_hint: number}]
  #   stacking: ''
  #   show_value_labels: true
  #   label_density: 25
  #   legend_position: center
  #   x_axis_gridlines: false
  #   y_axis_gridlines: true
  #   show_view_names: true
  #   limit_displayed_rows: false
  #   y_axis_combined: true
  #   show_y_axis_labels: true
  #   show_y_axis_ticks: true
  #   y_axis_tick_density: default
  #   y_axis_tick_density_custom: 5
  #   show_x_axis_label: true
  #   show_x_axis_ticks: true
  #   x_axis_scale: auto
  #   y_axis_scale_mode: linear
  #   show_null_points: false
  #   point_style: none
  #   interpolation: monotone
  #   ordering: none
  #   show_null_labels: false
  #   show_totals_labels: false
  #   show_silhouette: false
  #   totals_color: "#808080"
  #   series_types: {}
  #   hidden_fields: [impression.count_impressions, click.count_clicks, activity.count_activities,
  #     impression.dbm_revenue]
  #   series_colors:
  #     total_impressions: "#3B4260"
  #     conversion_rate: "#39A736"
  #     cost_per_click: "#3B4260"
  #   y_axes: [{label: '', maxValue: 1.5, minValue: 0, orientation: left, showLabels: true,
  #       showValues: true, tickDensity: custom, tickDensityCustom: '11', type: linear,
  #       unpinAxis: false, valueFormat: !!null '', series: [{id: cost_per_click, name: Cost
  #             per Click, axisId: cost_per_click}]}, {label: !!null '', maxValue: !!null '',
  #       minValue: !!null '', orientation: right, showLabels: false, showValues: false,
  #       tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
  #       valueFormat: !!null '', series: [{id: conversion_rate, name: Conversion Rate,
  #           axisId: conversion_rate}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
  #       orientation: right, showLabels: false, showValues: false, tickDensity: default,
  #       tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: !!null '',
  #       series: [{id: click_through_rate, name: Click Through Rate, axisId: click_through_rate}]}]
  #   label_color: []
  #   hidden_series: []
  #   row: 26
  #   col: 0
  #   width: 24
  #   height: 8
  filters:
  - name: Impression Date
    title: Impression Date
    type: date_filter
    default_value: 2016/09/15 to
    allow_multiple_values: true
    required: false
  - name: Campaign ID
    title: Campaign ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: campaign_manager
    explore: impression
    listens_to_filters: []
    field: match_table_campaigns.campaign_name
