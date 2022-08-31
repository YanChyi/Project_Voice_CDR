select
  parse_datetime('%Y%m%d%H%M%S', nullif(_13,'')) as timestamp,
  date(parse_datetime('%Y%m%d%H%M%S', nullif(_13,''))) as date,
  cast(nullif(_19, '') as integer) as cust_id,
  cast(nullif(_20, '') as integer) as acc_id,
  cast(nullif(_24, '') as integer) as usage_type,
  cast(nullif(_33, '') as integer) as duration,
  cast(nullif(_49, '') as integer) as free_seconds,
  cast(nullif(_122, '') as integer) as bundle_owner_id,
  cast(nullif(_123, '') as integer) as bundle_id,
  cast(nullif(_124, '') as integer) as bundle_type_id,
  cast(nullif(_125, '') as integer) as bundle_balance,
  cast(nullif(_126, '') as integer) as bundle_used,
  cast(nullif(_351, '') as integer) as calling_msisdn,
  cast(nullif(_352, '') as integer) as called_msisdn,
  cast(nullif(_355, '') as integer) as dialled_number,
  cast(nullif(_357, '') as integer) as charged_party,
  cast(nullif(_359, '') as integer) as roaming_net_mo,
  cast(nullif(_360, '') as integer) as cell_id_mo,
  cast(nullif(_361, '') as integer) as roaming_net_mt,
  cast(nullif(_362, '') as integer) as cell_id_mt,
  cast(nullif(_368, '') as integer) as termination_reason,
  cast(nullif(_375, '') as integer) as brand_id,
  cast(nullif(_382, '') as integer) as roam_state,
  cast(nullif(_386, '') as integer) as roaming_country,
  cast(nullif(_389, '') as integer) as idd_country_code,
  
  case 
    when _389 not in ('673','') and  _389 is not null then left(_355, 3)
    else null
  end as idd_prefix,
  
  cast(
    (case
      when _53 = '2000' then _55
      when _60 = '2000' then _62
      when _67 = '2000' then _69
      else null
    end) as integer) as credit_deduction,

  cast(
    (case
      when _53 = '201' then _55
      when _60 = '201' then _62
      when _67 = '201' then _69
      else null
    end) as integer) as prm1_deduction,

  cast(
    (case
      when _53 = '211' then _55
      when _60 = '211' then _62
      when _67 = '211' then _69
      else null
    end) as integer) as prm2_deduction,

  cast(
    (case
      when _53 = '212' then _55
      when _60 = '212' then _62
      when _67 = '212' then _69
      else null
    end) as integer) as prm3_deduction,

  cast(
    (case
      when _53 = '2000' then _54
      when _60 = '2000' then _61
      when _67 = '2000' then _68
      else null
    end) as integer) as credit_balance

from airbyte.voice_cdr