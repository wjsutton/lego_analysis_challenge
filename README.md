# Lego SQL Challenge
A SQL Portfolio challenge, create a schema, build tables, create an ER (Entity-Relationship) diagram using DBeaver





## Part 1: Schema Setup

We're going to use the Snowflake database to build and populate a series of tables that make up a LEGO database. You will need to create tables, insert data, set primary and foreign keys, and then create an ER (Entity-Relationship) diagram using DBeaver.

### Key Steps:

#### 1. Create Your Schema:
We'll be working in a database called TIL_PORTFOLIO_PROJECTS and a schema called STAGING contains all our initial data. You should create your own schema within TIL_PORTFOLIO_PROJECTS. This will be the container for all your tables.

Hint: Use the CREATE SCHEMA command to create a schema.

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

#### 3. Insert Data:
Once the tables have been created, you'll need to populate them with data from the corresponding tables in the STAGING schema.

Hint: Use the INSERT INTO command combined with a SELECT * FROM query to pull in the data from the STAGING tables.

#### 4. Set Primary Keys:
After populating your tables, you'll need to define primary keys for each of them.

Hint: Use the ALTER TABLE command along with ADD PRIMARY KEY.

#### 5. Set Foreign Keys:
Next, establish the relationships between your tables by adding the appropriate foreign keys.

Hint: Again, you'll be using ALTER TABLE, this time with ADD FOREIGN KEY.

#### 6. Create ER Diagram:
Once your tables are built, populated, and linked, down and use [DBeaver](https://dbeaver.io/) to create an ER diagram to visualize the relationships between your tables.

Deliverable:
At the end of this challenge, you should have a schema in the TIL_PORTFOLIO_PROJECTS database filled with tables populated with LEGO data. You should also have a DBeaver ER diagram showing the relationships between your tables.

## Part 2: Analysis of Lego Sets

Now that you have a fully populated and linked database, the next step is to produce some analysis. LEGO production involves creating many different parts, and as you can imagine, producing new, unique parts can be costly versus reusing existing parts. In this challenge, we want to investigate which LEGO sets include the most unique parts, and how this trend is changing over time.

Key Steps:

#### 1. Unique Parts Identification: 
Identify parts that appear in only one LEGO set. Create a list of these unique parts along with the sets they appear in.

Hint: You'll need to use an aggregate function to count the number of distinct sets each part appears in. A part is unique if it appears in exactly one set.

#### 2. Set Analysis: 
For each LEGO set, calculate the number of unique parts it includes and the total number of parts. Calculate the ratio of unique parts to total parts as a measure of 'uniqueness' for each set. Enrich your query with the set year and theme name.

Hint: You can join the unique parts list to the inventory parts table on the part number. Use a LEFT JOIN so that you include all parts, not just the unique ones.

#### 3. Create a View: 
Lastly, you'll want to create a view of your final query, which includes the set name, year of release, theme, number of unique parts, total number of parts, and 'uniqueness' ratio.

Hint: Use the CREATE VIEW statement to make your final query results easily accessible for future analysis.

## Part 3: Visualise the data 



