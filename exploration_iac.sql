-- Data Cleaning and Exploration

-- Create new table with new columns

-- Categorize ages from the age columns into one of five groups and add age_group column to new table.
-- Group 1: 0-18
-- Group 2: 19-35
-- Group 3: 36-50
-- Group 4: 51-65
-- Group 5: 66+
DROP TABLE IF EXISTS iac_table;
CREATE TABLE iac_table AS
	SELECT *,
		CASE	
			WHEN age<18 THEN '0-18'
			WHEN age>=18 AND age<36 THEN '19-35'
			WHEN age>=36 AND age<51 THEN '36-50'
			WHEN age>=51 AND age<66 THEN '51-65'
			ELSE '66+'
		END AS age_group
FROM iac_mimic2;

-- Data exploration
select * from iac_table limit 5;

-- Summary statistics 
SELECT 
	ROUND(AVG(age)::numeric,4) AS avg_age,
	ROUND(MIN(age)::numeric,4) AS min_age,
	ROUND(MAX(age)::numeric,4) AS max_age
FROM iac_table;

-- Patient gender (1 = male; 0=female)
SELECT gender_num, COUNT(*)
FROM iac_table
GROUP BY gender_num;

-- IAC used (binary, 1 = yes, 0 = no)
SELECT aline_flg, COUNT(*)
FROM iac_table
GROUP BY aline_flg;

-- Death within 28 days (binary: 1 = yes, 0 = no)
SELECT day_28_flg, COUNT(*)
FROM iac_table
GROUP BY day_28_flg;

