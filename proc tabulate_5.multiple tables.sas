/*Producing Multiple Tables in a Single PROC TABULATE Step
You can produce multiple tables in a single PROC TABULATE step.
However, you cannot change how a variable is used or defined in the middle of the step.
In other words, the variables in the CLASS or VAR statements are defined only once for all TABLE statements
in the PROC TABULATE step.
If you need to change how a variable is used or defined
for different TABLE statements, then you must place the TABLE statements, and define the variables,
in multiple PROC TABULATE steps. */

lIBNAME score "/home/u60914068";
libname myfmts "/folders/myfolders/formats" ;
options fmtsearch=(myfmts);

Proc tabulate data =score.scoredata1;
title 'multiple tables in one Proc tabulate';
class class GENDER ; /*categorical data*/
var score1 score2 score3; /*score variables are analysis variables*/
table class, score1*mean;
table gender, score2*mean;
table class, gender, score3*mean;
run;
