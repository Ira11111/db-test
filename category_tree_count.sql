set search_path to shop;
select parent.category_name, count(child.id_category) from category parent
left join category child on parent.id_category = child.parent_category_id 
group by parent.id_category, parent.category_name
order by parent.category_name;