include: "//@{CONFIG_PROJECT_NAME}/explores/data_health_check.explore"

########### PRESENTATION LAYER ###########
explore: data_health_check {
  extends: [data_health_check_config]
}

########### CORE LAYER ###########
explore: data_health_check_core {
  view_name: redaction_combined
  extension: required
  label: "(5) Data Health Check"
  always_filter: {
    filters: [redaction_combined.partition: "last 7 days"]
  }

}
