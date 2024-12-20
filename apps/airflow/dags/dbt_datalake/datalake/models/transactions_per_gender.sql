with transactions_per_gender as (
    select gender, count(*)
    from "datalake_bronze"."users" as u
    left join "datalake_bronze"."transactions" as t on u.userid = t.user_id
    group by gender
)
select * from transactions_per_gender
