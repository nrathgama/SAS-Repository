/*Getting Summaries for All Variables

You can summarize all of the class variables in a dimension with the universal
class variable ALL.
ALL can be concatenated with each of the three dimensions of the TABLE statement
and within groups of elements delimited by parentheses.*/

LIBNAME score "/home/u60914068";
libname myfmts "/home/u60914068/formats" ;
options fmtsearch=(myfmts);

Proc tabulate data =score.scoredata1;
class Class GENDER ;
var AverageScore;
table class*gender ALL, AverageScore* (mean*format = 4.1 N Max Min) ;
run;
/*the TABLE statement includes the universal class variable ALL in the row
dimensionand a grand summary row (the row labeled All) for all of the class vars
 his data is summarized for all categories of class and gender in the row
 labeled All.*/
