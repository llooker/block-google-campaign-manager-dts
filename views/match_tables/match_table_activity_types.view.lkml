view: match_table_activity_types {
  sql_table_name: (SELECT * FROM TABLE_QUERY(
    --[ekoblov-test:dcm1684],
    [db-platform-sol:Comcast8667],
    'table_id= (Select MAX(table_id)
                          FROM [db-platform-sol:Comcast8667.__TABLES__]
                          where table_id contains "match_table_activity_types_8667_")'
    )
    )
     ;;

    dimension: activity_group {
      type: string
      sql: ${TABLE}.Activity_Group ;;
    }

    dimension: activity_group_id {
      type: string
      sql: ${TABLE}.Activity_Group_ID ;;
    }

    dimension: activity_type {
      type: string
      sql: ${TABLE}.Activity_Type ;;
    }

    dimension: floodlight_configuration {
      type: string
      sql: ${TABLE}.Floodlight_Configuration ;;
    }

    measure: count {
      type: count
      approximate_threshold: 100000
      drill_fields: []
    }
  }
