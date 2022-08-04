use spacex;
## Tasks

Now write and execute SQL queries to solve the assignment tasks.

### Task 1
##### Display the names of the unique launch sites  in the space mission

SELECT DISTINCT  launch_site FROM spacex;

### Task 2SELECT DISTINCT  launch_site FROM spacex;
##### Display 5 records where launch sites begin with the string 'CCA'

SELECT * 
FROM spacex
WHERE launch_site LIKE 'CCA%'
LIMIT 5;

### Task 3
##### Display the total payload mass carried by boosters launched by NASA (CRS)

SELECT customer,sum(PAYLOAD_MASS__KG_) as total_payload_by_NASA
FROM spacex
WHERE customer LIKE 'NASA%(CRS)'
GROUP BY customer ;

### Task 4
##### Display average payload mass carried by booster version F9 v1.1

SELECT booster_version, AVG(payload_mass__kg_) as 'avg_payloadmass_F9v1.1'
FROM spacex
WHERE booster_version LIKE 'F9%v1.1'
GROUP by booster_version;

### Task 5
##### List the date when the first successful landing outcome in ground pad was acheived.
*Hint:Use min function*

SELECT min(`date`)
FROM spacex
WHERE landing_outcome LIKE 'Success%ground%pad%' ;


### Task 6
##### List the names of the boosters which have success in drone ship and have payload mass greater than 4000 but less than 6000

SELECT booster_version,landing_outcome,payload_mass__kg_
FROM spacex
WHERE payload_mass__kg_ >4000 AND payload_mass__kg_<6000
GROUP BY booster_version HAVING landing_outcome LIKE 'Success%drone%ship%';


### Task 7
##### List the total number of successful and failure mission outcomes

SELECT COUNT(*),
CASE WHEN landing_outcome LIKE 'Success%' THEN 'successful'
     WHEN landing_outcome LIKE 'Failure%' THEN 'failure'
END as landing_outcome
FROM spacex
WHERE landing_outcome LIKE 'Success%' OR landing_outcome LIKE 'Failure%'
GROUP BY CASE WHEN landing_outcome LIKE 'Success%' THEN 'successful'
            WHEN landing_outcome LIKE 'Failure%' THEN 'failure'
            END;

SELECT SUM(CASE WHEN landing_outcome LIKE 'Success%' THEN 1 ELSE 0 END) AS successful_COUNT,
SUM(CASE WHEN landing_outcome LIKE 'Failure%' THEN 1 ELSE 0 END) AS failure_COUNT
FROM spacex;




### Task 8
##### List the names of the booster_versions which have carried the maximum payload mass. Use a subquery

SELECT booster_version,payload_mass__kg_
FROM spacex
WHERE payload_mass__kg_=
(SELECT MAX(payload_mass__kg_) AS max_payload FROM spacex
) ;

### Task 9
##### List the failed landing_outcomes in drone ship, their booster versions, and launch site names for in year 2015

SELECT `date`,landing_outcome,booster_version,launch_site
FROM spacex
WHERE DATE_FORMAT(`date`,'%Y')=2015 AND landing_outcome LIKE 'Failure%drone%ship%';


### Task 10
##### Rank the count of landing outcomes (such as Failure (drone ship) or Success (ground pad)) between the date 2010-06-04 and 2017-03-20, in descending order

SELECT DENSE_RANK() OVER (ORDER BY outcome_count DESC) as 'rank',
        landing_outcome,
        outcome_count
FROM(
SELECT COUNT(*) as outcome_count ,landing_outcome
FROM spacex 
WHERE `date` BETWEEN '2010-06-04' AND '2017-03-20'
GROUP BY landing_outcome) as sub_t1;


 

        

      
   





