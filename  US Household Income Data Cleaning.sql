# US Household Income Data Cleaning 

SELECT * 
FROM US_Project.us_household_income;

SELECT * 
FROM US_Project.us_household_income_statistics;

SELECT COUNT(id) 
FROM US_Project.us_household_income;

SELECT COUNT(id) 
FROM US_Project.us_household_income_statistics;

SELECT id, COUNT(id)
FROM US_Project.us_household_income
GROUP BY id
HAVING COUNT(id) > 1
;

SELECT *
FROM(
SELECT row_id,
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM US_Project.us_household_income
) duplicates
WHERE row_num > 1
;


DELETE FROM us_household_income
WHERE row_id IN (
	SELECT row_id
	FROM(
		SELECT row_id,
		id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
		FROM US_Project.us_household_income
		) duplicates
	WHERE row_num > 1)
;


SELECT DISTINCT State_Name
FROM US_Project.us_household_income
ORDER BY 1
;

UPDATE US_Project.us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia'
;

UPDATE US_Project.us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama'
;

SELECT *
FROM US_Project.us_household_income
WHERE County = 'Autauga County' 
ORDER BY 1
;


UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont'
#Missing value
;


SELECT Type, COUNT(Type)
FROM US_Project.us_household_income
GROUP BY Type
#ORDER BY 1
;

UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;

SELECT ALand, AWater
FROM US_Project.us_household_income
WHERE (ALand = 0 OR ALand = '' OR ALand IS NULL)
;








