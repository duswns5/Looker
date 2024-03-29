# The name of this view in Looker is "Autoschema"
view: autoschema {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_pdt.auto-schema`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  dimension: athlete {
    type: string
    sql: ${TABLE}.Athlete ;;
  }

  dimension: bronze_medals {
    type: number
    sql: ${TABLE}.Bronze_Medals ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: closing_ceremony {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Closing_Ceremony_Date ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: gold_medals {
    type: number
    sql: ${TABLE}.Gold_Medals ;;
  }

  dimension: silver_medals {
    type: number
    sql: ${TABLE}.Silver_Medals ;;
  }

  dimension: sport {
    type: string
    sql: ${TABLE}.Sport ;;
  }

  dimension: total_medals {
    type: number
    sql: ${TABLE}.Total_Medals ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.Year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
