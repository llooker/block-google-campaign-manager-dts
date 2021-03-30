- dashboard: 2_top_performers__breakdowns
  title: "(2) Top Performers & Breakdowns"
  layout: newspaper
  preferred_viewer: dashboards-next

  elements:
  - title: Top 10 Campaigns
    name: Top 10 Campaigns
    model: campaign_manager_marketplace
    explore: impression
    type: looker_bar
    fields: [impression.distinct_users, impression.count, impression.campaign_id]
    filters:
      impression.selected_comparison: "%Last%"
    sorts: [impression.distinct_users desc]
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: false
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
    font_size: '8'
    series_types: {}
    series_colors:
      impression.count: "#4285F4"
      impression.distinct_users: "#34A853"
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
      Date Range: impression.comparison_type
    row: 3
    col: 0
    width: 8
    height: 7
  - name: <font color="#34A853" size="45" weight="bold"><i class="fa fa-eye" aria-hidden="true"></i><strong>
      Top Performers </strong> <font color= "#4285F4"size="45"> Campaigns, Advertisers
      & Sites </font>
    type: text
    title_text: <font color="#34A853" size="4.5" weight="bold"><i class="fa fa-eye"
      aria-hidden="true"></i><strong> Top Performers </strong> <font color= "#4285F4"size="4.5">
      Campaigns, Advertisers & Sites </font>
    subtitle_text: ''
    body_text: "<center><b>Recommended Action</b>\U0001f447 Drill into Campaign IDs\
      \ to get a 360 view on how that campaign is performing, or navigate directly\
      \ to Campaign Manager for further analysis.</center>"
    row: 0
    col: 4
    width: 16
    height: 3
  - title: Top 10 Advertisers
    name: Top 10 Advertisers
    model: campaign_manager_marketplace
    explore: impression
    type: looker_bar
    fields: [impression.distinct_users, impression.count, impression.advertiser_id]
    filters:
      impression.selected_comparison: "%Last%"
    sorts: [impression.distinct_users desc]
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: false
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
    font_size: '8'
    series_types: {}
    series_colors:
      impression.count: "#4285F4"
      impression.distinct_users: "#34A853"
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
      Date Range: impression.comparison_type
    row: 3
    col: 8
    width: 8
    height: 7
  - title: Top 10 Sites
    name: Top 10 Sites
    model: campaign_manager_marketplace
    explore: impression
    type: looker_bar
    fields: [impression.distinct_users, impression.count, impression.site_id_dcm]
    filters:
      impression.selected_comparison: "%Last%"
    sorts: [impression.distinct_users desc]
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: false
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
    font_size: '8'
    series_types: {}
    series_colors:
      impression.count: "#4285F4"
      impression.distinct_users: "#34A853"
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
      Date Range: impression.comparison_type
    row: 3
    col: 16
    width: 8
    height: 7
  - name: Breakdowns
    type: text
    title_text: Breakdowns
    subtitle_text: ''
    body_text: |-
      <center>
      <b>Recommended Action</b>👇 Edit the tiles below to create custom classifications based on placement name or campaign tactic. <br> Drill into these metrics to get an additional level of granularity into underlying factors.</center>
    row: 10
    col: 0
    width: 24
    height: 3
  - title: Breakdown (A)
    name: Breakdown (A)
    model: campaign_manager_marketplace
    explore: impression
    type: looker_line
    fields: [impression.impressions_per_user, impression.event_date, impression.distinct_users]
    fill_fields: [impression.event_date]
    filters:
      match_table_campaigns.campaign_name: "%P%"
      impression.selected_comparison: "%Last%"
    sorts: [impression.event_date desc]
    limit: 500
    column_limit: 50
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
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: impression.distinct_users,
            id: impression.distinct_users, name: Reach Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: impression.impressions_per_user,
            id: impression.impressions_per_user, name: Impressions per User}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      impression.distinct_users: column
    series_colors:
      impression.distinct_users: "#4285F4"
      impression.impressions_per_user: "#EA4335"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_series: []
    listen:
      Date Range: impression.comparison_type
    row: 13
    col: 0
    width: 8
    height: 6
  - title: Breakdown (B)
    name: Breakdown (B)
    model: campaign_manager_marketplace
    explore: impression
    type: looker_line
    fields: [impression.impressions_per_user, impression.event_date, impression.distinct_users]
    fill_fields: [impression.event_date]
    filters:
      match_table_campaigns.campaign_name: "%RTG%"
      impression.selected_comparison: "%Last%"
    sorts: [impression.event_date desc]
    limit: 500
    column_limit: 50
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
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: impression.distinct_users,
            id: impression.distinct_users, name: Distinct Users}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: impression.impressions_per_user,
            id: impression.impressions_per_user, name: Impressions per User}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      impression.distinct_users: column
    series_colors:
      impression.distinct_users: "#4285F4"
      impression.impressions_per_user: "#EA4335"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_series: []
    listen:
      Date Range: impression.comparison_type
    row: 13
    col: 8
    width: 8
    height: 6
  - title: Breakdown (C)
    name: Breakdown (C)
    model: campaign_manager_marketplace
    explore: impression
    type: looker_line
    fields: [impression.impressions_per_user, impression.event_date, impression.distinct_users]
    fill_fields: [impression.event_date]
    filters:
      impression.selected_comparison: "%Last%"
      match_table_campaigns.campaign_name: "%BRD%"
    sorts: [impression.event_date desc]
    limit: 500
    column_limit: 50
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
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: impression.distinct_users,
            id: impression.distinct_users, name: Distinct Users}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: impression.impressions_per_user,
            id: impression.impressions_per_user, name: Impressions per User}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      impression.distinct_users: column
    series_colors:
      impression.distinct_users: "#4285F4"
      impression.impressions_per_user: "#EA4335"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Date Range: impression.comparison_type
    row: 13
    col: 16
    width: 8
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <html>
      <center>
      <button style="background-color: #4285F4; border: none; text-align: center; color: white; padding: 10px 25px; font-size: 12px;"><a style="text-decoration: none; color: white;" href="/dashboards-next/campaign_manager::1_reach_overview">⬅︎ <b>Go to Reach<br>Overview Dashboard</b></a></button>
      </center>
      </html>
    row: 0
    col: 0
    width: 4
    height: 3
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: seven
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - seven
      - fourteen
      - thirty
    model: campaign_manager_marketplace
    explore: impression
    listens_to_filters: []
    field: impression.comparison_type
