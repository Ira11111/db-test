set search_path to shop;
select c.client_name name, coalesce(sum(pp.product_amount), 0) product_sum from client c
left join purchase p on c.id_client =p.id_client 
left join purchase_product pp on p.id_purchase = pp.id_purchase
group by c.id_client, c.client_name;
