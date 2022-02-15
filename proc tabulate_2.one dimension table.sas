/*Creating a Basic One-Dimensional Summary Table
The simplest summary table contains multiple columns but only a single row.
It is called a one-dimensional summary table because it has only a column dimension.

three variations of the syntax for a basic TABLE statement:

**TABLE column-expression;
**TABLE row-expression, column-expression;
**TABLE page-expression, row-expression, column-expression; */

LIBNAME score "/home/u60914068";
libname myfmts "/folders/myfolders/formats" ;
options fmtsearch=(myfmts);

Proc tabulate data =score.scoredata1;
title 'One-Dimensional table: Number of male and female students';
class GENDER ;
table gender;
run;

/*A column is created for each category of Gender. Each column shows the number of nonmissing values
for that category*/
