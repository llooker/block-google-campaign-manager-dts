project_name: "block-google-campaign-manager-dts"

constant: CONFIG_PROJECT_NAME {
  value: "cm-block-config"
  export: override_required
}

constant: CONNECTION {
  value: "bigquery-campaign-manager-connection"
  #value: "db-platform-sol-cm"
  export: override_required
}

constant: PROJECT_NAME {
  value: "project-name"
  export: override_optional
}
constant: DATASET_NAME {
  value: "dataset-name"
  export: override_optional
}
constant: CAMPAIGN_MANAGER_ID {
  value: "id-number"
  export: override_optional
}


local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
}
