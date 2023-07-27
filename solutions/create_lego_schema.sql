CREATE SCHEMA TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA;

CREATE TABLE TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.COLORS (
	ID integer,
	NAME VARCHAR(28),
	RGB VARCHAR(6),
	IS_TRANS VARCHAR(1)
);

CREATE TABLE TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.INVENTORIES (
	ID integer,
	VERSION integer,
	SET_NUM VARCHAR(16)
);

CREATE TABLE TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.INVENTORY_PARTS (
	INVENTORY_ID integer,
	PART_NUM VARCHAR(15),
	COLOR_ID integer,
	QUANTITY integer,
	IS_SPARE VARCHAR(1)
);

CREATE TABLE TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.INVENTORY_SETS (
	INVENTORY_ID integer,
	SET_NUM VARCHAR(16),
	QUANTITY integer
);

CREATE TABLE TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.PARTS (
	PART_NUM VARCHAR(15),
	NAME VARCHAR(223),
	PART_CAT_ID integer
);


CREATE TABLE TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.PART_CATEGORIES (
	ID integer,
	NAME VARCHAR(44)
);

CREATE TABLE TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.SETS (
	SET_NUM VARCHAR(16),
	NAME VARCHAR(95),
	YEAR integer,
	THEME_ID integer,
	NUM_PARTS integer
);

CREATE TABLE TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.THEMES (
	ID integer,
	NAME VARCHAR(32),
	PARENT_ID integer
);


INSERT INTO TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.COLORS (
SELECT *
FROM TIL_PORTFOLIO_PROJECTS.STAGING.LEGO_COLORS
);

INSERT INTO TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.INVENTORIES (
SELECT *
FROM TIL_PORTFOLIO_PROJECTS.STAGING.LEGO_INVENTORIES
);

INSERT INTO TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.INVENTORY_PARTS (
SELECT *
FROM TIL_PORTFOLIO_PROJECTS.STAGING.LEGO_INVENTORY_PARTS
);

INSERT INTO TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.INVENTORY_SETS (
SELECT *
FROM TIL_PORTFOLIO_PROJECTS.STAGING.LEGO_INVENTORY_SETS
);

INSERT INTO TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.PARTS (
SELECT *
FROM TIL_PORTFOLIO_PROJECTS.STAGING.LEGO_PARTS
);

INSERT INTO TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.PART_CATEGORIES (
SELECT *
FROM TIL_PORTFOLIO_PROJECTS.STAGING.LEGO_PART_CATEGORIES
);

INSERT INTO TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.SETS (
SELECT *
FROM TIL_PORTFOLIO_PROJECTS.STAGING.LEGO_SETS
);

INSERT INTO TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA.THEMES (
SELECT *
FROM TIL_PORTFOLIO_PROJECTS.STAGING.LEGO_THEMES
);

-- Sets Database Schema path
USE TIL_PORTFOLIO_PROJECTS.WILLS_SCHEMA;

-- Add primary keys
ALTER TABLE COLORS ADD PRIMARY KEY (ID);
ALTER TABLE INVENTORIES ADD PRIMARY KEY (ID);
ALTER TABLE PARTS ADD PRIMARY KEY (PART_NUM);
ALTER TABLE PART_CATEGORIES ADD PRIMARY KEY (ID);
ALTER TABLE SETS ADD PRIMARY KEY (SET_NUM);
ALTER TABLE THEMES ADD PRIMARY KEY (ID);

-- Add foreign keys
ALTER TABLE INVENTORY_PARTS ADD FOREIGN KEY (INVENTORY_ID) REFERENCES INVENTORIES(ID);
ALTER TABLE INVENTORY_PARTS ADD FOREIGN KEY (PART_NUM) REFERENCES PARTS(PART_NUM);
ALTER TABLE INVENTORY_PARTS ADD FOREIGN KEY (COLOR_ID) REFERENCES COLORS(ID);

ALTER TABLE PARTS ADD FOREIGN KEY (PART_CAT_ID) REFERENCES PART_CATEGORIES(ID);

ALTER TABLE INVENTORY_SETS ADD FOREIGN KEY (INVENTORY_ID) REFERENCES INVENTORIES(ID);
ALTER TABLE INVENTORY_SETS ADD FOREIGN KEY (SET_NUM) REFERENCES SETS(SET_NUM);

ALTER TABLE SETS ADD FOREIGN KEY (THEME_ID) REFERENCES THEMES(ID);

ALTER TABLE INVENTORIES ADD FOREIGN KEY (SET_NUM) REFERENCES SETS(SET_NUM);