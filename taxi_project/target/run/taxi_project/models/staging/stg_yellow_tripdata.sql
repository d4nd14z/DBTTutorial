
  
  create view "dev"."main"."stg_yellow_tripdata__dbt_tmp" as (
    SELECT * FROM read_parquet("data/yellow_tripdata_*.parquet", filename=true)
  );
