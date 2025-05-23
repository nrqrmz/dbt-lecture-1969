SELECT
  company
  ,sector
  ,date_lead
  ,date_opportunity
  ,date_customer
  ,date_lost
  ,CASE
    WHEN date_lost IS NOT NULL THEN "4 - Lost"
    WHEN date_customer IS NOT NULL THEN "3 - Customer"
    WHEN date_opportunity IS NOT NULL THEN "2 - Opportunity"
    WHEN date_lead IS NOT NULL THEN "1 - Lead"
    ELSE NULL
  END AS deal_stage
  ,CASE
    WHEN date_lost IS NOT NULL THEN 0
    WHEN date_customer IS NOT NULL THEN 1
    ELSE NULL
  END AS lead2customer
  ,CASE
    WHEN date_lost IS NOT NULL THEN 0
    WHEN date_opportunity IS NOT NULL THEN 1
    ELSE NULL
  END AS lead2opportunity
  ,CASE
    WHEN date_lost IS NOT NULL AND date_opportunity IS NOT NULL THEN 0
    WHEN date_customer IS NOT NULL THEN 1
    ELSE NULL
  END AS opportunity2customer
  , {{ day_diff('date_customer','date_lead') }} as lead2customer_time
  , {{ day_diff('date_opportunity', 'date_lead') }} as lead2opportunity_time
  , {{ day_diff('date_customer', 'date_opportunity') }} as opportunity2customer_time
FROM {{ref("stg_raw__funnel")}}