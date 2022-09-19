# ELL Project
--- 
###### The project was built using Python3 and includes a **requirements.txt**. 
### Installing the libraries ###
    pip install -r requirements.txt
---
### Steps to run Jupyter notebooks ###
Install the **requirements.txt** file using the above command
##### **ELL_Questions.ipynb**
- This notebook returns a dataframe containing **question_data** from the the input **lesson_jsons**.
- The following columns are being populated with the **question_data** - *[exercise_id, questions, correct_responses, incorrect_responses, type, is_quiz]*
###### Steps to run the notebook
- Place all the lesson json files in a folder named **"lesson_jsons"**
- Run each cell to get the generated result dataframe with question data combined from all the **lesson_json** files
--- 
##### **ELL_Analysis.ipynb**
- This notebook conducts analysis on the **data_with_clientid.csv** file (a dump of 10000 rows from the DB) which is being generated from the PostgreSQL database
- It performs aggregations on columns like **'country'**, **'language'** and **skills** to calculate the average score 
- For every unique client_ids, we have a dictionary showcasing his **[listening, reading, writing, speaking]** skills combined for suggesting particular lessons which includes his/her weak skills
- Since client_country plays a major role in determining the location of user, a dictionary data structure has been built indicating the client_ids with the associated **country** and **language**
###### Steps to run the notebook
- Make sure **data_with_clientid.csv"** file contains in the same path
- Run each cell to get the generated result as explained above
---
##### **ProgressDataJSONParser.ipynb**
- This notebook parses JSON input fetched from **lesson_progress table**. This JSON contains user_progress information, template of questions, which skills were involved etc.
- The following columns are being populated with the parsed data - **[course_id, student_id, type, status, 	listening, reading, writing, speaking]**

###### Steps to run the notebook
- Make sure to replace the **json_data** in the code with your own custom json
- Run each cell to get the generated result as explained above
