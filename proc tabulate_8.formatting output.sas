/*Formatting Output
You can override formats in summary table output by crossing variables
with format modifiers. You cross a variable with a format modifier
by putting an asterisk between them. */

LIBNAME score "/home/u60914068";
libname myfmts "/home/u60914068/formats" ;
options fmtsearch=(myfmts);

Proc tabulate data =score.scoredata1;
title 'Mean of Student Average Scores by Class and Gender';
class Class GENDER ;
var AverageScore;
table class*gender, AverageScore*mean*format = 4.1;
/* AverageScore crosses with the statistic mean and
with the format modifier format = 4.1.*/
run;
