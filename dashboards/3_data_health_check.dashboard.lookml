- dashboard: 3_data_health_check
  title: "(3) Data Health Check"
  layout: newspaper
  elements:
  - name: <font color="#137333" size="45" weight="bold"><i class="fa fa-users" aria-hidden="true"></i><strong>
      User Redactions </strong> <font color= "#4285F4"size="45"> Health Check </font>
    type: text
    title_text: <font color="#137333" size="4.5" weight="bold"><i class="fa fa-users"
      aria-hidden="true"></i><strong> User Redactions </strong> <font color= "#4285F4"size="4.5">
      Health Check </font>
    subtitle_text: What percent of my DCM Data Transfer files have redacted User IDs?
    body_text: "<center> <b>Recommended Action </b>Create conditional alerts to keep\
      \ an eye on high redaction rates \U0001f6ce️. <br>Consider calculating redaction\
      \ rates by campaign to help understand what campaigns would be omitted in analyses\
      \ that require User ID. <center>"
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Total User IDs
    name: Total User IDs
    model: campaign_manager
    explore: data_health_check
    type: single_value
    fields: [redaction_combined.total_count]
    filters: {}
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
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: redaction_combined.partition
      File Type: redaction_combined.file_type
    row: 4
    col: 0
    width: 6
    height: 2
  - title: Total Filled
    name: Total Filled
    model: campaign_manager
    explore: data_health_check
    type: single_value
    fields: [redaction_combined.total_filled]
    filters: {}
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
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: redaction_combined.partition
      File Type: redaction_combined.file_type
    row: 6
    col: 0
    width: 6
    height: 2
  - title: Total Redacted
    name: Total Redacted
    model: campaign_manager
    explore: data_health_check
    type: single_value
    fields: [redaction_combined.total_redacted]
    filters: {}
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
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: redaction_combined.partition
      File Type: redaction_combined.file_type
    row: 8
    col: 0
    width: 6
    height: 2
  - title: Redaction Rate
    name: Redaction Rate
    model: campaign_manager
    explore: data_health_check
    type: single_value
    fields: [redaction_combined.redaction_rate]
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#B32F37"
    conditional_formatting: [{type: greater than, value: 0, background_color: "#fce9ec",
        font_color: "#B32F37", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: redaction_combined.partition
      File Type: redaction_combined.file_type
    row: 4
    col: 6
    width: 9
    height: 6
  - title: Redaction By File Type
    name: Redaction By File Type
    model: campaign_manager
    explore: data_health_check
    type: looker_pie
    fields: [redaction_combined.redaction_rate, redaction_combined.file_type]
    filters: {}
    sorts: [redaction_combined.redaction_rate desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: ccba75a3-58c7-4b9c-a931-4ffc59e79cba
      options:
        steps: 5
    series_colors:
      Activity: "#c2333a"
      Impression: "#db6e73"
      Click: "#e8a5ad"
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
    series_types: {}
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
    listen:
      Date Range: redaction_combined.partition
      File Type: redaction_combined.file_type
    row: 4
    col: 15
    width: 9
    height: 6
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    model: campaign_manager
    explore: data_health_check
    listens_to_filters: []
    field: redaction_combined.partition
  - name: File Type
    title: File Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: campaign_manager
    explore: data_health_check
    listens_to_filters: []
    field: redaction_combined.file_type
