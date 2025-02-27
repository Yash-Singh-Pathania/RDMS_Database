-- Student Name : Yash Singh Pathania 
-- Student Id   : 24204265


USE movies;

-- Q1
-- Profitable  =  (domestic_gross + international_gross) > 2.5 * budget.
SELECT fr.person, fr.role, COUNT(*) AS times 
FROM feature_role fr 
WHERE fr.feature_id IN (
  SELECT f.feature_id 
  FROM features f 
  JOIN budget b ON f.feature_id = b.feature_id 
  JOIN domestic_gross d ON f.feature_id = d.feature_id 
  JOIN international_gross i ON f.feature_id = i.feature_id 
  WHERE (d.amount + i.amount) > 2.5 * b.amount
) 
GROUP BY fr.person, fr.role 
HAVING COUNT(*) > 1
ORDER  BY times desc;


-- Q2. Return the franchise with the largest average gross earnings that does not involve Robert Downey Jr.
--- Note avg is calculated using the AVG function in sql.
SELECT franchises.name AS franchise_name, 
       AVG(domestic_gross.amount + international_gross.amount) AS average
FROM franchises 
JOIN franchise_features ON franchises.franchise_id = franchise_features.franchise_id
JOIN features ON franchise_features.feature_id = features.feature_id
JOIN domestic_gross ON features.feature_id = domestic_gross.feature_id
JOIN international_gross ON features.feature_id = international_gross.feature_id
WHERE franchises.franchise_id NOT IN (
  SELECT DISTINCT franchise_features.franchise_id
  FROM feature_work 
  JOIN franchise_features ON feature_work.feature_id = franchise_features.feature_id
  WHERE feature_work.person = 'Robert Downey Jr.'
)
GROUP BY franchises.name
ORDER BY average DESC 
LIMIT 1;


-- Q3. Find the lowest grossing superhero movie.
-- A movie is considered a superhero movie if at least one of its roles (from feature_role joined with role_type)
-- has role_type 'hero' or 'superhero'. Gross is the sum of its domestic and international grosses.
SELECT features.title, features.year, (domestic_gross.amount + international_gross.amount) AS gross
FROM features 
JOIN feature_role ON features.feature_id = feature_role.feature_id
JOIN role_type ON feature_role.role_id = role_type.role_id
JOIN domestic_gross ON features.feature_id = domestic_gross.feature_id
JOIN international_gross ON features.feature_id = international_gross.feature_id
WHERE role_type.role_type = 'superhero'
GROUP BY features.title, features.year, domestic_gross.amount, international_gross.amount
HAVING gross = (
  SELECT MIN(domestic_gross.amount + international_gross.amount)
  FROM features 
  JOIN feature_role ON features.feature_id = feature_role.feature_id
  JOIN role_type ON feature_role.role_id = role_type.role_id
  JOIN domestic_gross ON features.feature_id = domestic_gross.feature_id
  JOIN international_gross ON features.feature_id = international_gross.feature_id
  WHERE role_type.role_type = 'superhero'
);

-- Q4. Calculate, for each actor, the affinity for each role type (i.e. the number of times they have played a role of that type)
-- and then return only the role type(s) for which the actor’s count is maximal.
-- (An actor may have more than one “greatest” affinity.)
SELECT t.person,
       t.role_type,
       t.affinity
FROM (
  SELECT fr.person,
         rt.role_type,
         COUNT(*) AS affinity
  FROM feature_role fr
  JOIN role_type rt ON fr.role_id = rt.role_id
  GROUP BY fr.person, rt.role_type
) t
WHERE t.affinity = (
  SELECT MAX(t2.affinity)
  FROM (
    SELECT fr2.person,
           rt2.role_type,
           COUNT(*) AS affinity
    FROM feature_role fr2
    JOIN role_type rt2 ON fr2.role_id = rt2.role_id
    WHERE fr2.person = t.person
    GROUP BY fr2.person, rt2.role_type
  ) t2
)
ORDER BY t.affinity DESC; #Added to match sample output
