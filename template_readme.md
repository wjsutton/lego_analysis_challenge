# Project Title 
A brief description of the project
<br>

### :a: About

Longer description of the project
- what you investigated
- what you learned from the data

Image of your dashboard:
<div style="overflow: hidden;margin: 0 10px 0 0">
<a href="https://public.tableau.com/app/profile/wjsutton/viz/TheToughestTour/TourdeFrance">
<img src='https://github.com/wjsutton/Tour-De-France/blob/master/Tour%20de%20France.png?raw=true' width="100%">
</a>
</div>


### :oil_drum: Data Sources
- [LEGO Database](https://www.kaggle.com/datasets/rtatman/lego-database)
- [Schema Diagram](link to diagram)
- [Schema creation script](link to script)

*Show image of your Schema diagram*



#### Import Script

*highlight a few sections of your script in a code block "```" with some explaination, e.g.*

This script creates tables from the STAGING schema import them into WILLS_SCHEMA with accurate datatypes based on the the data within the STAGING schema.
```
CREATE TABLE TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.COLORS (
	ID integer,
	NAME VARCHAR(28),
	RGB VARCHAR(6),
	IS_TRANS VARCHAR(1)
);

INSERT INTO TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.COLORS (
SELECT *
FROM TIL_PORTFOLIO_PROJECTS.STAGING.LEGO_COLORS
);
```

Primary and foriegn keys have been added where approriate
```
-- Primary key:
ALTER TABLE COLORS ADD PRIMARY KEY (ID);

-- Foreign key:
ALTER TABLE SETS ADD FOREIGN KEY (THEME_ID) REFERENCES THEMES(ID);
```


### :white_circle: Data Reshape

The data is read and reshaped using an [SQL script](link to reshape script), 

this script does:
- X
- Y
- Z

```
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
...

```

The output of this process is the dataset: [CSV file](link to a csv output of your data)

### :chart_with_upwards_trend: Charting in Tableau

*Brief description of the ask, e.g.*

'exploring unique lego parts', to explore this topic I've created this dashboard to provide the user X, Y Z


This is a dashboard of three sheets:
- Sheet 1: brief description of chart, e.g. line chart showing...
- Sheet 2: brief description of chart, e.g. line chart showing...
- Sheet 3: brief description of chart, e.g. line chart showing...

Note any interactions added.


### :arrow_forward: Next steps

Add any potential analysis ideas that might improve this work, e.g. 
- incorporate sales data to answer the question "do sets with more unique parts sell better?"

---

Image of your dashboard again:
<div style="overflow: hidden;margin: 0 10px 0 0">
<a href="https://public.tableau.com/app/profile/wjsutton/viz/TheToughestTour/TourdeFrance">
<img src='https://github.com/wjsutton/Tour-De-France/blob/master/Tour%20de%20France.png?raw=true' width="100%">
</a>
</div>

Your Name, Date <br>
Links to socials 
