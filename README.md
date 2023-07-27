# Lego SQL Challenge
A SQL Portfolio challenge, create a schema, build tables, create an ER (Entity-Relationship) diagram using DBeaver

## Task Overview
- [Part 1: Schema Setup :inbox_tray:](https://github.com/wjsutton/lego_analysis_challenge/edit/main/README.md#part-1-schema-setup-inbox_tray)
- [Part 2: Analysis of Lego Sets :crystal_ball:](https://github.com/wjsutton/lego_analysis_challenge/edit/main/README.md#part-2-analysis-of-lego-sets-crystal_ball)
- [Part 3: Visualise the data :chart_with_upwards_trend:](https://github.com/wjsutton/lego_analysis_challenge/edit/main/README.md#part-3-visualise-the-data-chart_with_upwards_trend)
- [Part 4: Record the project on GitHub :white_check_mark:](https://github.com/wjsutton/lego_analysis_challenge/edit/main/README.md#part-4-record-the-project-on-github-white_check_mark)


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

Use the diagram below for guidance, not all tables will have a primary key. 

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

You may be prompted to login multiple times in the browser.

Navigate to your schema:  right click > View Schema

### Deliverable

At the end of this section, you should have:
- a schema in the TIL_PORTFOLIO_PROJECTS database filled with tables populated with LEGO data.
- a SQL script creating your schema, tables, inserting data and creating primary and foreign keys
- a DBeaver ER diagram showing the relationships between your tables

### My solution

Here is my solution if you get stuck
- SQL Script
- ER Diagram


## Part 2: Analysis of Lego Sets :crystal_ball:

Now that you have a fully populated and linked database, the next step is to produce some analysis. LEGO production involves creating many different parts, and as you can imagine, producing new, unique parts can be costly versus reusing existing parts. In this challenge, we want to investigate which LEGO sets include the most unique parts, and how this trend is changing over time.

### Key Steps

#### 1. Unique Parts Identification: 
Identify parts that appear in only one LEGO set. Note the quantity of the part does not matter.

Hint: You'll need to use an aggregate function to count the number of distinct sets each part appears in. A part is unique if it appears in exactly one set.

#### 2. Set Analysis: 
For each LEGO set, calculate the number of unique parts it includes and the total number of parts (we're looking for a count of the parts, not quantity). Calculate the ratio of unique parts to total parts as a measure of 'uniqueness' for each set. Enrich your query with the set year and theme name.

Hint: You can join the unique parts list to the inventory parts table on the part number. Use a LEFT JOIN so that you include all parts, not just the unique ones.

#### 3. Create a View: 
Lastly, you'll want to create a view of your final query, which includes the set name, year of release, theme, number of unique parts, total number of parts, and 'uniqueness' ratio.

Hint: Use the CREATE VIEW statement to make your final query results easily accessible for future analysis.

```
CREATE VIEW my_well_named_view AS
<Your SQL Query>
```

#### 4. Download your data and save it locally as a csv.

Run a query to extract the data from your view and save it to a csv file, we'll be adding this to our GitHub repo later.
```
SELECT *
FROM my_well_named_view;
```



## Part 3: Visualise the data :chart_with_upwards_trend:

Now that you have a View created, your next task is to build a Tableau dashboard to explore the unique parts in various LEGO sets.

Go to the TIL Tableau Server, connect to Snowflake and the view you've created. The connection details will be the same as in part 1 when connecting to DBeaver.

Product three charts exploring unique Lego parts:
- change over time
- compared to the total parts in a set
- by set theme

Add titles and interactions to the visualisation. 

Save the results as a Tableau dashboard. 
Record a screenshot of the visualisation.

You can add this to your Tableau Public portfolio by replacing the datasource with the csvfrom part 2, opening the .twbx file in Tableau Public and saving the workbook.

## Part 4: Record the project on GitHub :white_check_mark:

If you haven't already please sign up to GitHub first at [https://github.com/join](https://github.com/join) and watch this intro video [Git, GitHub, & GitHub Desktop for beginners](https://www.youtube.com/watch?v=8Dd7KRpKeaE)

Create a repository: 
- Create a New repository for this analysis (something like "LEGO-SQL-Analysis")
- Select the visibility as 'Public'
- Initialize the repository with a README

Add files to your repository

Please ensure any files, notes, in fact, anything you put on GitHub does not have any passwords or login information. If you do this view the login as compromised, please delete the repo and create a new password/login.

On Github.com on your repository click on 'Add file' > 'Upload files' and upload your:
- SQL scripts,
- Schema Diagram,
- solution csv

Edit your README.md

GitHub provides a readme file which is rendered when a user views your repository, it's a great way to document your project and looks great for a portfolio project, like this one. 

Please copy and paste the [template_readme.md](https://github.com/wjsutton/lego_analysis_challenge/blob/main/template_readme.md) and update the links and details about your project.

Note the readme file must be called "README.md" to appear on rendered on the repository home page.
