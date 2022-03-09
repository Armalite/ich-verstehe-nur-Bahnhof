# DBTVault Effectivity Satellites

## Initial load vs Incremental load

You can use the is_incremental() function to determine what kind of load behavior you wish to do on your effectivity sat (and other dbt constructs).
During the initial load you may wish to just insert a distinct from the stage table and only perform incremental logic upon subsequent runs.

```sql
{{
  config(
    materialized='incremental',
    schema='raw_vault'
  )
}}

{%- set source_model = "v_stg_myxero_userorganisationrole_v1_l2" -%}
{%- set src_pk = "USERORGROLE_LHK" -%}
{%- set src_dfk = "USER_HK"       -%}
{%- set src_sfk = ["ORGANISATION_HK", "ROLE_HK"]       -%}
{%- set src_start_date = "START_DATE" -%}
{%- set src_end_date = "END_DATE"     -%}
{%- set src_eff = "EFFECTIVE_FROM_DATE" -%}
{%- set src_ldts = "LDTS"    -%}
{%- set src_source = "RSRC"  -%}


  {% if is_incremental() %}

    {{
      dbtvault.eff_sat(src_pk=src_pk, src_dfk=src_dfk, src_sfk=src_sfk,
                        src_start_date=src_start_date,
                        src_end_date=src_end_date,
                        src_ldts=src_ldts,
                        src_eff=src_eff,
                        src_source=src_source,
                        source_model=source_model)

    }}

  {% else %}

    SELECT DISTINCT stg.USERORGROLE_LHK
                  , stg.USER_HK
                  , stg.ORGANISATION_HK
                  , stg.ROLE_HK
                  , stg.START_DATE
                  , stg.END_DATE
                  , stg.EFFECTIVE_FROM_DATE
                  , stg.LDTS
                  , stg.RSRC
    FROM  {{ref('v_stg_myxero_userorganisationrole_v1_l2')}} AS stg

  {% endif %}

```
