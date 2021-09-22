connection: "@{CONNECTION_NAME}"

include: "/explores/**/*"
include: "/dashboards/**/*.dashboard"

map_layer: dma {
  file: "/map_layers/dma.topojson"
  property_key: "dma"
}

persist_for: "24 hours"

label: "Block Campaign Manager 360"



datagroup: new_day {
  sql_trigger:
    SELECT max(date(_PARTITIONTIME)) from ${impression.SQL_TABLE_NAME}
    where _PARTITIONTIME >= TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY)) ;;
}

datagroup: bqml_datagroup {
  sql_trigger: select CURRENT_DATE() ;;
  max_cache_age: "24 hours"
}
