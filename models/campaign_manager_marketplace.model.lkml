connection: "@{CONNECTION}"

include: "/views/**/*"
include: "/explores/**/*"
include: "/dashboards/**/*.dashboard"
include: "//@{CONFIG_PROJECT_NAME}/**/*.dashboards"
include: "//@{CONFIG_PROJECT_NAME}/datagroups.lkml"

map_layer: dma {
  file: "/map_layers/dma.topojson"
  property_key: "dma"
}

persist_for: "24 hours"


label: "z_FOR CM BLOCK DEV"
