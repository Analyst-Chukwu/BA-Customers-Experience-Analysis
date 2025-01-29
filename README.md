# SENTIMENTAL ANALYSIS OF BRITISH AIRWAY’S CUSTOMER’S REVIEW

![Image](https://github.com/user-attachments/assets/4c47e970-200e-484c-adac-27c3d39617db)

#### Dashboard link: https://app.powerbi.com/links/r_9MXwogYL?ctid=be79a6fa-8c7c-4bf1-ac17-28812dae73b8&pbi_source=linkShare

## About the Company/Task:
British Airways (BA) is the flag carrier airline of the United Kingdom (UK). Every day, thousands of BA flights arrive to and depart from the UK, carrying customers across the world. Whether it’s for holidays, work or any other reason, the end-to-end process of scheduling, planning, boarding, fueling, transporting, landing, and continuously running flights on time, efficiently and with top-class customer service is a huge task with many highly important responsibilities.
## What is the business problem?
Every day, thousands of BA flights arrive to and depart from the UK, carrying customers across the world. BA wants to understand their customer service and what their customers’ positions towards them are.
## The Business Task:
As a data scientist at BA, (for this virtual internship with forage), I was tasked with understanding their customer's feelings, needs, in order to help BA with their business decisions and better reposition of their services.
## The Process:
1.  Data sourcing: Data was gotten from skytrax, a leading airline and airport evaluation system, using web scrapping tool—BeautifulSoup in python. 
2.  Data Cleaning: 
•	Sentimental Analysis was done using NLTK model, and Topic modelling to generate topics from the reviews was done using BERTopic model, all in Python. 
•	Further Exploratory Data Analysis was conducted using Microsoft SQL Server.
•	Null values where removed.
•	  Data was checked for duplicate
•	Data types were correctly formatted
4.  Data Analysis: Data was analyzed to answer the business question “What are BA customers’ flying experienceS?

## Uncover Insights From the Data: 
#### Customers’ Reviews of BA Flying Experience:

![Image](https://github.com/user-attachments/assets/a528adb0-c6e1-4d2c-81d9-7207a77cc25e)

![Image](https://github.com/user-attachments/assets/b41bf5a9-8077-41c4-8cc9-23fd279bd50a)
• Positive reviews take up 62.62%, Negative 30.66% and Neutral 6.72%. This goes to show that most customers either love or hate BA flying experience.

• Also that the 30.66% could be a potential loss for BA if they don’t address the concerns.
#### Top 4/5 Topics from BA Customers’ Flying Experience:
25 Topics were derived from the customers’ reviews.
![Image](https://github.com/user-attachments/assets/9b6807ed-d534-4602-b230-0ffa884a960d)
![Image](https://github.com/user-attachments/assets/acfb4b03-bb2c-4ada-a5c1-86c8f6175dea)
![Image](https://github.com/user-attachments/assets/91cd13a0-4218-4783-bc71-afc9e54e2edb)

•	Service, Food, Aircraft for Positive review

•	Service, aircraft, legroom, in-flight entertainment, cost,  for negative reviews

•	Of course the topic SERVICE can encompass flight crew’s and BA staff’s attitude and their disposition to be of service, and food. 

•	People were also concerned about the state of the aircraft; their safety. While new aircrafts have high positive score, old aircrafts have negative.

•	Much complaints comes from little or no legroom, and poor and limited choice of inflight entertainment.

# RECOMMENDATIONS:
1.	That BA have a periodic training for their staff and flight crews across all locations as the top reoccurring topic in all categories is SERVICE. Also the complaint on COST, and AIRCRAFT will be reduced drastically if customers get value for their money in terms on how they were treated during flight.
2.	That BA also improve the quality of their food, and if possible offer menu to give passengers choice.
3.	That BA update and improve their list of inflight entertainment with the latest movies and songs, and also have a wide range of catalogs. 
4.	That BA improve legroom space, or put legroom space as topmost consideration option for their aircrafts





