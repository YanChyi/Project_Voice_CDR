select
  parse_datetime('%Y%m%d%H%M%S', nullif(_13,'')) as timestamp,
  date(parse_datetime('%Y%m%d%H%M%S', nullif(_13,''))) as date,
  nullif(_19, '') as cust_id,
  nullif(_20, '') as acc_id,
  nullif(_24, '') as usage_type,
  cast(nullif(_33, '') as integer) as duration,
  cast(nullif(_49, '') as integer) as free_seconds,
  nullif(_122, '') as bundle_owner_id,
  nullif(_123, '') as bundle_id,
  nullif(_124, '') as bundle_type_id,
  cast(nullif(_125, '') as integer) as bundle_balance,
  cast(nullif(_126, '') as integer) as bundle_used, 
  nullif(_351, '') as calling_msisdn,
  nullif(_352, '') as called_msisdn,
  nullif(_355, '') as dialled_number,
  nullif(_357, '') as charged_party,
  nullif(_359, '') as roaming_net_mo,
  nullif(_360, '') as cell_id_mo,
  nullif(_361, '') as roaming_net_mt,
  nullif(_362, '') as cell_id_mt,
  nullif(_368, '') as termination_reason,
  nullif(_375, '') as brand_id,
  nullif(_382, '') as roam_state,
  nullif(_386, '') as roaming_country,
  nullif(_389, '') as idd_country_code,
  
  case 
    when left(_355, 3) like ('00_') then 'normal rate'
    when left(_355, 3) in ('089', '098') then 'voip rate'
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