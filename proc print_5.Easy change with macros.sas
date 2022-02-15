/*Making Your Reports Easy to Change using SAS Macro
The macro facility enables you to create macro variables to substitute text in SAS programs.
One of the major advantages of using macro variables is that it enables you to change
the value of a variable in one place in your program and then have the change appear in multiple
references throughout your program.

For detailed infromation on SAS Macro, Please refer to the section of 'SAS Macro Introduction' in
my course 'SAS programming for beginners' */

proc import datafile = "/home/u60914068/FunRun_data_id_class"
DBMS = xlsx out = FR0 replace ;
run;
proc sort data = fr0;
by class;
run;

%let data = fr0; /*use and refer user-defined macro var in programs to easily change program*/

proc print data = &data noobs label split='/'
sumlabel="Total Fund Raised" grandtotal_label="Grand Total Fund Raised";
var name stu_id gender /*class*/ fund;
sum fund;
by class;
id class;
label 	class = 'student / class'
		stu_id = 'student id'
		name = 'student / name'
		gender = 'student / gender'
		fund = 'fund / raised';
title1 '4th Grade Fund Raised by Class';
title2 "Produced on &SYSDATE9"; /*use automatic macro var to provide date on which the currrent SAS session started*/
footnote1 'CCS Fun Run';
footnote2 'SCHOOL CONFIDENTIAL INFORMATION';
run;
