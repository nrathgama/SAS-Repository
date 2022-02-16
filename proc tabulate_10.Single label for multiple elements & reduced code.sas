/*Reducing Code and Applying a Single Label to Multiple Elements
You can use parentheses to group concatenated elements that are concatenated
or crossed with a common element.
This can reduce the amount of code used and can change how labels are displayed.*/

LIBNAME score "/home/u60914068";
libname myfmts "/home/u60914068/formats" ;
options fmtsearch=(myfmts);

Proc tabulate data =score.scoredata1;
class Class GENDER ;
var AverageScore;
table class*gender, AverageScore*mean*format = 4.1 AverageScore*N ;
run; /*for comparision*/

Proc tabulate data =score.scoredata1;
class Class GENDER ;
var AverageScore;
table class*gender, AverageScore* (mean*format = 4.1 N Max Min) ;
run; /*single label 'AverageScore' spans multiple columns*/
