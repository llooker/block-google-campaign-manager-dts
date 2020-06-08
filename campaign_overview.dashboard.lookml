- dashboard: campaign_overview
  title: Campaign Overview
  layout: newspaper
  elements:
  - name: Campaign Metrics
    title: Campaign Metrics
    model: campaign_manager
    explore: impression_funnel
    type: table
    fields: [impression_funnel.campaign_id, match_table_campaigns.campaign_start_date,
      match_table_campaigns.campaign_end_date, impression_funnel.advertiser_id, match_table_ads.ad_type,
      impression_funnel.ad_id]
    sorts: [match_table_campaigns.campaign_start_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    colors: ["#5245ed", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080", "#a2dcf3",
      "#776fdf", "#e9b404", "#635189"]
    series_colors: {}
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 4
    col: 0
    width: 24
    height: 3
  - name: Daily Campaign Impression Metrics
    title: Daily Campaign Impression Metrics
    model: campaign_manager
    explore: impression
    type: looker_column
    fields: [impression.distinct_users, impression.event_date, impression.count]
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
    series_labels:
      impression.distinct_users: Users
    listen:
      Campaign ID: impression.campaign_id
    row: 7
    col: 0
    width: 17
    height: 6
  - name: Campaign Click Through Rate
    title: Campaign Click Through Rate
    model: campaign_manager
    explore: impression_funnel
    type: single_value
    fields: [impression_funnel.click_through_rate]
    sorts: [impression_funnel.click_through_rate desc]
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
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 2
    col: 18
    width: 6
    height: 2
  - name: Campaign Conversion Rate
    title: Campaign Conversion Rate
    model: campaign_manager
    explore: impression_funnel
    type: single_value
    fields: [impression_funnel.conversion_rate]
    sorts: [impression_funnel.conversion_rate desc]
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
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 0
    col: 18
    width: 6
    height: 2
  - name: Impression Funnel
    title: Impression Funnel
    model: campaign_manager
    explore: impression_funnel
    type: looker_column
    fields: [impression_funnel.total_impressions, impression_funnel.total_clicks,
      impression_funnel.total_conversions]
    sorts: [impression_funnel.total_impressions desc]
    limit: 500
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
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    colors: ["#5245ed", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080", "#a2dcf3",
      "#776fdf", "#e9b404", "#635189"]
    series_colors: {}
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 13
    col: 11
    width: 13
    height: 8
  - name: Distinct Users Reached
    title: Distinct Users Reached
    model: campaign_manager
    explore: impression
    type: single_value
    fields: [impression.distinct_users]
    sorts: [impression.distinct_users desc]
    limit: 1000
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
    series_labels:
      impression.distinct_users: Users
    listen:
      Campaign ID: impression.campaign_id
    row: 0
    col: 0
    width: 6
    height: 2
  - name: Average Impressions per User (copy)
    title: Average Impressions per User (copy)
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
      Campaign ID: impression_funnel.campaign_id
    row: 0
    col: 6
    width: 6
    height: 2
  - name: Campaign Country Reach
    title: Campaign Country Reach
    model: campaign_manager
    explore: impression_funnel
    type: looker_map
    fields: [impression_funnel.total_impressions, impression_funnel.country_code]
    sorts: [impression_funnel.total_impressions desc]
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
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    value_labels: legend
    label_type: labPer
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
    map_latitude: 42.795884236472936
    map_longitude: -9.108910891089112
    map_zoom: 2
    map_value_scale_clamp_min: 0
    map_value_scale_clamp_max: 10000
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 35
    col: 0
    width: 24
    height: 14
  - name: Ad Breakdown
    title: Ad Breakdown
    model: campaign_manager
    explore: impression
    type: looker_pie
    fields: [impression.count, match_table_ads.ad_name]
    sorts: [match_table_ads.ad_name]
    limit: 50
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: none
    label_type: labPer
    show_view_names: false
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
    series_labels:
      impression.distinct_users: Users
    inner_radius: 35
    listen:
      Campaign ID: impression.campaign_id
    row: 7
    col: 17
    width: 7
    height: 6
  - name: Impressions, Clicks and Conversions by First Impression Date
    title: Impressions, Clicks and Conversions by First Impression Date
    model: campaign_manager
    explore: impression_funnel
    type: looker_line
    fields: [impression_funnel.total_impressions, impression_funnel.total_conversions,
      impression_funnel.total_clicks, impression_funnel.first_ad_impression_date]
    sorts: [impression_funnel.first_ad_impression_date desc]
    limit: 500
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
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors: ["#5245ed", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080",
      "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    series_colors: {}
    y_axis_labels: []
    y_axis_orientation: [left, right, right]
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 13
    col: 0
    width: 11
    height: 8
  - name: Action Rate (copy)
    title: Action Rate (copy)
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
      Campaign ID: impression_funnel.campaign_id
    row: 0
    col: 12
    width: 6
    height: 2
  - name: Clicks (copy)
    title: Clicks (copy)
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
      Campaign ID: click.campaign_id
    row: 2
    col: 6
    width: 6
    height: 2
  - name: Total Conversions
    title: Total Conversions
    model: campaign_manager
    explore: impression_funnel
    type: single_value
    fields: [impression_funnel.total_conversions]
    sorts: [impression_funnel.total_conversions desc]
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
      Campaign ID: impression_funnel.campaign_id
    row: 2
    col: 12
    width: 6
    height: 2
  - name: Impressions (copy)
    title: Impressions (copy)
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
      Campaign ID: impression.campaign_id
    row: 2
    col: 0
    width: 6
    height: 2
  - name: Trending Action and Conversion Rates
    title: Trending Action and Conversion Rates
    model: campaign_manager
    explore: impression_funnel
    type: looker_line
    fields: [impression_funnel.first_ad_impression_date, impression_funnel.conversion_rate,
      impression_funnel.action_rate, impression_funnel.count_users, impression_funnel.total_impressions,
      impression_funnel.total_conversions, impression_funnel.total_clicks]
    sorts: [impression_funnel.first_ad_impression_date desc]
    limit: 500
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
    y_axis_combined: false
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types:
      impression_funnel.count_users: column
    colors: ["#5245ed", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080",
      "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    series_colors:
      impression_funnel.count_users: "#71747a"
      impression_funnel.action_rate: "#98cceb"
      impression_funnel.conversion_rate: "#9e98ed"
    y_axis_labels: []
    y_axis_orientation: [right, right]
    hidden_fields: [impression_funnel.total_impressions, impression_funnel.total_conversions,
      impression_funnel.total_clicks]
    hide_legend: true
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 21
    col: 0
    width: 24
    height: 6
  - name: Count Users by Ad and First Impression Date
    title: Count Users by Ad and First Impression Date
    model: campaign_manager
    explore: impression_funnel
    type: looker_line
    fields: [impression_funnel.first_ad_impression_date, impression_funnel.count_users,
      impression_funnel.ad_id]
    pivots: [impression_funnel.ad_id]
    sorts: [impression_funnel.first_ad_impression_date desc]
    limit: 500
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
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors: 'palette: Santa Cruz'
    series_colors: {}
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 27
    col: 0
    width: 24
    height: 8
  filters:
  - name: Campaign ID
    title: Campaign ID
    type: field_filter
    default_value: '10364418'
    allow_multiple_values: true
    required: false
    model: campaign_manager
    explore: impression_funnel
    listens_to_filters: []
    field: impression_funnel.campaign_id
