view: sql_runner_query {
  derived_table: {
    sql: SELECT
          autoschema.Total_Medals  AS autoschema_total_medals,
          autoschema.Country  AS autoschema_country,
          autoschema.Gold_Medals  AS autoschema_gold_medals,
          autoschema.Silver_Medals  AS autoschema_silver_medals,
          autoschema.Bronze_Medals  AS autoschema_bronze_medals
      FROM `looker_pdt.auto-schema`
           AS autoschema
      WHERE autoschema.Gold_Medals > 0 AND autoschema.Silver_Medals > 0 AND autoschema.Bronze_Medals > 0

      GROUP BY
      1,
      2,
      3,
      4,
      5
      ORDER BY
      3 DESC
      LIMIT 500
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: autoschema_total_medals {
    type: number
    sql: ${TABLE}.autoschema_total_medals ;;
  }

  dimension: autoschema_country {
    type: string
    sql: ${TABLE}.autoschema_country ;;
  }

  dimension: autoschema_gold_medals {
    type: number
    sql: ${TABLE}.autoschema_gold_medals ;;
  }

  dimension: autoschema_silver_medals {
    type: number
    sql: ${TABLE}.autoschema_silver_medals ;;
  }

  dimension: autoschema_bronze_medals {
    type: number
    sql: ${TABLE}.autoschema_bronze_medals ;;
  }

  set: detail {
    fields: [autoschema_total_medals, autoschema_country, autoschema_gold_medals, autoschema_silver_medals, autoschema_bronze_medals]
  }
}
