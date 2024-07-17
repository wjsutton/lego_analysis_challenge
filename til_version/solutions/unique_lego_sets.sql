CREATE VIEW unique_sets AS
WITH UNIQUE_PARTS AS (
SELECT 
p.part_num,
p.name as part_name,
COUNT(DISTINCT i.set_num) as appears_in_n_sets
FROM parts as p
INNER JOIN part_categories as pc on p.part_cat_id = pc.id
INNER JOIN inventory_parts as ip on p.part_num = ip.part_num
INNER JOIN inventories as i on ip.inventory_id = i.id
GROUP BY p.part_num,
p.name
HAVING COUNT(DISTINCT i.set_num) = 1
)

SELECT 
s.name as set_name,
s.year,
t.name as theme,
COUNT(up.part_num) as unique_parts,
COUNT(p.name) as parts,
COUNT(up.part_num)/COUNT(p.name) as uniqueness 
FROM parts as p
INNER JOIN part_categories as pc on p.part_cat_id = pc.id
INNER JOIN inventory_parts as ip on p.part_num = ip.part_num
INNER JOIN inventories as i on ip.inventory_id = i.id
INNER JOIN sets as s on i.set_num = s.set_num
LEFT JOIN themes as t on t.id = s.theme_id
LEFT JOIN UNIQUE_PARTS as up on up.part_num = p.part_num
GROUP BY s.name,
s.year,
t.name