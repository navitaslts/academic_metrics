
# 2019 - L&T Report - Academic Metrics
We need provide 4 academic metrics for each trimester of 2018 and 2019.

## 1. Retention Rate

To calculate the retention rate we need 3 different indicators for each trimester.
Note: Calculate 17T3 (September 2017) is required to calculte 18T1 retention rate 

### 1.1 Commencing Students
| Term      | # Commencing Students (A) |
| --------- | -------------------------:| 
| 18T1      | 99                        | 
| 18T2      | 99                        |
| 18T3      | 99                        |

(A): Total headcount of newly registered students

> What is the SQL?

### 1.2 Graduands Students
| Term      | # Graduands Students (A) |
| --------- | ------------------------:| 
| 18T1      | 99                       | 
| 18T2      | 99                       |
| 18T3      | 99                       |

(A): Total headcount of graduands.

> What is the SQL?

### 1.3 Registered Students
| Term      | # Registered Students (A) |
| --------- | -------------------------:| 
| 18T1      | 999                       | 
| 18T2      | 999                       |
| 18T3      | 999                       |

(A): Total headcount of registered students

> What is the SQL?

### 2. Pass Rate

From 2018 to 2019.

| Term      | StudentID     | Program  | Course/Class | Passed/Failed  (A) |
| --------- |:-------------:| --------:| ------------ | ------------------ |
| 18T1      | S1            | ProgramA | Class10      | 1                  |
| 18T1      | S1            | ProgramA | Class11      | 0                  |
| 18T1      | S1            | ProgramA | Class12      | 1                  |

(A) Passed/Failed:
- 1 => Passed
- 0 => Failed

> What is the SQL?


## 3. Completion Index

Filter:
- From 2018 to 2019
- Only Students who graduated/completed the program

| Term (A)  | StudentID     | Program  | # TP Taken (B) | Min TP Program Required (C) |
| --------- | ------------- |:-------- |:--------------:|:---------------------------:|
| 18T1      | S1            | ProgramA | 6              | 6                           |
| 18T1      | S2            | ProgramA | 8              | 6                           |
| 18T1      | S3            | ProgramB | 12             | 8                           |

(A): Last Term the Student took to complete the program.

(B): Number of teaching periods the student has taken to complete the program.

(C): the minimum duration of the program in teaching periods.

> What is the SQL?

## 4. PER - Performance Efficiency Ratio 

Filter:
- Students Enrolled in From 2018 to 2019

| Term      | StudentID     | Program  | Student Load | Max Student Load Possible |
| --------- |:-------------:| --------:| ------------ | ------------------------- |
| 18T1      | S1            | ProgramA | 0.2          | 0.8                       |
| 18T1      | S2            | ProgramA | 0.4          | 0.8                       |
| 18T1      | S3            | ProgramB | 0.8          | 0.8                       |

> What is the SQL?
