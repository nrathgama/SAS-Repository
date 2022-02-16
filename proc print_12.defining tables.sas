/*Defining Labels
You can add your own labels to a summary table or remove headings from a summary table
by assigning labels to variables in the TABLE statement.
Simply follow the variable with an equal sign (=) followed by either the desired label
or by a blank space in quotation marks.
A blank space in quotation marks removes the heading from the summary table. */

LIBNAME score "/home/u60914068";
libname myfmts "/home/u60914068/formats" ;
options fmtsearch=(myfmts);

Proc tabulate data =score.scoredata1;
class Class GENDER ;
var AverageScore;
table class*gender ALL, AverageScore* (mean*format = 4.1 N Max Min) ;
run; /*for comparision*/

Proc tabulate data =score.scoredata1;
class Class GENDER ;
var AverageScore;
table class = 'student class' *gender ALL = 'Summary',

AverageScore = 'Score information' *
(mean = 'Average Score' *format = 4.1
 N = 'Num of Students'
Max = 'Maxim of Student Average Score' *format = 4.1
Min = 'Minum of Student Average Score' *format = 4.1) ;
run;
