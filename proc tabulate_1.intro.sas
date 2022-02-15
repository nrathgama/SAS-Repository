/*The TABULATE procedure enables you to create a variety of summary tables.

The TABULATE procedure requires three statements, usually in the following order:
**PROC TABULATE statement
**CLASS statements or VAR statements or both
**TABLE statements
Note that there can be multiple CLASS statements, VAR statements, and TABLE statements.

Use the CLASS statement to specify which variables are class variables.
Class variables contain values that are used to form categories.
The default statistic for class variables is N, which is the frequency of nonmissing values.

Use the VAR statement to specify which variables are analysis variables.
Analysis variables contain numeric values for which you want to compute statistics.
The default statistic for analysis variables is SUM.

A TABLE statement consists of one to three dimension expressions, separated by commas.
Dimension expressions define the columns, rows, and pages of a summary table.

You must specify at least one TABLE statement.
Here are three variations of the syntax for a basic TABLE statement:

**TABLE column-expression;
**TABLE row-expression, column-expression;
**TABLE page-expression, row-expression, column-expression;

In this syntax
a column expression is required
a row expression is optional
a page expression is optional
the order of the expressions must be page expression, row expression, and then column expression

Note: Every variable that is used in a dimension expression in a TABLE statement must appear
in either a CLASS statement or a VAR statement, but not both.
Only one dimension of any TABLE statement can contain analysis variables.
*/

LIBNAME score "/home/u60914068";
libname myfmts "/folders/myfolders/formats" ;
options fmtsearch=(myfmts);

Proc tabulate data =score.scoredata1;
title 'a simple table';
class GENDER ;
var averagescore;
table gender, averagescore;
run;
