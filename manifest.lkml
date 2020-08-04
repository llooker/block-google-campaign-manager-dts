project_name: "block-google-campaign-manager-dv360-dts"

constant: CONFIG_PROJECT_NAME {
  value: "cm-block-config"
  export: override_required
}

constant: CONNECTION {
  #value: "bigquery-campaign-manager-connection"
  value: "db-platform-sol-cm"
  export: override_required
}

constant: PROJECT_NAME {
  #value: "project-name"
  value: "db-platform-sol"
  export: override_optional
}
constant: DATASET_NAME {
  #value: "dataset-name"
  value: "Comcast8667"
  export: override_optional
}
constant: CAMPAIGN_MANAGER_ID {
  #value: "id-number"
  value: "8667"
  export: override_optional
}


local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
}
