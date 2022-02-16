/*Using Denominator Definitions to calculate Percentages

The default percentage statistics enable you to obtain basic calculations, but they might not give you the percentage
that you actually need. For example, you want a percentage that reflects a subtotal in the table. In this case, PROC
TABULATE gives you the ability to build your own denominator definition.

The denominator definition uses PCTN or PCTSUM as a starting point. Then, in angle brackets (<>) after the statistic
name, you specify an expression that tells PROC TABULATE which values should be used to calculate the
denominator for the percentage that you request. */

proc import datafile = "/home/u60914068/FunRun"
DBMS = xlsx out = FR0 replace ;
run;

/*the basic structure of the table:
table class all = 'All Class',
		gender all = 'All Student';

The table is a concatenation of four subtables. In this report, each subtable is a crossing of
one class variable in the row dimension and one class variable in the column dimension.
Class Variables Contributing to the Subtables:
Class and Gender
All and Gender
Class and All
All and All

The part of the TABLE statement that defines the rows of the table uses the PCTN statistic
to calculate three different percentages:
the total female and male students in each class (row percentage)
the total for that gender in all classes (column percentage)
the total for all students*/
Proc tabulate data =FR0;
class GENDER class;
table (class all = 'All Class') * (N ='Number of Students'
				pctn<gender all>='Percent of row total'
              	pctn<class all>='Percent of column total'
              	pctn='Percent of total'), /*If you do not specify a denominator definition,
then PROC TABULATE obtains the denominator for a cell by totaling all the frequency counts in the subtable.*/
		gender all='All Student'/rts = 20;
title1 'Gender Distribution within Classes';
title3 '% of row total = 6/10 * 100 = 60.00%';
title4 '% of column total = 6/17 * 100 = 35.29%';
title5 '% of total = 6/39 * 100 = 15.38%';
run;
