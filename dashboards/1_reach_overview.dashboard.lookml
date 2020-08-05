- dashboard: 1_reach_overview
  title: "(1) Reach Overview"
  layout: newspaper
  #preferred_viewer: dashboards-next

  elements:
  - title: Users by Browser Type
    name: Users by Browser Type
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: looker_pie
    fields: [impression.distinct_users, match_table_browsers.browser_platform]
    filters:
      impression.selected_comparison: "%Last%"
    sorts: [impression.distinct_users desc]
    limit: 1000
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    colors: ['palette: Santa Cruz']
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
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
    defaults_version: 1
    listen:
      Date Range: impression.comparison_type
    row: 15
    col: 12
    width: 12
    height: 7
  - title: Daily Users and Impressions
    name: Daily Users and Impressions
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: looker_line
    fields: [impression.distinct_users, impression.event_date, impression.count]
    filters:
      impression.selected_comparison: "%Last%"
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
    point_style: circle
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
    y_axes: [{label: '', orientation: left, series: [{axisId: impression.count, id: impression.count,
            name: Impressions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: impression.distinct_users, id: impression.distinct_users,
            name: Distinct Users}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    colors: ["#5245ed", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080",
      "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    series_types:
      impression.count: column
    series_colors:
      impression.count: "#34A853"
      impression.distinct_users: "#4285F4"
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
    map_latitude: 34.45221847282654
    map_longitude: 0.3515625
    map_zoom: 2
    defaults_version: 1
    listen:
      Date Range: impression.comparison_type
    row: 5
    col: 0
    width: 12
    height: 6
  - title: Users
    name: Users
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: single_value
    fields: [impression.distinct_users, impression.selected_comparison]
    filters:
      impression.selected_comparison: "-EMPTY"
    sorts: [impression.selected_comparison]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_previous_period, label: vs Previous Period,
        expression: "${impression.distinct_users}/offset(${impression.distinct_users},1)-1",
        value_format: !!null '', value_format_name: percent_2, is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: forestgreen
    value_format: 0.000,," M"
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
    defaults_version: 1
    hidden_fields: []
    listen:
      Date Range: impression.comparison_type
    row: 3
    col: 0
    width: 8
    height: 2
  - title: Impressions
    name: Impressions
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: single_value
    fields: [impression.count_impressions, impression.selected_comparison]
    filters:
      impression.selected_comparison: "-EMPTY"
    sorts: [impression.selected_comparison]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_previous_period, label: vs Previous Period,
        expression: "${impression.count_impressions} / offset(${impression.count_impressions},\
          \ 1) -1", value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: forestgreen
    value_format: 0.000,," M"
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
    defaults_version: 1
    listen:
      Date Range: impression.comparison_type
    row: 3
    col: 8
    width: 8
    height: 2
  - title: Active Campaigns
    name: Active Campaigns
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: single_value
    fields: [impression.campaign_count, impression.selected_comparison]
    filters:
      impression.selected_comparison: "-EMPTY"
    sorts: [impression.selected_comparison]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_previous_period, label: vs Previous Period,
        expression: "${impression.campaign_count}-offset(${impression.campaign_count},1)",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: forestgreen
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
    defaults_version: 1
    listen:
      Date Range: impression.comparison_type
    row: 13
    col: 16
    width: 8
    height: 2
  - title: Clicks
    name: Clicks
    model: campaign_manager_dv360_marketplace
    explore: click
    type: single_value
    fields: [click.count, click.selected_comparison]
    filters:
      click.selected_comparison: "-EMPTY"
    sorts: [click.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_previous_period, label: vs Previous Period,
        expression: "${click.count}/offset(${click.count},1)-1", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: forestgreen
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
    defaults_version: 1
    listen:
      Date Range: click.comparison_type
    row: 13
    col: 0
    width: 8
    height: 2
  - title: Conversions
    name: Conversions
    model: campaign_manager_dv360_marketplace
    explore: activity
    type: single_value
    fields: [activity.count, activity.selected_comparison]
    filters:
      activity.event_type: CONVERSION
      activity.selected_comparison: "-EMPTY"
    sorts: [activity.selected_comparison]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_previous_period, label: vs Previous Period,
        expression: "${activity.count}/offset(${activity.count},1)-1", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: forestgreen
    value_format: 0.000,," M"
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
    defaults_version: 1
    listen:
      Date Range: activity.comparison_type
    row: 13
    col: 8
    width: 8
    height: 2
  - title: Users by State
    name: Users by State
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: looker_map
    fields: [impression.distinct_users, impression.country_code]
    filters:
      impression.state_region: "-NULL"
      impression.country_code: "-NULL"
      impression.selected_comparison: "%Last%"
    sorts: [impression.distinct_users desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
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
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 39.842286020743394
    map_longitude: -96.064453125
    map_zoom: 3
    map_value_colors: ["#4285F4", "#185ABC"]
    map: usa
    map_projection: ''
    quantize_colors: false
    show_antarctica: false
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
    defaults_version: 1
    title_hidden: true
    listen:
      Date Range: impression.comparison_type
    row: 24
    col: 0
    width: 12
    height: 10
  - name: <font color="#34A853" size="45" weight="bold"><i class="fa fa-tachometer"
      aria-hidden="true"></i><strong> DCM Insights </strong> <font color= "#4285F4"size="45">
      Reach Overview </font>
    type: text
    title_text: <font color="#34A853" size="4.5" weight="bold"><i class="fa fa-tachometer"
      aria-hidden="true"></i><strong> DCM Insights </strong> <font color= "#4285F4"size="4.5">
      Reach Overview </font>
    subtitle_text: How are my campaigns performing?
    body_text: "<center> <b>Recommended Action</b>\U0001f447 Drill into impressions\
      \ and conversions to get an overview of campaign performance.<center>"
    row: 0
    col: 3
    width: 16
    height: 3
  - title: Conversions by Browser Type
    name: Conversions by Browser Type
    model: campaign_manager_dv360_marketplace
    explore: activity
    type: looker_column
    fields: [activity.count, match_table_browsers.browser_platform, activity.event_date]
    pivots: [match_table_browsers.browser_platform]
    fill_fields: [activity.event_date]
    filters:
      activity.event_type: CONVERSION
      activity.selected_comparison: "%Last%"
    sorts: [activity.count desc 0, match_table_browsers.browser_platform]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      Firefox - activity.count: "#FBBC04"
      Google Chrome - activity.count: "#34A853"
      Safari (iPhone/iPod) - activity.count: "#4285F4"
      Safari - activity.count: "#EA4335"
      Other - activity.count: "#B31412"
      Opera - activity.count: "#E8EAED"
      Microsoft Internet Explorer - activity.count: "#137333"
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    value_format: 0.000,," M"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Date Range: activity.comparison_type
    row: 15
    col: 0
    width: 12
    height: 7
  - title: 'AV: Eligible Imps'
    name: 'AV: Eligible Imps'
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: single_value
    fields: [impression.active_view_eligible_impressions]
    filters:
      impression.selected_comparison: "%Last%"
    sorts: [impression.active_view_eligible_impressions desc]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.000,," M"
    defaults_version: 1
    listen:
      Date Range: impression.comparison_type
    row: 24
    col: 12
    width: 4
    height: 2
  - title: 'AV: Measureable Imp'
    name: 'AV: Measureable Imp'
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: single_value
    fields: [impression.active_view_measurable_impressions]
    filters:
      impression.selected_comparison: "%Last%"
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.000,," M"
    defaults_version: 1
    listen:
      Date Range: impression.comparison_type
    row: 24
    col: 16
    width: 4
    height: 2
  - title: Viewable Imps
    name: Viewable Imps
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: single_value
    fields: [impression.active_view_viewable_impressions]
    filters:
      impression.selected_comparison: "%Last%"
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.000,," M"
    defaults_version: 1
    listen:
      Date Range: impression.comparison_type
    row: 24
    col: 20
    width: 4
    height: 2
  - name: Impressions By Geo
    type: text
    title_text: Impressions By Geo
    row: 22
    col: 0
    width: 12
    height: 2
  - name: Viewability
    type: text
    title_text: Viewability
    row: 22
    col: 12
    width: 12
    height: 2
  - title: Viewable Impressions
    name: Viewable Impressions
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: looker_column
    fields: [impression.event_date, impression.active_view_viewable_impressions, match_table_operating_systems.operating_system]
    pivots: [match_table_operating_systems.operating_system]
    filters:
      impression.selected_comparison: "%Last%"
    sorts: [impression.event_date, match_table_operating_systems.operating_system]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: impression.count, id: impression.count,
            name: Impressions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: impression.distinct_users, id: impression.distinct_users,
            name: Distinct Users}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: []
    colors: ["#5245ed", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a", "#706080",
      "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    series_types: {}
    series_colors:
      impression.count: "#137333"
      impression.distinct_users: "#C2DD67"
      impression.active_view_viewable_impressions: "#72D16D"
      Smartphone - impression.active_view_viewable_impressions: "#185ABC"
      Tablet - impression.active_view_viewable_impressions: "#EA8600"
      Microsoft Windows 10 - impression.active_view_viewable_impressions: "#34A853"
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
    row: 26
    col: 12
    width: 12
    height: 8
  - name: Clicks, Conversions & Users by Browser Type
    type: text
    title_text: Clicks, Conversions & Users by Browser Type
    row: 11
    col: 0
    width: 24
    height: 2
  - title: Impressions Per User
    name: Impressions Per User
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: single_value
    fields: [impression.impressions_per_user, impression.selected_comparison]
    filters:
      impression.selected_comparison: "-EMPTY"
    sorts: [impression.selected_comparison]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_previous_period, label: vs Previous Period,
        expression: "${impression.impressions_per_user}-offset(${impression.impressions_per_user},\
          \ 1)", value_format: !!null '', value_format_name: decimal_2, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Range: impression.comparison_type
    row: 3
    col: 16
    width: 8
    height: 2
  - title: Impressions Per User - Tiered
    name: Impressions Per User - Tiered
    model: campaign_manager_dv360_marketplace
    explore: impression
    type: looker_column
    fields: [impression.count, user_impression_facts.impressions_per_user_tiered]
    filters:
      user_impression_facts.impressions_per_user_tiered: "-Below 1,-Undefined"
      impression.selected_comparison: "%Last%"
    sorts: [user_impression_facts.impressions_per_user_tiered]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: impression.comparison_type
    row: 5
    col: 12
    width: 12
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <html>
      <center>
      <button style="background-color: #4285F4; border: none; text-align: center; color: white; padding: 10px 25px; font-size: 12px;"><a style="text-decoration: none; color: white;" href="/dashboards-next/campaign_manager::2_top_performers__breakdowns"><b>Go to Top Performers<br>Dashboard</b> ➜</a></button>
      </center>
      </html>
    row: 0
    col: 19
    width: 5
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
    model: campaign_manager_dv360_marketplace
    explore: impression
    listens_to_filters: []
    field: impression.comparison_type
