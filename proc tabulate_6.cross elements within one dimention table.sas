/*Creating Hierarchical Tables to Report on Subgroups
You can create a hierarchical table to report on subgroups of your data
by crossing elements within a dimension.

When you cross variables in a single dimension expression, values for
one variable are placed within the values for the other variable in the same dimension.

In the column dimension, variables are stacked top to bottom;
in the row dimension, left to right; and in the page dimension, front to back.
You cross elements in a dimension expression by putting an asterisk between them.

Note that two analysis variables cannot be crossed.
*/


LIBNAME score "/home/u60914068";
libname myfmts "/folders/myfolders/formats" ;
options fmtsearch=(myfmts);

Proc tabulate data =score.scoredata1;
class Class GENDER ;
var AverageScore;
table class*gender, AverageScore*mean;
run;
