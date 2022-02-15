/*Creating a Basic Three-Dimensional Summary Table
Three-dimensional summary tables produce the output on separate pages with rows and columns on each page. */

lIBNAME score "/home/u60914068";
libname myfmts "/folders/myfolders/formats" ;
options fmtsearch=(myfmts);

Proc tabulate data =score.scoredata1;
title 'three-Dimensional table: Math score average by gender groups for each class';
class class GENDER ;
var score1;
table class, gender, score1*mean;
run;

/*page dimension: A page is created for each value or category of Class.
row dimension: A row is created for each value or category of Gender.
column dimension: The mean statistic is used to summarize the values of analysis variables Score1.*/
