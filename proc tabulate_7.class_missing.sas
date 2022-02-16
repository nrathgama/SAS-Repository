/*Identifying Missing Values for Class Variables

You can identify missing values for class variables with the MISSING option. By default,
if an observation contains a missing value for any class variable, that observation is
excluded from all tables.

The MISSING option creates a separate category in the summary table for missing values.
It can be used with the PROC TABULATE statement or the CLASS statement. */

proc import datafile = "/home/u60914068/score_data_miss_tab"
DBMS = xlsx out = scoredata0 replace ;
run;

LIBNAME score "/home/u60914068";
libname myfmts "/home/u60914068/formats" ;
options fmtsearch=(myfmts);
PROC FORMAT library = myfmts;
   VALUE $genderf 	'm' = 'Male'
                	'f' = 'Female';
   VALUE asgroup    0-<60 = 'F'
   					60-<70 = 'D'
   					70-<80 = 'C'
   					80-<90 = 'B'
   					90-High = 'A'
   					Other = 'Missing';
run;
data score.scoredata2;
set scoredata0;
   label name = 'Student Name'
   		 Score1 = 'Math Score'
         Score2 = 'Science Score'
         Score3 = 'English Score';
    TotalScore = sum (score1, score2, score3);
	AverageScore = mean (score1, score2, score3);
	Grade = AverageScore;
	FORMAT gender $genderf. Grade asgroup.;
run;

/*If you specify the MISSING option in the PROC TABULATE statement, the procedure considers
missing values as valid levels for all class variables*/

Proc tabulate data =score.scoredata2 missing;
class Class GENDER ;
var AverageScore;
table class*gender, AverageScore*mean;
run;

Proc tabulate data =score.scoredata2 ;
class Class GENDER ;
var AverageScore;
table class*gender, AverageScore*mean;
run;

/*If you specify the MISSING option in a CLASS statement, PROC TABULATE considers missing values
as valid levels for the class variable(s) that are specified in that CLASS statement*/

Proc tabulate data =score.scoredata2;
class Class / missing;
class GENDER ;
var AverageScore;
table class*gender, AverageScore*mean;
run;

Proc tabulate data =score.scoredata2 ;
class Class;
class GENDER ;
var AverageScore;
table class*gender, AverageScore*mean;
run;
