-- Create, populate and query E.coli database by entering command in terminal:
--    sqlite3 ecoliK12.db < ecoliK12.sql 

-- E.coli K12  SQLite database
-- Note that if null is permitted for a column value then there may be non-unique nulls
-- Note that a mySQL VARCHAR greater than 255 chars converts to type text
-- Note that a mySQL TEXT holds a string with a maximum length of 65,535 characters
--     so for a longer string use MEDIUMTEXT (up to 16,777,215) or LONGTEXT (up to 4,294,967,295)

PRAGMA foreign_keys=ON;

-- Create 6 tables for E.coli database

--The DNA encoding of the entire "+" strand
CREATE TABLE pos_strand(
   seq  MEDIUMTEXT not null);

--The DNA encoding of the entire "-" strand
CREATE TABLE neg_strand(
   seq  MEDIUMTEXT not null);


-- Note that  not every gene will have a transcription unit 
--   Ex: some genes are for hypothetical proteins determined by start and stop codons
CREATE TABLE genes(
   name      varchar(64) not null primary key ,
   pos_left  integer,
   pos_right integer,
   strand    char(1),
   length    integer,
   seq       text(8196),
   type      varchar(16),
   subtype   varchar(16),
   reference text(512)
);


-- Note that  not every promoter will have a transcription unit 
--   Ex: some promotes are predicted in regions upstream from hypothetical proteins 
CREATE TABLE promoters(
   name          varchar(64) not null primary key,
   pos_plus1     integer,
   strand        char(1),
   seq           text(256),
   sigma_factor  varchar(64),
   for_gene_type varchar(16)
);


CREATE TABLE terminators(
   terminator_id integer not null primary key AUTOINCREMENT,
   pos_left  integer,
   pos_right integer,
   length    integer,
   strand    char(1),
   seq       text(256)
);


-- Bridge table to relate one promoter and one gene that are in the same transcription unit
-- Weakness of this data: we don't know the promoters of all transcription units, some are null.  
--     Also some of the promoters in this table are not in the promoters table:
-- Note that fk_gene_name is a foreign key: it is the name of the gene in the genes table
--    so we create a foreign key constraint (only for gene name, not for promoter name)
--  A few promoter-gene pairs are not unique:  they both participate in two different TUs (ex: one 2-gene TU and one 3-gene TU)
CREATE TABLE transcript_units(
   tu_id        integer not null primary key AUTOINCREMENT,
   name 	varchar(64) not null,
   prom_name 	varchar(64),
   fk_gene_name varchar(64) not null,
   FOREIGN KEY (fk_gene_name) REFERENCES genes(name)); -- foreign key constraint


-- Populate the 6 tables above from flat files:
.import ecoliM54_1string.txt pos_strand
.import ecoliM54RevComp_1string.txt neg_strand
-- The remainder of these files are comma-delimited:
.separator "," 
.import genes.csv genes
.import knownPromoters.csv promoters
.import knownTerms.csv terminators
.import tu.csv transcript_units


-- Run the following queries 
.headers on
.mode column

-- ########################## check tables ##############################
.schema

SELECT count(*) FROM genes;
-- 4455

SELECT count(*) FROM promoters;
-- 811

SELECT count(*) FROM terminators;
-- 109

SELECT count(*) FROM transcript_units;
-- 5073

SELECT length(seq) FROM pos_strand;
-- 4639222

SELECT length(seq) FROM neg_strand;
-- 4639221
-- ######################################################################



-- ########################## Simple queries ###############################
SELECT name, pos_left
    FROM  genes 
    WHERE strand = '+' 
    ORDER BY pos_left
    limit 100; -- limit resultset to 100 rows

-- count how many rows in the full resultset of above query
SELECT count(*) 
    FROM  genes 
    WHERE strand = '+' 
    ORDER BY pos_left;
-- 2195
-- #########################################################################



-- ######################## Query for aggregate info ###############################
-- length is column name of column that holds integers
SELECT SUM(length)
   FROM genes;
-- 4129310

-- length is a function that returns the length of a value of type TEXT
SELECT MIN(length(seq))
   FROM genes; 
-- 0
-- ##################################################################################



-- ######################## String queries ##############################
-- String queries
-- SUBSTR (str, position, [length])
-- args  str:TEXT value, position:start point on the string,
--   [length] how long we want the substring to go
SELECT SUBSTR(seq,100,10)
   FROM pos_strand;  
-- ttaaaatttt

-- wrap what we selected above with a call to convert it to uppercase 
SELECT UPPER(SUBSTR(seq,100,10))
   FROM pos_strand; 
-- TTAAAATTTT

-- ######################################################################



-- #########################  GROUP BY  #############################
--simple GROUP BY command to query for aggregate info:
-- can select GROUP BY column (eg: type) 
--  or an aggregate function (eg: max{length))
SELECT type, max(length)
   FROM genes 
   WHERE type !='' 
   GROUP BY type;

SELECT type, COUNT(*)
   FROM genes
   GROUP BY type; 

SELECT type, COUNT(*)
   FROM genes
   WHERE type != ''
   GROUP BY type;

SELECT type,subtype, COUNT(*)
   FROM genes
   GROUP BY type, subtype;

-- ##################################################################



-- #########################  INNER JOIN  #############################
SELECT tu.name, g.name, tu.prom_name
     FROM transcript_units  tu
     INNER JOIN  genes g
     ON tu.fk_gene_name = g.name
     limit 100;

SELECT count(*)
     FROM transcript_units  tu
     INNER JOIN  genes g
     ON tu.fk_gene_name = g.name;
-- 5073
-- ####################################################################

