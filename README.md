# Lego SQL Challenge
A SQL Portfolio challenge, create a schema, analyse data, create a visualisation. 

<img src='https://images.unsplash.com/photo-1587654780291-39c9404d746b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80' width="70%">

## Task Overview
- [Part 0: Setup a PostgreSQL Database 💾](https://github.com/wjsutton/lego_analysis_challenge/edit/main/README.md#part-0-setup-a-postgresql-database-)
- [Part 1: Schema Setup :inbox_tray:](https://github.com/wjsutton/lego_analysis_challenge/tree/main#part-1-schema-setup-inbox_tray)
- [Part 2: Analysis of Lego Sets :crystal_ball:](https://github.com/wjsutton/lego_analysis_challenge/tree/main#part-2-analysis-of-lego-sets-crystal_ball)
- [Part 3: Visualise the data :chart_with_upwards_trend:](https://github.com/wjsutton/lego_analysis_challenge/tree/main#part-3-visualise-the-data-chart_with_upwards_trend)
- [Part 4: Record the project on GitHub :white_check_mark:](https://github.com/wjsutton/lego_analysis_challenge/tree/main#part-4-record-the-project-on-github-white_check_mark)

## Part 0: Setup a PostgreSQL Database 💾

## Part 1: Schema Setup :inbox_tray:

We're going to use the local PostgreSQL database to build and populate a series of tables that make up a LEGO database. You will need to create tables, insert data, set primary and foreign keys, and then create an ER (Entity-Relationship) diagram.

### Key Steps

#### 1. Create Your Schema:
We'll be working in a database called `lego` and a schema called `staging` contains all our initial data. You should create a new schema within the `lego` database. This will be the container for all your tables.

Hint: Use the `CREATE SCHEMA` command to create a schema.
```
CREATE SCHEMA schema_name;
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

Hint: Use the CREATE TABLE command. Look at the data in the `staging` schema for guidance on the data types and column names you'll need.
```
CREATE TABLE schema.table (
	column_1 integer,
	column_2 VARCHAR(44)
);

-- Check column character length, for varchar() length
SELECT MAX(LENGTH(part_num))
FROM staging.lego_parts;
```



#### 3. Insert Data:
Once the tables have been created, you'll need to populate them with data from the corresponding tables in the STAGING schema.

Hint: Use the INSERT INTO command combined with a SELECT * FROM query to pull in the data from the STAGING tables.

```
INSERT INTO schema.destination_table (
SELECT *
FROM  schema.source_table
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
Once your tables are built, populated, and linked right click on your schema to create an ER diagram to visualize the relationships between your tables.

Alternatively you can create a ER diagram using DBeaver and the following steps
- Download [DBeaver](https://dbeaver.io/)
- Create connection > SQL > PostgresSQL
- Host: localhost
- Database: lego
- Schema: the schema you created earlier
- Enter username and password

Navigate to your schema:  right click > View Schema

### Deliverable

At the end of this section, you should have:
- a schema in the LEGO database filled with tables populated with LEGO data.
- a SQL script creating your schema, tables, inserting data and creating primary and foreign keys
- an ER diagram showing the relationships between your tables

### My Solution

Here is my solution if you get stuck
- [SQL Script](solutions/1_create_analysis_schema.sql)
- [ER Diagram](solutions/lego_er_diagram.png)


## Part 2: Analysis of Lego Sets :crystal_ball:

Now that you have a fully populated and linked database, the next step is to produce some analysis.

At this point you are free to analyse the data as you wish. I reccomend taking a perspective on the data, this maybe:

- A group of sets you are interested in, e.g. How do sets like The Lord of the Rings or Star Wars compare to other brands?
- How the sets have changed over time, e.g. How has the color range changed?
- An area that will impact the business, e.g. How often are parts reused (or not reused) across different sets?

For this section I will explore "unique parts" i.e. parts that don't appear in other sets.

**Outline:** 
LEGO production involves creating many different parts, and as you can imagine, producing new, unique parts can be costly versus reusing existing parts. In this challenge, we want to investigate which LEGO sets include the most unique parts, and how this trend is changing over time.

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

### My Solution

Here is my solution if you get stuck
- [SQL Script](solutions/2_analysis_unique_parts.sql)


## Part 3: Visualise the data :chart_with_upwards_trend:

Now that you have a View created, your next task is to build a Tableau dashboard to explore the unique parts in various LEGO sets.

Options:
- Go to Tableau Desktop (paid), connect to PostgreSQL and the view you've created. The connection details will be the same as in part 1 when connecting to DBeaver.
- Or in pgAdmin4 download a csv of your view results, go to Tableau Public (free) and connect to the csv file. 

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
