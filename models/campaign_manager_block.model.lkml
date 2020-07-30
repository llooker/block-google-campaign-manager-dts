connection: "@{CONNECTION}"

# LOCAL DEPENDENCIES #
include: "/views/**/*"
include: "/explores/*"
include: "/dashboards/*.dashboard"
include: "/dv360/@{DV360}/explores/*"
include: "/dv360/@{DV360}/views/*"
include: "/dv360/@{DV360}/*.model"

# CONFIG DEPENDENCIES #
include: "//@{CONFIG_PROJECT_NAME}/explores/*"
include: "//@{CONFIG_PROJECT_NAME}/views/**/*"
# include: "//@{CONFIG_PROJECT_NAME}/@{DV360}/explores/*"
# include: "//@{CONFIG_PROJECT_NAME}/@{DV360}/views/*"
include: "//@{CONFIG_PROJECT_NAME}/**/*.dashboards"



persist_for: "24 hours"
label: "z_FOR CM BLOCK DEV"

explore: impression {
  extends: [impression_config]
}

explore: activity {
  extends: [activity_config]
}

explore: click {
  extends: [click_config]
}

explore: data_health_check {
  extends: [data_health_check_config]
}
