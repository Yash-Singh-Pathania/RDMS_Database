-- Yash Singh Pathania 
-- 24204265


USE movies;

-- Q1: show franchise movies with Robert Downey Jr
SELECT f.title,
       f.year,
       fr.name
FROM features f, 
     feature_work w,
     franchise_features ff,
     franchises fr
WHERE f.feature_id = w.feature_id
  AND ff.feature_id = f.feature_id
  AND fr.franchise_id = ff.franchise_id
  AND w.person = 'Robert Downey Jr.'
  AND f.type = 'movie';

-- Q2: show franchise movies that made at least their budget domestically
-- and triple that internationally
SELECT f.title,
       f.year,
       fr.name,
       b.amount AS budget,
       d.amount AS domestic,
       i.amount AS international
FROM features f,
     franchise_features ff,
     franchises fr,
     budget b,
     domestic_gross d,
     international_gross i
WHERE ff.feature_id = f.feature_id
  AND fr.franchise_id = ff.franchise_id
  AND b.feature_id = f.feature_id
  AND d.feature_id = f.feature_id
  AND i.feature_id = f.feature_id
  -- Check that budget/gross have the same currency even though we assume it to be same later on 
  AND b.currency_id = d.currency_id
  AND b.currency_id = i.currency_id
  AND d.amount > b.amount
  AND i.amount > (3 * b.amount);


-- Q3: show all Robert Downey Jr. roles 
-- in a franchise that isn't Marvel Cinematic Universe
SELECT f.title,
       f.year,
       fr.name
FROM features f,
     feature_role r,
     franchise_features ff,
     franchises fr
WHERE f.feature_id = ff.feature_id
  AND f.feature_id = r.feature_id
  AND ff.franchise_id = fr.franchise_id
  AND r.person = 'Robert Downey Jr.'
  AND fr.name <> 'Marvel Cinematic Universe';

-- Q4: find Marvel movies that flopped 
-- (by not hitting the 2.5 times budget logic)
SELECT f.title,
       f.year,
       fr.name,
       b.amount AS budget,
       d.amount AS domestic_gross,
       i.amount AS international_gross
FROM features f,
     franchise_features ff,
     franchises fr,
     budget b,
     domestic_gross d,
     international_gross i
WHERE f.feature_id = ff.feature_id
  AND ff.franchise_id = fr.franchise_id
  AND b.feature_id = f.feature_id
  AND d.feature_id = f.feature_id
  AND i.feature_id = f.feature_id
  AND fr.name = 'Marvel Cinematic Universe'
  AND ( (d.amount + i.amount) ) < (2.5 * b.amount);

-- Q5: list Benedict Cumberbatch stuff not in the MCU
SELECT DISTINCT f.title, f.year
FROM features f, feature_work w
WHERE f.feature_id = w.feature_id
  AND w.person = 'Benedict Cumberbatch'
  AND NOT EXISTS (
    SELECT 1
    FROM franchise_features ff, franchises fr
    WHERE ff.feature_id = f.feature_id
      AND fr.franchise_id = ff.franchise_id
      AND fr.name = 'Marvel Cinematic Universe'
  );
