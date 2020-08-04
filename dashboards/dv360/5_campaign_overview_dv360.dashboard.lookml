- dashboard: campaign_overview__dv360
  title: Campaign Overview - DV360
  layout: newspaper
  elements:
  - name: <font color="#34A853" size="45" weight="bold"><i class="fa fa-tachometer"
      aria-hidden="true"></i><strong> DV360 Insights </strong> <font color= "#4285F4"size="45">
      Campaign Overview </font>
    type: text
    title_text: <font color="#34A853" size="4.5" weight="bold"><i class="fa fa-tachometer"
      aria-hidden="true"></i><strong> DV360 Insights </strong> <font color= "#4285F4"size="4.5">
      Campaign Overview </font>
    subtitle_text: How is my campaign performing?
    body_text: |-
      <center> <b>Recommended Action</b>👇 Drill into impressions and cross device conversions to get an overview of campaign performance.<center>

      (TO-DO: add a vs. previous)
    row: 4
    col: 4
    width: 16
    height: 4
  - name: Campaign Attribute Breakdown
    type: text
    title_text: Campaign Attribute Breakdown
    subtitle_text: What audiences are performing best? (@Anna if you have a better
      way to describe this feel free to edit)
    body_text: "<center> <b>Recommended Action</b>\U0001f447 Use the KPI Selector\
      \ at the top to choose a performance metric. Drill into geo or creative to get\
      \ a more granular view of performance. .<center>"
    row: 29
    col: 4
    width: 16
    height: 4
  - name: 'Poorly Performing Insertion Orders '
    type: text
    title_text: 'Poorly Performing Insertion Orders '
    subtitle_text: Which IOs need attention? (Ranked 1,2,3) (NOTE USING IDS until
      better data)
    body_text: "<center> <b>Recommended Action</b>\U0001f447 Use the KPI Selector\
      \ at the top to choose a performance metric. Click on an Insertion Order to\
      \ link to the Insertion Order Lookup, where you can take action directly in\
      \ Looker. .<center>"
    row: 49
    col: 0
    width: 24
    height: 4
  - title: Overall CPA
    name: Overall CPA
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.cpa]
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
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    listen:
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 8
    col: 0
    width: 6
    height: 2
  - title: Overall CPC
    name: Overall CPC
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.cpc]
    filters: {}
    sorts: [impression_funnel_dv360.cpc desc]
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
    defaults_version: 1
    listen:
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 8
    col: 6
    width: 6
    height: 2
  - title: Overall CPM
    name: Overall CPM
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.cpm]
    filters: {}
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
    defaults_version: 1
    listen:
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 10
    col: 6
    width: 6
    height: 2
  - title: Overall CTR
    name: Overall CTR
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.ctr]
    filters: {}
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
    defaults_version: 1
    listen:
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 10
    col: 0
    width: 6
    height: 2
  - title: Overall CR
    name: Overall CR
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.cr]
    filters: {}
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
    defaults_version: 1
    listen:
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 12
    col: 0
    width: 6
    height: 2
  - title: "% Viewable Impressions"
    name: "% Viewable Impressions"
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.percent_impressions_viewed]
    filters: {}
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
    defaults_version: 1
    listen:
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 12
    col: 6
    width: 6
    height: 2
  - title: "% Measurable Impressions"
    name: "% Measurable Impressions"
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.percent_impressions_measurable]
    filters: {}
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
    defaults_version: 1
    listen:
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 14
    col: 0
    width: 6
    height: 2
  - title: Top IO
    name: Top IO
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.dynamic_measure, impression_funnel_dv360.dbm_insertion_order_id_label]
    filters:
      dynamic_io_rank.rank: '1'
    sorts: [impression_funnel_dv360.dynamic_measure desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_fields: [impression_funnel_dv360.dynamic_measure]
    series_types: {}
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 53
    col: 0
    width: 8
    height: 2
  - title: IO 2nd
    name: IO 2nd
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.dynamic_measure, impression_funnel_dv360.dbm_insertion_order_id_label]
    filters:
      dynamic_io_rank.rank: '2'
    sorts: [impression_funnel_dv360.dynamic_measure desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_fields: [impression_funnel_dv360.dynamic_measure]
    series_types: {}
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 53
    col: 8
    width: 8
    height: 2
  - title: IO3
    name: IO3
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.dynamic_measure, impression_funnel_dv360.dbm_insertion_order_id_label]
    filters:
      dynamic_io_rank.rank: '3'
    sorts: [impression_funnel_dv360.dynamic_measure desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_fields: [impression_funnel_dv360.dynamic_measure]
    series_types: {}
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 53
    col: 16
    width: 8
    height: 2
  - title: IO Comparison
    name: IO Comparison
    model: campaign_manager
    explore: impression_funnel_dv360
    type: looker_bar
    fields: [impression_funnel_dv360.dynamic_measure, dynamic_io_rank.rank_comparitor]
    filters:
      dynamic_io_rank.rank_input: '1'
    sorts: [dynamic_io_rank.rank_comparitor]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_fields:
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 57
    col: 0
    width: 12
    height: 8
  - title: Performance by Device Type
    name: Performance by Device Type
    model: campaign_manager
    explore: impression_funnel_dv360
    type: looker_column
    fields: [impression_funnel_dv360.dynamic_measure_label, impression_funnel_dv360.dbm_device_type_name]
    filters:
      impression_funnel_dv360.dbm_browser_platform_id: "-NULL"
      impression_funnel_dv360.dynamic_measure: NOT NULL
    sorts: [impression_funnel_dv360.dynamic_measure_label desc]
    limit: 500
    column_limit: 3
    row_total: right
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_series: [Row Total - impression_funnel_dv360.dynamic_measure]
    hide_legend: false
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 41
    col: 12
    width: 12
    height: 8
  - title: Top Metric
    name: Top Metric
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.dynamic_measure_label]
    filters:
      dynamic_io_rank.rank: '1'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 55
    col: 8
    width: 4
    height: 2
  - title: Second Metric
    name: Second Metric
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.dynamic_measure_label]
    filters:
      dynamic_io_rank.rank: '2'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 55
    col: 0
    width: 4
    height: 2
  - title: Second Metric (copy)
    name: Second Metric (copy)
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.dynamic_measure_label]
    filters:
      dynamic_io_rank.rank: '3'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 55
    col: 16
    width: 4
    height: 2
  - title: Performance by Designated Metro Area
    name: Performance by Designated Metro Area
    model: campaign_manager
    explore: impression_funnel_dv360
    type: looker_map
    fields: [impression_funnel_dv360.dynamic_measure, impression_funnel_dv360.dbm_designated_market_area_dma_id]
    filters: {}
    sorts: [impression_funnel_dv360.dynamic_measure desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: true
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light_no_labels
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
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 37.849556844898764
    map_longitude: -109.75067138671876
    map_zoom: 3
    map: usa
    map_projection: ''
    quantize_colors: false
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 41
    col: 0
    width: 12
    height: 8
  - title: IO Comparison Over Time
    name: IO Comparison Over Time
    model: campaign_manager
    explore: impression_funnel_dv360
    type: looker_line
    fields: [impression_funnel_dv360.dynamic_measure, dynamic_io_rank.rank_comparitor, impression_funnel_dv360.impression_date]
    pivots: [dynamic_io_rank.rank_comparitor]
    fill_fields: [impression_funnel_dv360.impression_date]
    filters:
      dynamic_io_rank.rank_input: '1'
    sorts: [dynamic_io_rank.rank_comparitor, impression_funnel_dv360.impression_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: false
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
    show_null_points: true
    interpolation: monotone
    series_types:
      Rest of Insertion Orders - impression_funnel_dv360.dynamic_measure: area
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_fields:
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 57
    col: 12
    width: 12
    height: 8
  - title: Total Line Items
    name: Total Line Items
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.line_item_count_label]
    filters:
      dynamic_io_rank.rank: '1'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 55
    col: 4
    width: 4
    height: 2
  - title: Total Line Items (copy)
    name: Total Line Items (copy)
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.line_item_count_label]
    filters:
      dynamic_io_rank.rank: '2'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 55
    col: 12
    width: 4
    height: 2
  - title: Total Line Items (copy 2)
    name: Total Line Items (copy 2)
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.line_item_count_label]
    filters:
      dynamic_io_rank.rank: '3'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 55
    col: 20
    width: 4
    height: 2
  - title: Campaign Benchmark
    name: Campaign Benchmark
    model: campaign_manager
    explore: impression_funnel_dv360
    type: looker_line
    fields: [impression_funnel_dv360.campaign_comparison, impression_funnel_dv360.dynamic_measure, impression_funnel_dv360.impression_date]
    pivots: [impression_funnel_dv360.campaign_comparison]
    fill_fields: [impression_funnel_dv360.impression_date]
    filters:
      impression_funnel_dv360.impression_date: 5 days
    sorts: [impression_funnel_dv360.dynamic_measure desc 0, impression_funnel_dv360.campaign_comparison]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Campaign ID: impression_funnel_dv360.campaign_input
    row: 8
    col: 12
    width: 12
    height: 8
  - title: Insertion Order Breakdown
    name: Insertion Order Breakdown
    model: campaign_manager
    explore: impression_funnel_dv360
    type: looker_grid
    fields: [impression_funnel_dv360.dbm_revenue, impression_funnel_dv360.count_impressions, impression_funnel_dv360.dynamic_measure,
      impression_funnel_dv360.dbm_insertion_order_id]
    filters:
      impression_funnel_dv360.dbm_line_item_id: NOT NULL
      impression_funnel_dv360.dbm_insertion_order_id: ''
    sorts: [impression_funnel_dv360.dbm_revenue desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      impression_funnel_dv360.dbm_revenue:
        is_active: true
      impression_funnel_dv360.count_impressions:
        is_active: true
    series_text_format:
      impression_funnel_dv360.dbm_line_item_id:
        bold: true
        fg_color: "#4285F4"
        align: center
        italic: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: [impression_funnel_dv360.dynamic_measure]}]
    series_value_format:
      impression_funnel_dv360.dbm_line_item_id:
        name: id
        format_string: '0'
        label: ID
    defaults_version: 1
    series_types: {}
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 20
    col: 12
    width: 12
    height: 9
  - title: Total Insertion Orders
    name: Total Insertion Orders
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.insertion_order_count]
    filters:
      impression_funnel_dv360.impression_date: 7 days
    limit: 500
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
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 14
    col: 6
    width: 6
    height: 2
  - title: Percent Change in Metric by IO
    name: Percent Change in Metric by IO
    model: campaign_manager
    explore: impression_funnel_dv360
    type: looker_bar
    fields: [impression_funnel_dv360.dbm_insertion_order_id, impression_funnel_dv360.dynamic_measure, impression_funnel_dv360.previous_period]
    pivots: [impression_funnel_dv360.previous_period]
    filters:
      impression_funnel_dv360.dbm_line_item_id: NOT NULL
      impression_funnel_dv360.dbm_insertion_order_id: ''
      impression_funnel_dv360.impression_date: 14 days
      impression_funnel_dv360.previous_period: "-NULL"
    sorts: [impression_funnel_dv360.previous_period 0, percent_change desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: percent_change, label: Percent Change, expression: 'max(pivot_row((${impression_funnel_dv360.dynamic_measure}-pivot_offset(${impression_funnel_dv360.dynamic_measure},-1))/pivot_offset(${impression_funnel_dv360.dynamic_measure},-1)))',
        value_format: !!null '', value_format_name: percent_2, _kind_hint: supermeasure,
        _type_hint: number}]
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
    series_types: {}
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      impression_funnel_dv360.dbm_revenue:
        is_active: true
      impression_funnel_dv360.count_impressions:
        is_active: true
    series_text_format:
      impression_funnel_dv360.dbm_line_item_id:
        bold: true
        fg_color: "#4285F4"
        align: center
        italic: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: [impression_funnel_dv360.dynamic_measure]}]
    series_value_format:
      impression_funnel_dv360.dbm_line_item_id:
        name: id
        format_string: '0'
        label: ID
    defaults_version: 1
    hidden_fields: [impression_funnel_dv360.dynamic_measure]
    note_state: collapsed
    note_display: above
    note_text: Based on Date Filter, compared to Prior Period
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.previous_period_filter
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 20
    col: 0
    width: 12
    height: 9
  - name: Insertion Order Breakdown (2)
    type: text
    title_text: Insertion Order Breakdown
    subtitle_text: How are my Insertion Orders Performing?
    body_text: "<center> <b>Recommended Action</b>\U0001f447 Use the KPI Selector\
      \ to pick out a comparison metric, and link out to the IO Lookup Dashboard for\
      \ any IOs that show a large percent change.<center>"
    row: 16
    col: 0
    width: 24
    height: 4
  - name: TO DO on this dashboard
    type: text
    title_text: TO DO on this dashboard
    body_text: |-
      - Filter on Spend/Contribution to Performance
      - vs. Previous Period for the KPIs
      - Point to Impression Funnel
      - Update Date filter and all metrics
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Link to DV360
    name: Link to DV360
    model: campaign_manager
    explore: impression_funnel_dv360
    type: single_value
    fields: [impression_funnel_dv360.campaign_id]
    filters: {}
    sorts: [impression_funnel_dv360.campaign_id]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    listen:
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 4
    col: 20
    width: 4
    height: 4
  - title: Performance by Private vs Public Auction
    name: Performance by Private vs Public Auction
    model: campaign_manager
    explore: impression_funnel_dv360
    type: looker_column
    fields: [impression_funnel_dv360.dynamic_measure_label, impression_funnel_dv360.is_public]
    filters:
      impression_funnel_dv360.is_public: "-NULL"
    sorts: [impression_funnel_dv360.dynamic_measure_label desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: ''
    font_size: '12'
    series_types: {}
    series_colors:
      'Yes': "#FBBC04"
    series_labels:
      'No': Private
      'Yes': Public
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    show_null_points: true
    listen:
      Metric to Compare: impression_funnel_dv360.metric_selector
      Impression Date: impression_funnel_dv360.impression_date
      Campaign ID: impression_funnel_dv360.campaign_id
    row: 33
    col: 0
    width: 12
    height: 8
  - title: Performance by Targeted Segments
    name: Performance by Targeted Segments
    model: campaign_manager
    explore: impression_funnel_dv360
    type: looker_grid
    fields: [impression_funnel_dv360.dynamic_measure, impression_funnel_dv360.dbm_matching_targeted_segments]
    filters:
      impression_funnel_dv360.metric_selector: Conversion Rate
    sorts: [impression_funnel_dv360.dynamic_measure desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_average, label: vs. Average, expression: "(${impression_funnel_dv360.dynamic_measure}-mean(${impression_funnel_dv360.dynamic_measure}))/mean(${impression_funnel_dv360.dynamic_measure})",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      impression_funnel_dv360.dynamic_measure:
        is_active: false
      vs_average:
        is_active: true
        palette:
          palette_id: google-sequential-0
          collection_id: google
    series_text_format:
      impression_funnel_dv360.dbm_creative_id:
        bold: true
        italic: true
        fg_color: "#4285F4"
        align: center
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-diverging-0,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [impression_funnel_dv360.dynamic_measure]}]
    series_types: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    defaults_version: 1
    listen: {}
    row: 33
    col: 12
    width: 12
    height: 8
  filters:
  - name: Campaign ID
    title: Campaign ID
    type: field_filter
    default_value: '9611484'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: campaign_manager_dv360_marketplace
    explore: impression_funnel_dv360
    listens_to_filters: []
    field: impression_funnel_dv360.campaign_id
  - name: Metric to Compare
    title: Metric to Compare
    type: field_filter
    default_value: Cost Per 1000 Impressions
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Cost Per Acquisition
      - Cost Per Click
      - Click Through Rate
      - Cost Per 1000 Impressions
      - Conversion Rate
      - Viewable Impression Rate
      - Measureable Impression Rate
    model: campaign_manager_dv360_marketplace
    explore: impression_funnel_dv360
    listens_to_filters: []
    field: impression_funnel_dv360.metric_selector
  - name: Impression Date
    title: Date
    type: field_filter
    default_value: 5 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: inline
      options:
      - seven
      - fourteen
      - thirty
    model: campaign_manager_dv360_marketplace
    explore: impression_funnel_dv360
    listens_to_filters: []
    field: impression_funnel_dv360.impression_date
