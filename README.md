# IAC-MIMIC2-Analysis

### Introduction 

This project uses data that was derived from the MIMIC-II clinical database to include ICU patients with respiratory failure. The main covariate of interest is concerned with the use of indwelling arterial catheters (IAC) which are used for blood gas analysis and hemodynamic monitoring.

The main objective of this analysis is to determine to what extent, if at all, usage of IAC poses more risk to patients included in this case study (hemodynamically stable and mechanically ventilated). 

### Data Cleaning / Preparation

#### Loading dataset
Loading data from CSV file into PostgreSQL was made simple by use of SQLAlchemy and psycopg2. Otherwise, each column would have to be created individually inside the PGadmin software. So, I read the CSV into a dataframe using pandas which would be used for some simple inital data cleaning as well as exploration before exporting into an SQL server.

For the purpose of the case study analysis, null values were not much of an issue as they didn't occur in the most imporant columns. I simply removed the one null value in the gender_num column for the data visualization later on. 

Then, wrote the dataframe to the PostgreSQL server for further analysis. Used SQL to create a new column in a new table that assigned each patient to one of five age groups (age_group). 

### Analysis

#### Binary Logistic Regression 
Using scikit-learn, employed binary logistic regression on the main response variable (day_28_flg). For this section, created a new dataframe in pandas with no null values in any columns. Used train_test_split to test model on the same dataset. In further studies with patients following the same criteria for inclusion, this same model could be used to attempt to classify/predict mortality rates.

The model seemed to be highly accurate on the test data which does not necessarily imply correctness. Since all data came from one dataset, there may be overfitting which would need further data for validation. Also, only 1064 total patients were included in this section of analysis.

#### Data Visualization
![image](https://github.com/user-attachments/assets/5c2aa9c5-0d64-49c2-b8f3-cddd2d85437e)

![image](https://github.com/user-attachments/assets/38a1428c-8e5e-42ee-a76d-e9556716b928)

Now, attempted to show important data in a more digestible format visually. However, noticed that the lack of dates or a timeline in data made it hard to properly show how mortality was over time.

### Conclusion
For this case study, there does not seem to be enough evidence for a significant change in mortality rate for whether patients used IAC or not. In order to validate this judgment, more data and in-depth analysis is needed.

### References
- Raffa, J. (2016). Clinical data from the MIMIC-II database for a case study on indwelling arterial catheters (version 1.0). PhysioNet. https://doi.org/10.13026/C2NC7F.
