/*Creating Enhanced Reports
using additional statements and options that enhance the reports*/
proc import datafile = "/home/u60914068/FunRun_data_id_class"
DBMS = xlsx out = FR0 replace ;
run;

/*Add the SUM statement to compute subtotals and totals for the numeric variables;
Specify formats for variables by adding the FORMAT statement*/
proc print data = FR0 noobs; /*noobs-to eliminate observation number column*/
var name stu_id gender class fund;
sum fund; /*compute totals and sub-total values for the numeric variable*/
format fund dollar5.1; /*display the values for the format variable*/
run;

/*Computing Group Subtotals*/
/*before the proc print prcedure the data has to be sorted hence the proc sort data stmt*/
proc sort data = fr0;
by class;
run;
proc print data = FR0 noobs;
var name stu_id gender class fund;
sum fund;
by class;/*class variable in by stmt proc print procedure will give report by group;
this gives 4 tables*/
run;

/*Labeling Subtotals and the Grand Total
The previous example uses the default labels for the subtotal and the grand total labels.
The subtotal default label is the BY variable, and the grand total default label is no label.
You can use the SUMLABEL= option to replace the default subtotal label
and the GRANDTOTAL_LABEL= option to replace a blank grand total label.*/
proc print data = FR0 noobs sumlabel="Total Fund Raised" grandtotal_label="Grand Total Fund Raised";
title 'Fund Raised by Class';
var name stu_id gender class fund;
sum fund;
by class;
run;

/*Identifying Group Subtotals
You can use both the BY and ID statements in the PROC PRINT step to modify the appearance of your report.
When you specify the same variables in both the BY and ID statements,
the PRINT procedure uses the ID variable to identify the start of the BY group.*/
proc print data = FR0 noobs sumlabel="Total Fund Raised" grandtotal_label="Grand Total Fund Raised";
title 'Fund Raised by Class with diff appearance';
var name stu_id gender class fund;
sum fund;
by class;
id class;
run;
/*Creating Enhanced Reports:: 
continue...*/
proc import datafile = "/home/u60914068/FunRun_data_id_class" 
DBMS = xlsx out = FR0 replace ;
run;

/*Computing Multiple Group Subtotals
You can also use two or more variables in a BY statement to define groups and subgroups. 
The following program produces a report that groups observations first by class and then by gender:*/
proc sort data = fr0;
by class gender;
run;
proc print data = FR0 noobs sumlabel="Total Fund Raised" grandtotal_label="Grand Total Fund Raised";
title 'Fund Raised by Class and gender';
var name stu_id gender class fund;
sum fund;
by class gender;
id class gender;
run; /*totals are generatedbased based on both Class and Gender*/

/*When you use multiple BY variables as in the previous example, 
you can use the SUMBY statement to control which BY variable causes subtotals to appear.
You can specify only one SUMBY variable, and this variable must also be specified in the BY statement. 
PROC PRINT computes sums when a change occurs to the following values:
**the value of the SUMBY variable
**the value of any variable in the BY statement that is specified before the SUMBY variable*/
proc print data = FR0 noobs sumlabel="Total Fund Raised" grandtotal_label="Grand Total Fund Raised";
title 'Fund Raised by Class and gender + sumby class';
var name stu_id gender class fund;
sum fund;
by class gender;
id class gender;
sumby class;
run;

