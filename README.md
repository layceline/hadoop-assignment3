# hadoop-assignment3

Before starting to do the queries for this assignments, we had several steps to do:

+ Create the database <code><pre>CREATE DATABASE clay LOCATION '/user/clay/clay';</pre></code>

+ We cannot work with a .csv file thus I created a new directory and copied prenoms.csv into it <code><pre>
		hdfs dfs -mkdir prenoms
		hdfs dfs -cp /res/prenoms.csv prenoms/0000</pre></code>

+ Creating the table <code><pre>
	CREATE EXTERNAL TABLE prenoms(
		prenom STRING,
		gender ARRAY<String>,
		origin ARRAY<String>,
		version DOUBLE
	)
	ROW FORMAT DELIMITED
	COLLECTION ITEMS TERMINATED BY '\,'
	FIELDS TERMINATED BY '\073' STORED AS TEXTILE LOCATION '/user/clay/prenoms';</pre></code>

+ Creating the ORC table <code><pre>
	CREATE TABLE prenoms_opt(
		prenom STRING,
		gender ARRAY<String>,
		origin ARRAY<String>,
		version DOUBLE
	)
	ROW FORMAT DELIMITED
	STORED AS ORC; </pre></code>

+ Populating prenoms_opt <code><pre>
INSERT INTO TABLE prenoms_opt SELECT * FROM prenoms;</pre></code>
