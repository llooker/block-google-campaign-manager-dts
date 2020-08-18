- dashboard: 3_campaign_overview
  title: "(3) Campaign Overview"
  layout: newspaper
  # preferred_viewer: dashboards-next # Dashboards Next set as default from 7.12 release

  elements:
  - title: Campaign Metrics
    name: Campaign Metrics
    model: campaign_manager_marketplace_marketplace
    explore: impression_funnel
    type: looker_grid
    fields: [impression_funnel.campaign_id, match_table_campaigns.campaign_start_date,
      match_table_campaigns.campaign_end_date, impression_funnel.advertiser_id, match_table_ads.ad_type,
      impression_funnel.ad_id]
    sorts: [match_table_campaigns.campaign_start_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    header_font_color: "#ffffff"
    header_background_color: "#4285F4"
    truncate_column_names: false
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
    defaults_version: 1
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 6
    col: 0
    width: 17
    height: 6
  - title: Daily Campaign Impression Metrics
    name: Daily Campaign Impression Metrics
    model: campaign_manager_marketplace_marketplace
    explore: impression
    type: looker_column
    fields: [impression.distinct_users, impression.event_date, impression.count]
    sorts: [impression.event_date]
    limit: 1000
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    colors: ["#5245ed", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080",
      "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    series_types: {}
    series_colors:
      impression.count: "#4285F4"
      impression.distinct_users: "#34A853"
    series_labels:
      impression.distinct_users: Users
    show_null_points: true
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
    map_latitude: 34.45221847282654
    map_longitude: 0.3515625
    map_zoom: 2
    defaults_version: 1
    listen:
      Campaign ID: impression.campaign_id
    row: 12
    col: 0
    width: 24
    height: 6
  - title: Campaign Click Through Rate
    name: Campaign Click Through Rate
    model: campaign_manager_marketplace_marketplace
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
    row: 4
    col: 18
    width: 6
    height: 2
  - title: Campaign Conversion Rate
    name: Campaign Conversion Rate
    model: campaign_manager_marketplace
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
    row: 2
    col: 18
    width: 6
    height: 2
  - title: Impression Funnel
    name: Impression Funnel
    model: campaign_manager_marketplace
    explore: impression_funnel
    type: looker_column
    fields: [impression_funnel.total_impressions, impression_funnel.total_clicks,
      impression_funnel.total_conversions]
    sorts: [impression_funnel.total_impressions desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: impression_funnel.total_impressions,
            id: impression_funnel.total_impressions, name: Total Impressions}, {axisId: impression_funnel.total_conversions,
            id: impression_funnel.total_conversions, name: Total Conversions}, {axisId: impression_funnel.total_clicks,
            id: impression_funnel.total_clicks, name: Total Clicks}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: []
    colors: ["#5245ed", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080", "#a2dcf3",
      "#776fdf", "#e9b404", "#635189"]
    series_types: {}
    series_colors: {}
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelScale: ''
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 18
    col: 11
    width: 13
    height: 8
  - title: Distinct Users Reached
    name: Distinct Users Reached
    model: campaign_manager_marketplace
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
    row: 2
    col: 0
    width: 6
    height: 2
  - title: Campaign Country Reach
    name: Campaign Country Reach
    model: campaign_manager_marketplace
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
    row: 43
    col: 0
    width: 24
    height: 14
  - title: Ad Breakdown
    name: Ad Breakdown
    model: campaign_manager_marketplace
    explore: impression
    type: looker_pie
    fields: [impression.count, match_table_ads.ad_name]
    sorts: [match_table_ads.ad_name]
    limit: 50
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: none
    label_type: labPer
    inner_radius: 40
    colors: ["#5245ed", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080",
      "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    color_application:
      collection_id: google
      palette_id: google-sequential-0
      options:
        steps: 5
    series_colors: {}
    series_labels:
      impression.distinct_users: Users
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
    defaults_version: 1
    listen:
      Campaign ID: impression.campaign_id
    row: 6
    col: 17
    width: 7
    height: 6
  - title: Impressions, Clicks and Conversions by First Impression Date
    name: Impressions, Clicks and Conversions by First Impression Date
    model: campaign_manager_marketplace
    explore: impression_funnel
    type: looker_line
    fields: [impression_funnel.total_impressions, impression_funnel.total_conversions,
      impression_funnel.total_clicks, impression_funnel.first_ad_impression_date]
    sorts: [impression_funnel.first_ad_impression_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axis_labels: []
    colors: ["#5245ed", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080",
      "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    series_types: {}
    series_colors: {}
    series_point_styles:
      impression_funnel.total_impressions: diamond
      impression_funnel.total_conversions: diamond
      impression_funnel.total_clicks: diamond
    y_axis_orientation: [left, right, right]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 18
    col: 0
    width: 11
    height: 8
  - title: Action Rate
    name: Action Rate
    model: campaign_manager_marketplace
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
    row: 2
    col: 12
    width: 6
    height: 2
  - title: Clicks
    name: Clicks
    model: campaign_manager_marketplace
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
    row: 4
    col: 6
    width: 6
    height: 2
  - title: Total Conversions
    name: Total Conversions
    model: campaign_manager_marketplace
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
    row: 4
    col: 12
    width: 6
    height: 2
  - title: Impressions
    name: Impressions
    model: campaign_manager_marketplace
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
    row: 4
    col: 0
    width: 6
    height: 2
  - title: Trending Action and Conversion Rates
    name: Trending Action and Conversion Rates
    model: campaign_manager_marketplace
    explore: impression_funnel
    type: looker_line
    fields: [impression_funnel.first_ad_impression_date, impression_funnel.conversion_rate,
      impression_funnel.action_rate, impression_funnel.count_users, impression_funnel.total_impressions,
      impression_funnel.total_conversions, impression_funnel.total_clicks]
    sorts: [impression_funnel.first_ad_impression_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axis_labels: []
    hide_legend: true
    colors: ["#5245ed", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080",
      "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    series_types:
      impression_funnel.count_users: column
    series_colors:
      impression_funnel.count_users: "#34A853"
    y_axis_orientation: [right, right]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [impression_funnel.total_impressions, impression_funnel.total_conversions,
      impression_funnel.total_clicks]
    defaults_version: 1
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 26
    col: 0
    width: 24
    height: 9
  - title: Count Users by Ad and First Impression Date
    name: Count Users by Ad and First Impression Date
    model: campaign_manager_marketplace
    explore: impression_funnel
    type: looker_line
    fields: [impression_funnel.first_ad_impression_date, impression_funnel.count_users,
      match_table_ads.ad_name]
    pivots: [match_table_ads.ad_name]
    sorts: [impression_funnel.first_ad_impression_date desc, match_table_ads.ad_name]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: true
    colors: ['palette: Santa Cruz']
    series_types: {}
    series_colors:
      " Tracking Ad 1x1 Flashtalking https://www.xfinity.com/ET - impression_funnel.count_users": "#c0edd5"
      ? 160 x 600 1/23/2020 - 12/31/2020 AAM DV TRST 100% CORP_Q1_2020_NASCAR_NED_NON_DT_4267656_FT_160x600
        - impression_funnel.count_users
      : "#f5dfdf"
      160x600 1.1 - 12.31 AAM TRST DV 100% BUS_Q1_2020_B2B_WST_TOT_DT_4263276_FT_160x600 - impression_funnel.count_users: "#edc0ba"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Campaign ID: impression_funnel.campaign_id
    row: 35
    col: 0
    width: 24
    height: 8
  - title: Average Impression Per User
    name: Average Impression Per User
    model: campaign_manager_marketplace
    explore: impression
    type: single_value
    fields: [impression.impressions_per_user]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Campaign ID: impression.campaign_id
    row: 2
    col: 6
    width: 6
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <center>
      <i>Note: This dashboard is displaying data on Campaign performance based on the past 60 days.<br>Please contact your Looker admin if this timeframe needs to be increased.</i>
      </center>
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Campaign ID
    title: Campaign ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: campaign_manager_marketplace
    explore: impression_funnel
    listens_to_filters: []
    field: impression_funnel.campaign_id
