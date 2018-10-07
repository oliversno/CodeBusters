# CodeBusters
A test grader for the Science Olympiad Code Busters Event (2018-2019)

## **Input Format**
The input to the program should be a .tar archive containing a set of tab deliminated .txt files. There should be one Answer Key file and Student Answer Sheet file for each team in the event.

### *Answer Key*
The answer key to the test should be in a tab deliminated .txt file. It should match the following formatting:
```
TOURNAMENT_NAME  Codebusters Answer Key
1     KEY1
2     KEY2
N     KEYN
```
Where EVENT_NAME is the name of the event that is being graded. The phrasing "Codebusters Answer Key" should appear exactly as above to avoid confusion with another test's answer key or a set of student answers, however the program will accept most changes to it. NOTE: the first line of the answer key .txt is one entry, it is seperated by SPACES NOT TABS. N is the number of questions on the test and KEY is the correct answer to each question. A single KEY should be formatted as a series of uppercase characters without punctuation or spacing. The program should correct most formatting errors if it is more convenient to differ in answer formatting (e.g. including spaces for readibility). Each field should be seperated by a singlle TAB character as a tab deliminated file suggests.

### *Student Answer Sheet*
The input to the program of student answers should be in a set of tab deliminated .txt files. Files of this type can be easily generated using Microsoft Excel or other spreadsheet software. Files should match the following formatting:
```
TEAM_NUMBER     TEAM_NAME
1     ANSWER1
2     ANSWER2
N     ANSWERN
```
Where TEAM_NUMBER and TEAM_NAME are the name and number of the team whose score you are entering into the program. N is the number of questions on the test ANSWER is the answer the team submitted for each question. A single ANSWER should be formatted as a series of uppercase characters without punctuation or spacing. The program should correct most formatting errors if it is more convenient to differ in answer formatting (e.g. including spaces for readability). Each field should be seperated by a singlle TAB character as a tab deliminated file suggests.

## **Output Format**
