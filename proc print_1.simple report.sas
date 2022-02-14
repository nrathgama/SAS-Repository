/*create simple reports with proc Print*/

proc import datafile = "/home/u60914068/score_data_id_class"
DBMS = xlsx out = scoredata0 replace ;
run;

proc print data = scoredata0;
run;

/*Labeling the Observation Column*/
proc print data = scoredata0 obs ='Observation Number';
run;

/*Suppressing the Observation Column*/
proc print data = scoredata0 noobs;
run;

/*emphasize a key variable with ID statement:
To emphasize a key variable in a data set, you can use the ID statement in the PROC PRINT step.
Because the ID statement automatically suppresses the observation numbers,
the NOOBS option is not needed in the PROC PRINT statement.*/
proc print data = scoredata0;
ID name;
run;/*the report emphasizes the student name*/

/*sort ID var*/
proc sort data = scoredata0;/*If you do not specify an output data set, then PROC SORT permanently
changes the order of the observations in the input data set.*/
by name;
run;
proc print data = scoredata0;
ID name;
run;

/*Report the Selected Variables in order with VAR statement:
If the var appearing in the ID statement is also included in the VAR statement,
the information is duplicated and two columns for the same variable appear in the report.*/
proc print data = scoredata0;
var stu_id gender class;
ID name;
run;

/*Selecting Observations with WHERE statement:*/
proc print data = scoredata0;
var name stu_id gender class;
ID name;
where gender = 'm' and class in ('a', 'c');
run;
