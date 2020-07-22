project_name: "block-google-campaign-manager-dts"

constant: CONFIG_PROJECT_NAME {
  value: "cm-block-config"
  export: override_required
}

constant: CONNECTION {
  # value: "big-query-campaign-manager-dts"
  value: "db-platform-sol-cm"
  export: override_required
}

constant: PROJECT_NAME {
  value: "db-platform-sol"
  export: override_optional
}
constant: DATASET_NAME {
  value: "Comcast8667"
  export: override_optional
}
constant: CAMPAIGN_MANAGER_ID {
  value: "8667"
  export: override_optional
}


local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
}
