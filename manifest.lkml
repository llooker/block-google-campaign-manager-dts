project_name: "block-google-campaign-manager-dts"

constant: CONNECTION_NAME {
  value: "your_bq_connection_name"
  export: override_optional
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
