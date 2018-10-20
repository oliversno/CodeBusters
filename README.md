# CodeBusters
A test grader for the Science Olympiad Code Busters Event (2018-2019)

## **Input Format**
The input to the program should be a .tar archive containing a set of tab deliminated .txt files. There should be one Answer Key file and Student Answer Sheet file for each team in the event.

### *Answer Key*
The answer key to the test should be in a tab deliminated .txt file named "KEY.txt". It should match the following formatting:
```
TOURNAMENT_NAME     Codebusters Answer Key
ANS1     PTS1
ANS2     PTS2
ANSN     PTSN
```
Where EVENT_NAME is the name of the event that is being graded. N is the number of questions on the test and ANS is the correct answer to each question. A single ANS should be formatted as a series of uppercase characters without punctuation or spacing, or a number. The program should correct most formatting errors if it is more convenient to differ in answer formatting (e.g. including spaces for readibility). PTS should contain the number of points the question is worth. This field should contain a positive number. Each field should be seperated by a single TAB character as a tab deliminated file suggests.

### *Student Answer Sheet*
The input to the program of student answers should be in a set of tab deliminated .txt files. Each file should be named "TEAMNUM_TEAMNAME.txt". Where the fields are substituted in appropriately. Files of this type can be easily generated using Microsoft Excel or other spreadsheet software. Files should match the following formatting:
```
TEAM_NUMBER     TEAM_NAME
ANSWER1
ANSWER2
ANSWERN
```
Where TEAM_NUMBER and TEAM_NAME are the name and number of the team whose score you are entering into the program. N is the number of questions on the test ANSWER is the answer the team submitted for each question. A single ANSWER should be formatted as a series of uppercase characters without punctuation or spacing. The program should correct most formatting errors if it is more convenient to differ in answer formatting (e.g. including spaces for readability). Each field should be seperated by a single TAB character as a tab deliminated file suggests.

## **Output Format**
The program will output several files. The most important being the Rankings Sheet. For each team there will also be a Student Scored Sheet.

### *Rankings Sheet*
This sheet contains the rankings of teams in decending order as well as the number of points they have. There will be two copies of this sheet, one nicely formatted for human readability, and another in a tab deliminated .txt for importing into Excel. The human readability version will appear as:

Codebusters Rankings - TOURNAMENT_NAME
***
| Rank | Team Name | Team Number | Score |
|------|:---------:|:-----------:|------:|
| 1    |   TEAM    |     NUM     |  XXXX |



The tab deliminated version will be of the form:
```
Rank     Team Name     Team Number     Score
1     TEAM1     NUM1     SCORE1
2     TEAM2     NUM2     SCORE2
N     TEAMN    NUMN     SCOREN
```

### *Student Score Sheet*
The scored sheet will also appear in the two formats similar to the Rankings Sheet above. The human readibility version will appear as:

TEAM_NUM - TEAM_NAME Score Sheet - TOURNAMENT_NAME
***
| Student Answer | Correct Answer | Points |      Diff      |
|:--------------:|:--------------:|-------:|:--------------:|
|   STUDENTANS   |    CORECTANS   |    PTS | STUDENTDIFFANS |


The tab deliminated version will be of the form:
```
Student Answer     Correct Answer     Points     Diff
STUDENTANS1     CORRECTANS1     PTS1     STUDENTDIFFANS1
STUDENTANS2     CORRECTANS2     PTS2     STUDENTDIFFANS2
STUDENTANSN     CORRECTANSN     PTSN     STUDENTDIFFANSN
```
