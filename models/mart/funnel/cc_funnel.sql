SELECT
company
, sector
, priority
, date_lead
, date_opportunity
, date_customer
, date_lost
, deal_stage
, lead2customer
, lead2opportunity
, opportunity2customer
, lead2customer_time
, lead2opportunity_time
, opportunity2customer_time
FROM {{ref("int_funnel_metrics")}}
left join {{ref("stg_raw__priority")}}
USING(company)