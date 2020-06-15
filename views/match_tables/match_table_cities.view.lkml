view: match_table_cities {
  sql_table_name: (SELECT * FROM TABLE_QUERY(
    --[ekoblov-test:dcm1684],
    [db-platform-sol:Comcast8667],
    'table_id= (Select MAX(table_id)
                          FROM [db-platform-sol:Comcast8667.__TABLES__]
                          where table_id contains "match_table_cities_8667_")'
    )
    )
     ;;

    dimension: city {
      type: string
      sql: ${TABLE}.City ;;
    }

    dimension: city_id {
      type: string
      sql: ${TABLE}.City_ID ;;
    }

    measure: count {
      type: count
      approximate_threshold: 100000
      drill_fields: []
    }
  }
