/*Creating a Basic Two-Dimensional Summary Table
The most commonly used form of a summary table has at least one column and multiple rows,
and is called a two-dimensional summary table. */

LIBNAME score "/home/u60914068";
libname myfmts "/folders/myfolders/formats" ;
options fmtsearch=(myfmts);

Proc tabulate data =score.scoredata1;
title 'Two-Dimensional table: Math score average for diff gender groups';
class GENDER ;
var score1; /*defal=ult is sum, score1 has to be assigned to mean*/
table gender, score1*mean; /*You can request descriptive statistics for a variable
by crossing that variable with the appropriate statistic keyword;
also score1*mean here is used to summerize rthe values of score1, this analysis variable*/
run;

/*row dimension: A row is created for each value or category of Gender.
column dimention: The mean statistic is used to summarize the values of analysis variables Score1.*/
