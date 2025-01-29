SELECT *
FROM [Airline].[dbo].[Airline_sentiment]

---Removing unwanted columns

ALTER TABLE Airline_sentiment
DROP COLUMN F1--[Unnamed: 0], [Unnamed: 01]

--FINDING TOTALS OF SENTIMENTS
--Negative
SELECT COUNT(compound) AS Total_Neg_Reviews
FROM Airline_sentiment
WHERE compound LIKE '%-%' OR compound BETWEEN '0' AND '0.099'

--Positive
SELECT COUNT(compound) AS Total_Positive_Reviews
FROM Airline_sentiment
WHERE compound BETWEEN '0.5' AND '1'

--NEUTRAL
SELECT COUNT(compound) AS Total_Neut_Reviews
FROM Airline_sentiment
WHERE compound BETWEEN '0.10' AND '0.49'

--FINDING PERCENTAGE OF THE Sentiments
--%Negative
WITH Neg AS(
SELECT COUNT(compound) AS Total_Neg_Reviews
FROM Airline_sentiment
WHERE compound LIKE '%-%' OR compound BETWEEN '0' AND '0.099')

SELECT ROUND(CAST(Total_Neg_Reviews*100 as float)/(SELECT count(compound) from Airline_sentiment), 2) AS Percentage_Neg
FROM Neg

--%Positive
WITH Pos AS (
SELECT COUNT(compound) AS Total_Positive_Reviews
FROM Airline_sentiment
WHERE compound BETWEEN '0.5' AND '1')

SELECT ROUND (CAST(Total_Positive_Reviews*100 as float)/(SELECT count(compound) from Airline_sentiment), 2) AS Percentage_Pos
FROM Pos

--%Neautral
WITH Neut AS (
SELECT COUNT(compound) AS Total_Neut_Reviews
FROM Airline_sentiment
WHERE compound BETWEEN '0.10' AND '0.49')

SELECT ROUND(CAST(Total_Neut_Reviews*100 as float)/(SELECT count(compound) from Airline_sentiment), 2) AS Percentage_Neu
FROM Neut

--CREATING TABLE TO HOUSE THE QUERRIES
--creating table to house count of diffrent reviews results.
CREATE TABLE Review_counts (
Total_Negative INT NULL,
Total_positive INT NULL,
Total_Neutral INT NULL
)

--creating table to house percentage distribution of reviews
CREATE TABLE Review_percentage (
Percentage_Negative FLOAT,
Percentage_positive FLOAT,
Percentage_Neutral FLOAT
)

--POPULATING DATA INTO THE NEW TABLES
--Populating data into Review_counts table

INSERT INTO Review_counts(Total_Negative, Total_positive, Total_Neutral)
VALUES (95, 194, 20)

SELECT*
FROM Review_percentage

INSERT INTO Review_percentage(Percentage_Negative, Percentage_positive, Percentage_Neutral)
VALUES (30.74, 62.78, 6.74)

--EDA TOPIC MODELLING
SELECT*
FROM Airline_topics

--removing unwanted columns
ALTER Table Airline_topics
DROP COLUMN F1

----Remodelling topic_keywords from reading through each topics  in python TOPIC MODELLING (topic_model.topics_df.query("topic == 0")
SELECT topic, topic_keywords, sentiment,
		CASE 
			WHEN topic = 0 THEN 'Poor Service, Connecting flight'
			WHEN topic = 1 THEN 'legroom, old aircraft, Club Europe, dirty plane'
			WHEN topic = 2 THEN 'Tight seats, poor service'
			WHEN topic = 3 THEN 'poor service, inflight entertainment'
			WHEN topic = 4 THEN 'tight seat, poor service'
			WHEN topic = 5 THEN 'Good aircraft, excellent service'
			WHEN topic = 6 THEN 'Gatwick, excellent service'
			WHEN topic = 7 THEN 'good food, excellent service'
			WHEN topic = 8 THEN 'poor food'
			WHEN topic = 9 THEN 'service upgrade'
			WHEN topic = 10 THEN 'delayed flight'
			WHEN topic = 11 THEN 'late depature, excellent service'
			WHEN topic = 12 THEN 'Quick response, friendly crew'
			WHEN topic = 13 THEN 'delayed flight, bad flight, poor service'
			WHEN topic = 14 THEN 'Bad experience, old plane, bad lounge service, poor ground service'
			WHEN topic = 15 THEN 'old aircraft, good service, good staff'
			WHEN topic = 16 THEN 'uncomfortable seats, legroom, timely depature, timely arrival'
			WHEN topic = 17 THEN 'costly, bad experience'
			WHEN topic = 18 THEN 'costly, bad expereince'
			WHEN topic = 19 THEN 'excellent cabin crew, comfortable seats, club world'
			WHEN topic = 20 THEN 'Brandnew airbus, friendly crew'
			WHEN topic = 21 THEN 'timely schedule, legroom'
			WHEN topic = 22 THEN 'Helpful crew, good meal, poor inglight entertainment'
			WHEN topic = 23 THEN 'Ok seat, helpful crew'
			WHEN topic = 24 THEN 'Excellent flight crew, poor food'
END AS topic_summary
FROM Airline_topics

--Renaming a column
EXEC sp_rename 'Airline_topics.topic', 'topic_no', 'COLUMN'

SELECT*
FROM Airline_topics
ORDER BY Topic_no

--Adding new column in order to update table
ALTER TABLE Airline_topics
ADD topic_summary Varchar(255),
    topic Varchar(255)



UPDATE Airline_topics
SET topic_summary = CASE 
			WHEN topic = 0 THEN 'Poor Service, Connecting flight'
			WHEN topic = 1 THEN 'legroom, old aircraft, Club Europe, dirty plane'
			WHEN topic = 2 THEN 'Tight seats, poor service'
			WHEN topic = 3 THEN 'poor service, inflight entertainment'
			WHEN topic = 4 THEN 'tight seat, poor service'
			WHEN topic = 5 THEN 'Good aircraft, excellent service'
			WHEN topic = 6 THEN 'Gatwick, excellent service'
			WHEN topic = 7 THEN 'good food, excellent service'
			WHEN topic = 8 THEN 'poor food'
			WHEN topic = 9 THEN 'service upgrade'
			WHEN topic = 10 THEN 'delayed flight'
			WHEN topic = 11 THEN 'late depature, excellent service'
			WHEN topic = 12 THEN 'Quick response, friendly crew'
			WHEN topic = 13 THEN 'delayed flight, bad flight, poor service'
			WHEN topic = 14 THEN 'Bad experience, old plane, bad lounge service, poor ground service'
			WHEN topic = 15 THEN 'old aircraft, good service, good staff'
			WHEN topic = 16 THEN 'uncomfortable seats, legroom, timely depature, timely arrival'
			WHEN topic = 17 THEN 'costly, bad experience'
			WHEN topic = 18 THEN 'costly, bad expereince'
			WHEN topic = 19 THEN 'excellent cabin crew, comfortable seats, club world'
			WHEN topic = 20 THEN 'Brandnew airbus, friendly crew'
			WHEN topic = 21 THEN 'timely schedule, legroom'
			WHEN topic = 22 THEN 'Helpful crew, good meal, poor inglight entertainment'
			WHEN topic = 23 THEN 'Ok seat, helpful crew'
			WHEN topic = 24 THEN 'Excellent flight crew, poor food'
END
FROM Airline_topics

--Adding one word topic to house topic summary
SELECT topic, topic_keywords, sentiment,
		CASE 
			WHEN topic = 0 THEN 'Service'
			WHEN topic = 1 THEN 'legroom'
			WHEN topic = 2 THEN 'Tight seat'
			WHEN topic = 3 THEN 'inflight entertainment'
			WHEN topic = 4 THEN 'service'
			WHEN topic = 5 THEN 'Good aircraft'
			WHEN topic = 6 THEN 'Gatwick'
			WHEN topic = 7 THEN 'food'
			WHEN topic = 8 THEN 'food'
			WHEN topic = 9 THEN 'service upgrade'
			WHEN topic = 10 THEN 'flight'
			WHEN topic = 11 THEN 'flight'
			WHEN topic = 12 THEN 'crew'
			WHEN topic = 13 THEN 'flight'
			WHEN topic = 14 THEN 'old aircraft'
			WHEN topic = 15 THEN 'old aircraft'
			WHEN topic = 16 THEN 'service'
			WHEN topic = 17 THEN 'costly'
			WHEN topic = 18 THEN 'costly'
			WHEN topic = 19 THEN 'service'
			WHEN topic = 20 THEN 'Brandnew airbus'
			WHEN topic = 21 THEN 'flight'
			WHEN topic = 22 THEN 'service'
			WHEN topic = 23 THEN 'crew'
			WHEN topic = 24 THEN 'crew'
END AS topic_summary
FROM Airline_topics

UPDATE Airline_topics
SET topic = CASE 
			WHEN topic_no = 0 THEN 'Service'
			WHEN topic_no = 1 THEN 'legroom'
			WHEN topic_no = 2 THEN 'Tight seat'
			WHEN topic_no = 3 THEN 'inflight entertainment'
			WHEN topic_no = 4 THEN 'service'
			WHEN topic_no = 5 THEN 'Good aircraft'
			WHEN topic_no = 6 THEN 'Gatwick'
			WHEN topic_no = 7 THEN 'food'
			WHEN topic_no = 8 THEN 'food'
			WHEN topic_no = 9 THEN 'service upgrade'
			WHEN topic_no = 10 THEN 'flight'
			WHEN topic_no = 11 THEN 'flight'
			WHEN topic_no = 12 THEN 'crew'
			WHEN topic_no = 13 THEN 'flight'
			WHEN topic_no = 14 THEN 'old aircraft'
			WHEN topic_no = 15 THEN 'old aircraft'
			WHEN topic_no = 16 THEN 'service'
			WHEN topic_no = 17 THEN 'costly'
			WHEN topic_no = 18 THEN 'costly'
			WHEN topic_no = 19 THEN 'service'
			WHEN topic_no = 20 THEN 'Brandnew airbus'
			WHEN topic_no = 21 THEN 'flight'
			WHEN topic_no = 22 THEN 'service'
			WHEN topic_no = 23 THEN 'crew'
			WHEN topic_no = 24 THEN 'crew'
END 

--Dividing Topics into Sentiment categories

--%Negative
SELECT*
FROM Airline_topics
WHERE Sentiment LIKE '%-%' OR Sentiment BETWEEN '0' AND '0.099'


--%Positive
SELECT*
FROM Airline_topics
WHERE Sentiment BETWEEN '0.5' AND '1'

--%Neautral
SELECT*
FROM Airline_topics
WHERE Sentiment BETWEEN '0.10' AND '0.49'

--creating views for visiualization
--%Negative
CREATE VIEW Negative_sent AS
SELECT*
FROM Airline_topics
WHERE Sentiment LIKE '%-%' OR Sentiment BETWEEN '0' AND '0.099'


--%Positive
CREATE VIEW Positive_sent AS
SELECT*
FROM Airline_topics
WHERE Sentiment BETWEEN '0.5' AND '1'

--%Neautral
CREATE VIEW Neutral_sent AS
SELECT*
FROM Airline_topics
WHERE Sentiment BETWEEN '0.10' AND '0.49'
