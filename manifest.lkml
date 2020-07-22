project_name: "block-google-campaign-manager-dts"

constant: CONFIG_PROJECT_NAME {
  value: "block-google-campaign-manager-dts-config"
  export: override_required
}

constant: CONNECTION {
  # value: "big-query-campaign-manager-dts"
  value: "brick-layer"
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
  value: "campaign-manager-id"
  export: override_optional
}


local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
}
