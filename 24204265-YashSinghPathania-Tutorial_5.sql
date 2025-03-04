-- Yash Singh Pathania 
-- STUDENT NUMBER: 24204265
-- Tutorial 5
-- Enjoy your reading and have a fantastic day ^-^  each subsection would need to be run on itself 
-- Quesion 1

DROP VIEW IF EXISTS character_type_counts;
CREATE VIEW character_type_counts AS
SELECT 
    fr.role AS role,
    SUM(CASE WHEN rt.role_type = 'hero' THEN 1 ELSE 0 END) AS hero,
    SUM(CASE WHEN rt.role_type = 'villain' THEN 1 ELSE 0 END) AS villain,
    SUM(CASE WHEN rt.role_type = 'detective' THEN 1 ELSE 0 END) AS detective,
    SUM(CASE WHEN rt.role_type = 'spy' THEN 1 ELSE 0 END) AS spy,
    SUM(CASE WHEN rt.role_type = 'playboy' THEN 1 ELSE 0 END) AS playboy,
    SUM(CASE WHEN rt.role_type = 'CEO' THEN 1 ELSE 0 END) AS CEO, 
    SUM(CASE WHEN rt.role_type = 'thief' THEN 1 ELSE 0 END) AS thief,
    SUM(CASE WHEN rt.role_type = 'philanthropist' THEN 1 ELSE 0 END) AS philanthropist,
    SUM(CASE WHEN rt.role_type = 'archer' THEN 1 ELSE 0 END) AS archer,
    SUM(CASE WHEN rt.role_type = 'magician' THEN 1 ELSE 0 END) AS magician,
    SUM(CASE WHEN rt.role_type = 'superhero' THEN 1 ELSE 0 END) AS superhero,
    SUM(CASE WHEN rt.role_type = 'doctor' THEN 1 ELSE 0 END) AS doctor,
    SUM(CASE WHEN rt.role_type = 'alien' THEN 1 ELSE 0 END) AS alien,
    SUM(CASE WHEN rt.role_type = 'reporter' THEN 1 ELSE 0 END) AS reporter,
    SUM(CASE WHEN rt.role_type = 'politician' THEN 1 ELSE 0 END) AS politician,
    SUM(CASE WHEN rt.role_type = 'president' THEN 1 ELSE 0 END) AS president,
    SUM(CASE WHEN rt.role_type = 'mathematician' THEN 1 ELSE 0 END) AS mathematician,
    SUM(CASE WHEN rt.role_type = 'assassin' THEN 1 ELSE 0 END) AS assassin,
    SUM(CASE WHEN rt.role_type = 'butler' THEN 1 ELSE 0 END) AS butler,
    SUM(CASE WHEN rt.role_type = 'amnesiac' THEN 1 ELSE 0 END) AS amnesiac,
    SUM(CASE WHEN rt.role_type = 'hacker' THEN 1 ELSE 0 END) AS hacker,
    SUM(CASE WHEN rt.role_type = 'inventor' THEN 1 ELSE 0 END) AS inventor,
    SUM(CASE WHEN rt.role_type = 'mutant' THEN 1 ELSE 0 END) AS mutant,
    SUM(CASE WHEN rt.role_type = 'astronaut' THEN 1 ELSE 0 END) AS astronaut,
    SUM(CASE WHEN rt.role_type = 'professor' THEN 1 ELSE 0 END) AS professor,
    SUM(CASE WHEN rt.role_type = 'scientist' THEN 1 ELSE 0 END) AS scientist,
    SUM(CASE WHEN rt.role_type = 'god' THEN 1 ELSE 0 END) AS god,
    SUM(CASE WHEN rt.role_type = 'soldier' THEN 1 ELSE 0 END) AS soldier,
    SUM(CASE WHEN rt.role_type = 'racoon' THEN 1 ELSE 0 END) AS racoon,
    SUM(CASE WHEN rt.role_type = 'tree' THEN 1 ELSE 0 END) AS tree,
    SUM(CASE WHEN rt.role_type = 'billionaire' THEN 1 ELSE 0 END) AS billionaire
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY role;

SELECT * FROM character_type_counts;


-- Q2

DROP VIEW IF EXISTS actor_types;

CREATE VIEW actor_types AS
SELECT 
    fr.person AS actor,
    SUM(CASE WHEN rt.role_type = 'hero' THEN 1 ELSE 0 END) AS hero,
    SUM(CASE WHEN rt.role_type = 'villain' THEN 1 ELSE 0 END) AS villain,
    SUM(CASE WHEN rt.role_type = 'detective' THEN 1 ELSE 0 END) AS detective,
    SUM(CASE WHEN rt.role_type = 'spy' THEN 1 ELSE 0 END) AS spy,
    SUM(CASE WHEN rt.role_type = 'playboy' THEN 1 ELSE 0 END) AS playboy,
    SUM(CASE WHEN rt.role_type = 'CEO' THEN 1 ELSE 0 END) AS CEO, 
    SUM(CASE WHEN rt.role_type = 'thief' THEN 1 ELSE 0 END) AS thief,
    SUM(CASE WHEN rt.role_type = 'philanthropist' THEN 1 ELSE 0 END) AS philanthropist,
    SUM(CASE WHEN rt.role_type = 'archer' THEN 1 ELSE 0 END) AS archer,
    SUM(CASE WHEN rt.role_type = 'magician' THEN 1 ELSE 0 END) AS magician,
    SUM(CASE WHEN rt.role_type = 'superhero' THEN 1 ELSE 0 END) AS superhero,
    SUM(CASE WHEN rt.role_type = 'doctor' THEN 1 ELSE 0 END) AS doctor,
    SUM(CASE WHEN rt.role_type = 'alien' THEN 1 ELSE 0 END) AS alien,
    SUM(CASE WHEN rt.role_type = 'reporter' THEN 1 ELSE 0 END) AS reporter,
    SUM(CASE WHEN rt.role_type = 'politician' THEN 1 ELSE 0 END) AS politician,
    SUM(CASE WHEN rt.role_type = 'president' THEN 1 ELSE 0 END) AS president,
    SUM(CASE WHEN rt.role_type = 'mathematician' THEN 1 ELSE 0 END) AS mathematician,
    SUM(CASE WHEN rt.role_type = 'assasin' THEN 1 ELSE 0 END) AS assasin,
    SUM(CASE WHEN rt.role_type = 'butler' THEN 1 ELSE 0 END) AS butler,
    SUM(CASE WHEN rt.role_type = 'amnesiac' THEN 1 ELSE 0 END) AS amnesiac,
    SUM(CASE WHEN rt.role_type = 'hacker' THEN 1 ELSE 0 END) AS hacker,
    SUM(CASE WHEN rt.role_type = 'inventor' THEN 1 ELSE 0 END) AS inventor,
    SUM(CASE WHEN rt.role_type = 'mutant' THEN 1 ELSE 0 END) AS mutant,
    SUM(CASE WHEN rt.role_type = 'astronaut' THEN 1 ELSE 0 END) AS astronaut,
    SUM(CASE WHEN rt.role_type = 'professor' THEN 1 ELSE 0 END) AS professor,
    SUM(CASE WHEN rt.role_type = 'scientist' THEN 1 ELSE 0 END) AS scientist,
    SUM(CASE WHEN rt.role_type = 'god' THEN 1 ELSE 0 END) AS god,
    SUM(CASE WHEN rt.role_type = 'soldier' THEN 1 ELSE 0 END) AS soldier,
    SUM(CASE WHEN rt.role_type = 'racoon' THEN 1 ELSE 0 END) AS racoon,
    SUM(CASE WHEN rt.role_type = 'tree' THEN 1 ELSE 0 END) AS tree,
    SUM(CASE WHEN rt.role_type = 'billionaire' THEN 1 ELSE 0 END) AS billionaire
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.person
ORDER BY actor;

SELECT * FROM actor_types;


-- Q3

-- Heroes view
DROP VIEW IF EXISTS heroes;

CREATE VIEW heroes AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'hero' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM heroes;

-- Villains view
DROP VIEW IF EXISTS villains;

CREATE VIEW villains AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'villain' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM villains;

-- Detectives view
DROP VIEW IF EXISTS detectives;

CREATE VIEW detectives AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'detective' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM detectives;

-- Spies view
DROP VIEW IF EXISTS spies;

CREATE VIEW spies AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'spy' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM spies;

-- Playboys view
DROP VIEW IF EXISTS playboys;

CREATE VIEW playboys AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'playboy' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM playboys;

-- CEOs view
DROP VIEW IF EXISTS CEOs;

CREATE VIEW CEOs AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'CEO' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM CEOs;

-- Thieves view
DROP VIEW IF EXISTS thieves;

CREATE VIEW thieves AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'thief' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM thieves;

-- Philanthropists view
DROP VIEW IF EXISTS philanthropists;
CREATE VIEW philanthropists AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'philanthropist' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM philanthropists;

-- Archers view
DROP VIEW IF EXISTS archers;

CREATE VIEW archers AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'archer' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM archers;

-- Magicians view
DROP VIEW IF EXISTS magicians;

CREATE VIEW magicians AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'magician' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM magicians;

-- Superheros view
DROP VIEW IF EXISTS superheroes;
CREATE VIEW superheroes AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'superhero' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM superheroes;

-- Doctors view
DROP VIEW IF EXISTS doctors;
CREATE VIEW doctors AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'doctor' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM doctors;

-- Aliens view
DROP VIEW IF EXISTS aliens;
CREATE VIEW aliens AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'alien' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM aliens;

-- Reporters view
DROP VIEW IF EXISTS reporters;
CREATE VIEW reporters AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'reporter' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM reporters;

-- Politicians view
DROP VIEW IF EXISTS politicians;
CREATE VIEW politicians AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'politician' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM politicians;

-- Presidents view
DROP VIEW IF EXISTS presidents;
CREATE VIEW presidents AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'president' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM presidents;

-- Mathematicians view
DROP VIEW IF EXISTS mathematicians;
CREATE VIEW mathematicians AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'mathematician' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM mathematicians;

-- Assassins view
DROP VIEW IF EXISTS assassins;
CREATE VIEW assassins AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'assassin' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM assassins;

-- Butlers view
DROP VIEW IF EXISTS butlers;
CREATE VIEW butlers AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'butler' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM butlers;

-- Amnesiacs view
DROP VIEW IF EXISTS amnesiacs;
CREATE VIEW amnesiacs AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'amnesiac' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM amnesiacs;

-- Hackers view
DROP VIEW IF EXISTS hackers;
CREATE VIEW hackers AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'hacker' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM hackers;

-- Inventors view
DROP VIEW IF EXISTS inventors;
CREATE VIEW inventors AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'inventor' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM inventors;

-- Mutants view
DROP VIEW IF EXISTS mutants;
CREATE VIEW mutants AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'mutant' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM mutants;

-- Astronauts view
DROP VIEW IF EXISTS astronauts;
CREATE VIEW astronauts AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'astronaut' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM astronauts;

-- Professors view
DROP VIEW IF EXISTS professors;
CREATE VIEW professors AS
 SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'professor' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM professors;

-- Scientists view
DROP VIEW IF EXISTS scientists;
CREATE VIEW scientists AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'scientist' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM scientists;

-- Gods view
DROP VIEW IF EXISTS gods;
CREATE VIEW gods AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'god' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM gods;

-- Soldiers view
DROP VIEW IF EXISTS soldiers;
CREATE VIEW soldiers AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'soldier' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM soldiers;

-- Racoons view
DROP VIEW IF EXISTS raccoons;
CREATE VIEW raccoons AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'raccoon' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM raccoons;

-- Trees view
DROP VIEW IF EXISTS trees;
CREATE VIEW trees AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'tree' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM trees;

-- Billionaires view
DROP VIEW IF EXISTS billionaires;
CREATE VIEW billionaires AS
SELECT 
    fr.role AS role,
    COUNT(CASE WHEN rt.role_type = 'billionaire' THEN 1 END) AS count
FROM feature_role fr
JOIN role_type rt ON fr.role_id = rt.role_id
GROUP BY fr.role
ORDER BY count DESC;

SELECT * FROM billionaires;


-- Q4

DELIMITER $$

DROP FUNCTION IF EXISTS CountRoleTypePercentage$$

CREATE FUNCTION CountRoleTypePercentage(character_name VARCHAR(255), role_type_name VARCHAR(255)) 
RETURNS DECIMAL(5,2) 
DETERMINISTIC
BEGIN
DECLARE total_features INT;
    DECLARE role_type_count INT;
    DECLARE percentage DECIMAL(5,2);

    -- Calculate total distinct features where the character appears
    SELECT COUNT(DISTINCT fr.feature_id) INTO total_features
    FROM feature_role fr
    WHERE fr.role = character_name;

    -- Count distinct features where the character has the given role type
    SELECT COUNT(DISTINCT fr.feature_id) INTO role_type_count
    FROM feature_role fr
    JOIN role_type rt ON fr.role_id = rt.role_id
    WHERE fr.role = character_name AND rt.role_type = role_type_name;

    IF total_features = 0 THEN
        RETURN 0;
    END IF;

    SET percentage = (role_type_count / total_features) * 100;

    RETURN percentage;
END$$

DELIMITER ;

SELECT CountRoleTypePercentage("Thor", "hero") AS percentage;


-- Q5

DELIMITER $$

DROP FUNCTION IF EXISTS CountActorTypePercentage$$

CREATE FUNCTION CountActorTypePercentage(actor_name VARCHAR(255), role_type_name VARCHAR(255)) 
RETURNS DECIMAL(5,2) 
DETERMINISTIC
BEGIN
    DECLARE total_features INT;
    DECLARE role_type_count INT;
    DECLARE percentage DECIMAL(5,2);

    -- Calculate total distinct features featuring the actor
    SELECT COUNT(DISTINCT fr.feature_id) INTO total_features
    FROM feature_role fr
    WHERE fr.person = actor_name;

    -- Count distinct features where the actor played the specified role type
    SELECT COUNT(DISTINCT fr.feature_id) INTO role_type_count
    FROM feature_role fr
    JOIN role_type rt ON fr.role_id = rt.role_id
    WHERE fr.person = actor_name AND rt.role_type = role_type_name;

    IF total_features = 0 THEN
        RETURN 0;
    END IF;

    SET percentage = (role_type_count / total_features) * 100;

    RETURN percentage;
END$$

DELIMITER ;

SELECT CountActorTypePercentage("Robert Downey Jr.", "hero") AS percentage;
