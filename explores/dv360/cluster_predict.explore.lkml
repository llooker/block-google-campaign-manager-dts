include: "//@{CONFIG_PROJECT_NAME}/explores/dv360/cluster_predict.explore"
include: "/views/dv360/cluster_model.view"


explore: cluster_predict {
  extends: [cluster_predict_config]
}


explore: cluster_predict_core {
  view_name: cluster_predict
  extension: required
  label: "(6) Cluster Predict"
  join: clustering_dataset {
    relationship: one_to_one
    sql_on: ${cluster_predict.row_num} = ${clustering_dataset.row_num} ;;
  }
}
