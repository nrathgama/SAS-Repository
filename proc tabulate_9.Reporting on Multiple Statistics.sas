/*Reporting on Multiple Statistics
You can create summary tables that report on two or more statistics by concatenating variables.

concatenating places the output of the second and subsequent elements immediately after the
output of the first element.
You concatenate elements in a dimension expression by putting a blank space between them.*/

LIBNAME score "/home/u60914068";
libname myfmts "/home/u60914068/formats" ;
options fmtsearch=(myfmts);

Proc tabulate data =score.scoredata1;
title 'Mean of Student Average Scores by Class and Gender + how many students in each group';
class Class GENDER ;
var AverageScore;
table class*gender, AverageScore*mean*format = 4.1 AverageScore*N ; /*N= NONmissing_value this will
give # of students*/
run;

/*In this program, because the expressions AverageScore*mean*format = 4.1 and AverageScore*N
 in the column dimension are separated by a blank space, their output is concatenated.*/
