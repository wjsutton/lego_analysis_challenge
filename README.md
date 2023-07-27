# Lego SQL Challenge
A SQL Portfolio challenge, create a schema, build tables, create an ER (Entity-Relationship) diagram using DBeaver





## Part 1: Schema Setup :inbox_tray:

We're going to use the Snowflake database to build and populate a series of tables that make up a LEGO database. You will need to create tables, insert data, set primary and foreign keys, and then create an ER (Entity-Relationship) diagram using DBeaver.

### Key Steps

#### 1. Create Your Schema:
We'll be working in a database called TIL_PORTFOLIO_PROJECTS and a schema called STAGING contains all our initial data. You should create your own schema within TIL_PORTFOLIO_PROJECTS. This will be the container for all your tables.

Hint: Use the CREATE SCHEMA command to create a schema.
```
CREATE SCHEMA database.schema_name;
```


#### 2. Create Tables:
Based on the existing data, create the following tables in your schema:

- COLORS
- INVENTORIES
- INVENTORY_PARTS
- INVENTORY_SETS
- PARTS
- PART_CATEGORIES
- SETS
- THEMES

Ensure you define the correct data types for each column in these tables.

Hint: Use the CREATE TABLE command. Look at the data in the STAGING schema for guidance on the data types and column names you'll need.
```
CREATE TABLE database.schema.table (
	column_1 integer,
	column_2 VARCHAR(44)
);

-- Check column character length, for varchar() length
SELECT MAX(LENGTH(part_num))
FROM TIL_PORTFOLIO_PROJECTS.STAGING.LEGO_PARTS;
```



#### 3. Insert Data:
Once the tables have been created, you'll need to populate them with data from the corresponding tables in the STAGING schema.

Hint: Use the INSERT INTO command combined with a SELECT * FROM query to pull in the data from the STAGING tables.

```
INSERT INTO database.schema.destination_table (
SELECT *
FROM  database.schema.source_table
);
```

#### 4. Set Primary and Foreign Keys:
After populating your tables, you'll need to define primary and foreign keys for each of them.

Use the diagram below for guidence, not all tables will have a primary key. 

![](downloads_schema.png)

```
--Set a primary key:
ALTER TABLE table_name ADD PRIMARY KEY (column_name);

--Set a foreign key:
ALTER TABLE table_name ADD FOREIGN KEY (column_name) REFERENCES another_table(another_tables_primary_key_column);
```

#### 5. Create ER Diagram:
Once your tables are built, populated, and linked, download and use [DBeaver](https://dbeaver.io/) to create an ER diagram to visualize the relationships between your tables.

**Key Steps**
- Download [DBeaver](https://dbeaver.io/)
- Create connection > SQL > Snowflake
- Host, the first part of your snowflake login url, ending ".snowflakecomputing.com" without "https://"
- Database: TIL_PORTFOLIO_PROJECTS
- Warehouse: DATASCHOOL_WH or CORE_WH
- Schema: the schema you created earlier
- Authentication: SSO (Browser)
- Username: your TIL email
- Role: DATASCHOOL or CORE 

You may be prompted multiple times in the browser.

Navigate to your schema:  right click > View Schema

### Deliverable

At the end of this section, you should have:
- a schema in the TIL_PORTFOLIO_PROJECTS database filled with tables populated with LEGO data.
- a SQL script creating your schema, tables, inserting data and creating primary and foriegn keys
- a DBeaver ER diagram showing the relationships between your tables.

### My solution

Here is my solution if you get stuck
- SQL Script
- ER Diagram


## Part 2: Analysis of Lego Sets :crystal_ball:

Now that you have a fully populated and linked database, the next step is to produce some analysis. LEGO production involves creating many different parts, and as you can imagine, producing new, unique parts can be costly versus reusing existing parts. In this challenge, we want to investigate which LEGO sets include the most unique parts, and how this trend is changing over time.

### Key Steps

#### 1. Unique Parts Identification: 
Identify parts that appear in only one LEGO set. Create a list of these unique parts along with the sets they appear in.

Hint: You'll need to use an aggregate function to count the number of distinct sets each part appears in. A part is unique if it appears in exactly one set.

#### 2. Set Analysis: 
For each LEGO set, calculate the number of unique parts it includes and the total number of parts. Calculate the ratio of unique parts to total parts as a measure of 'uniqueness' for each set. Enrich your query with the set year and theme name.

Hint: You can join the unique parts list to the inventory parts table on the part number. Use a LEFT JOIN so that you include all parts, not just the unique ones.

#### 3. Create a View: 
Lastly, you'll want to create a view of your final query, which includes the set name, year of release, theme, number of unique parts, total number of parts, and 'uniqueness' ratio.

Hint: Use the CREATE VIEW statement to make your final query results easily accessible for future analysis.

```
CREATE VIEW unique_sets AS
<Your SQL Query>
```



## Part 3: Visualise the data :chart_with_upwards_trend:

Now that you have a View created, your next task is to build a Tableau dashboard to explore the unique parts in various LEGO sets.

Go to the TIL Tableau Server, connect to Snowflake and the view you've created. The connection details will be the same as in part 1 when connecting to DBeaver.

Product three charts exploring unique lego parts:
- change over time
- compared to total parts in a set
- by set theme

Add titles and interactions to the visualisation. 

Save the results as a Tableau dashboard. 
Record a screenshot of the visualisation.

You can add this to your Tableau Public portfolio by replacing the datasource with a csv, opening the .twbx file in Tableau Public and saving the workbook.



