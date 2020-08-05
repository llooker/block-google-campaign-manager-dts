project_name: "block-google-campaign-manager-dv360-dts"

constant: CONFIG_PROJECT_NAME {
  value: "block-google-campaign-manager-dts-config"
  export: override_optional
}

constant: CONNECTION {
  value: "your_bq_connection_name"
  export: override_required
}

constant: PROJECT_NAME {
  value: "your_bq_project_name"
  export: override_optional
}
constant: DATASET_NAME {
  value: "your_bq_campaign_manager_dataset"
  export: override_optional
}
constant: CAMPAIGN_MANAGER_ID {
  value: "your_campaign_manager_id"
  export: override_optional
}


local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
}
