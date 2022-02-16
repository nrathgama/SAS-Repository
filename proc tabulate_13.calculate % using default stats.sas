/*Generate Percentages in Reports
USING DEFAULT PERCENTAGE STATISTICS::

The PCTN family:
The percentages that are generated from these statistics are based on the frequency count (N):
for the whole report (REPPCTN )
or on the specific page (PAGEPCTN),
column  (COLPCTN )
or row (ROWPCTN)

The PCTSUM family::
The percentages that are generated from these statistics are based on summarized values
(SUM) :
for the whole report (REPPCTSUM) or
on the specific page (PAGEPCTSUM),
column (COLPCTSUM) ,
or row (ROWPCTSUM).
The PCTSUM family of statistics requires
nesting with a numeric analysis variable. */

proc import datafile = "/home/u60914068/FunRun"
DBMS = xlsx out = FR0 replace ;
run;

/*The REPPCTN and REPPCTSUM statistics
print the percentage of the value in a single table cell
in relation to the total of the values in the report.*/
Proc tabulate data = FR0;
class class GENDER ;
table class all, (gender all)* (N reppctn) / rts = 10;
/*RTS= provides 10 characters per line for row headings*/
title1 'the % of the numbers of student in groups to the total number of students';
title3 'the percentage statistic calculation:reppctn = 6/39*100=15.38%';
run;

Proc tabulate data =FR0;
class class GENDER ;
var fund;
table class all, (gender all)* fund * (sum reppctsum) / rts = 10;
title1 'the % of the totals of fund raised in groups to the total fund raised';
title3 'the percentage statistic calculation:reppctsum = $51.90/$398 = 13.04%';
run;

/*The COLPCTN and COLPCTSUM Statistics
print the percentage of the value in a single table cell in relation to the
total of the values in the column. */

Proc tabulate data =FR0;
class class GENDER ;
table class all, (gender all)* (N colpctn) / rts = 10;
title1 'the % of the numbers of student in groups to the total number of students in Column';
title3 'the percentage statistic calculation:colpctn = 6/17=35.29%';
run;

Proc tabulate data =FR0;
class class GENDER ;
var fund;
table class all, (gender all)* fund * (sum colpctsum) / rts = 10;
title1 'the % of the totals of fund raised in groups to the total fund raised in Column';
title3 'the percentage statistic calculation:colpctsum = $51.90/$131.40=39.50%';
run;

/*The ROWPCTN and ROWPCTSUM Statistics
print the percentage of the value in a single table cell in relation to the
total of the values in the row. */

Proc tabulate data =FR0;
class class GENDER ;
table class all, (gender all)* (N rowpctn) / rts = 10;
title1 'the % of the numbers of student in groups to the total number of students in Row';
title3 'the percentage statistic calculation:rowpctn = 6/10=60.00%';
run;

Proc tabulate data =FR0;
class class GENDER ;
var fund;
table class all, (gender all)* fund * (sum rowpctsum) / rts = 10;
title1 'the % of the totals of fund raised in groups to the total fund raised in Row';
title3 'the percentage statistic calculation:rowpctsum = $51.90/$103.50=50.14%';
run;

/*The PAGEPCTN and PAGEPCTSUM statistics
print the percentage of the value in a single table cell in relation to the
total of the values in the page. */
Proc tabulate data =FR0;
class grade class GENDER ;
table grade, class all, (gender all)* (N PAGEPCTN) / rts = 10;
title1 'the % of the numbers of student in groups to the total number of students in Page(for each grade)';
title3 'the percentage statistic calculation:PAGEPCTN = 6/19=31.58%';
run;

Proc tabulate data =FR0;
class grade class GENDER ;
var fund;
table grade, class all, (gender all)* fund * (sum PAGEPCTSUM) / rts = 10;
title1 'the % of the totals of fund raised in groups to the total fund raised in Page(for each grade)';
title3 'the percentage statistic calculation:PAGEPCTSUM = $51.90/$180.90=28.69%';
run;
