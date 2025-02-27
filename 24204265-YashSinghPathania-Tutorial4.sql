-- NAME: Yash Singh Pathania --
-- ID: 24204265 --


-- Using DataBase --
USE movies;


-- Question 1a
CREATE OR REPLACE VIEW feature_diversity AS
SELECT
	fw.feature_id,
	f.title,
	f.year,
	COUNT(fw.person) AS diversity
FROM feature_work fw
JOIN features f
ON f.feature_id = fw.feature_id
AND NOT (fw.gender = 'male' AND fw.ethnicity = 'Causasian')
GROUP BY fw.feature_id
ORDER BY diversity DESC;



-- Question 1b
CREATE OR REPLACE VIEW franchise_diversity AS
SELECT 
	frnch.franchise_id,
	frnch.name,
	(AVG(diversity) AS avg_diversity)
FROM (
	SELECT
		fw.feature_id,
		f.title,
		f.year,
		COUNT(fw.person) AS diversity
	FROM feature_work fw
	JOIN features f
	ON f.feature_id = fw.feature_id
	AND NOT (fw.gender = 'male' AND fw.ethnicity = 'Causasian')
	GROUP BY fw.feature_id
) subq
JOIN franchise_features ff
ON ff.feature_id = subq.feature_id
JOIN franchises frnch
ON ff.franchise_id = frnch.franchise_id
GROUP BY frnch.franchise_id
ORDER BY avg_diversity DESC;


-- Question 2
CREATE OR REPLACE VIEW franchise_grosses AS
SELECT 
	frnch.franchise_id AS ID,
	frnch.name,
	f.title,
	f.year,
	(dg.amount + ig.amount) AS gross,
	AVG((dg.amount + ig.amount)) OVER (PARTITION BY frnch.franchise_id) AS average
FROM franchises frnch
JOIN franchise_features ff 
ON ff.franchise_id = frnch.franchise_id
JOIN features f
ON ff.feature_id = f.feature_id
JOIN domestic_gross dg
ON dg.feature_id = f.feature_id
JOIN international_gross ig
ON ig.feature_id = f.feature_id
ORDER BY average DESC;



-- Question 3
CREATE OR REPLACE VIEW type_casting AS
SELECT 
	subq1.person,
	subq1.role_type,
	subq1.affinity
FROM (
	SELECT 
		fr.person,
		rt.role_type,
		COUNT(DISTINCT fr.feature_id) AS affinity
	FROM feature_role fr
	JOIN role_type rt
	ON rt.role_id = fr.role_id
	GROUP BY fr.person, rt.role_type
) subq1
JOIN (
	SELECT 
	    person,
	    COUNT(DISTINCT feature_id) AS total_features
	FROM feature_role
	GROUP BY person
) subq2
ON subq1.person = subq2.person
AND subq1.affinity = subq2.total_features
AND subq1.affinity > 1
ORDER BY subq1.affinity DESC;




-- Question 4
CREATE OR REPLACE VIEW replacements AS
SELECT 
	sq1.role,
	sq1.person AS first,
	sq1.title AS original_title,
	sq1.year AS first_year,
	sq2.person AS replacement,
	sq2.title AS new_title,
	sq2.year AS new_year
FROM (
	SELECT 
		fr.person,
		fr.role,
		f.title,
		f.year,
		fr.gender,
		fr.ethnicity
	FROM feature_role fr
	JOIN features f
	ON fr.feature_id = f.feature_id
) sq1
JOIN (
	SELECT 
		fr.person,
		fr.role,
		f.title,
		f.year,
		fr.gender,
		fr.ethnicity
	FROM feature_role fr
	JOIN features f
	ON fr.feature_id = f.feature_id
) sq2
ON sq1.role = sq2.role
AND sq1.year != sq2.year
AND sq1.person != sq2.person
AND ((sq1.gender = 'male' AND sq2.gender = 'female') OR (sq1.ethnicity = 'Caucasian' AND sq2.ethnicity != 'Caucasian'));

