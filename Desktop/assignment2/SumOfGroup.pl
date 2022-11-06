with cus_info as(
select distinct C.customer_id, CB.basket_id, CB.buy_id 
from customer C, customer_basket CB
where C.customer_id = CB.customer_id and 
CB.buy_id like 'buy%'
)
, cus_info2 as (select CI.customer_id, CI.basket_id, CI.buy_id
from cus_info CI, refund R
where refund_id like 'none'
and R.buy_id = CI.buy_id
)

, cus_info3 as (select  CI2.customer_id, IIB.item_id, IIB.item_amount
from cus_info2 CI2, item_in_basket IIB
where CI2.basket_id = IIB.basket_id
)

, cus_info4 as (select CI3.customer_id, I.item_id, i.item_name, CI3.item_amount, I.price, I.sorttype_name
from cus_info3 CI3, item I
where CI3.item_id = I.item_id
)

, cus_info5 as (select customer_id, sum(item_amount*price) as totalsum
from cus_info4 
group by customer_id)

/**/
, cus_meat as (select ci4.customer_id, sum(ci4.item_amount) as meat_count, sum(item_amount * price) as totalsum
from sorttype st, cus_info4 ci4
where st.sorttype_name = ci4.sorttype_name
and st.sorttype_name = 'meat'
group by ci4.customer_id
)

, cus_cereal as (select ci4.customer_id, sum(ci4.item_amount) as cereal_count, sum(item_amount * price) as totalsum
from sorttype st, cus_info4 ci4
where st.sorttype_name = ci4.sorttype_name
and st.sorttype_name = 'cereal'
group by ci4.customer_id
)

, cus_vegetable as (select ci4.customer_id, sum(ci4.item_amount) as vegetable_count, sum(item_amount * price) as totalsum
from sorttype st, cus_info4 ci4
where st.sorttype_name = ci4.sorttype_name
and st.sorttype_name = 'vegetable'
group by ci4.customer_id
)

, cus_fruit as (select ci4.customer_id, sum(ci4.item_amount) as fruit_count, sum(item_amount * price) as totalsum
from sorttype st, cus_info4 ci4
where st.sorttype_name = ci4.sorttype_name
and st.sorttype_name = 'fruit'
group by ci4.customer_id
)

/*fianl sum*/
, final_sum1 as (select cv.customer_id, cf.fruit_count, cv.vegetable_count, cf.totalsum+cv.totalsum as finalsum
from cus_fruit cf, cus_vegetable cv
where cf.customer_id = cv.customer_id
)

, final_sum2 as (select cm.customer_id, cc.cereal_count, cm.meat_count, cm.totalsum+cc.totalsum as finalsum
from cus_meat cm, cus_cereal cc
where cm.customer_id = cc.customer_id
)

select fs2.customer_id, fs1.vegetable_count as vegetable, fs1.fruit_count as fruit, 
fs2.cereal_count as cereal, fs2.meat_count as meat,
fs1.finalsum+fs2.finalsum as sumOFtotal
from final_sum2 fs2 right join final_sum1 fs1
on fs2.customer_id = fs1.customer_id
