include: "//@{CONFIG_PROJECT_NAME}/explores/data_health_check.explore"

explore: data_health_check {
  extends: [data_health_check_config]
}

explore: data_health_check_core {
  view_name: redaction_combined
  extension: required
  label: "(5) Data Health Check"
  always_filter: {
    filters: [redaction_combined.partition: "last 7 days"]
  }
}
