connection: "@{CONNECTION}"

# LOCAL DEPENDENCIES #
include: "/views/**/*"
include: "/explores/*"
include: "/dashboards/*.dashboard"
include: "/dv360/@{DV360}/explores/*"
include: "/dv360/@{DV360}/views/*"


# CONFIG DEPENDENCIES #
include: "//@{CONFIG_PROJECT_NAME}/explores/*"
include: "//@{CONFIG_PROJECT_NAME}/views/**/*"
include: "//@{CONFIG_PROJECT_NAME}/**/*.dashboards"
# include: "//@{CONFIG_PROJECT_NAME}/@{DV360}/explores/*"
# include: "//@{CONFIG_PROJECT_NAME}/@{DV360}/views/*"


persist_for: "24 hours"
label: "z_FOR CM BLOCK DEV"
