/*Customize Reports
the PRINT procedure produces simple reports quickly and easily.
With additional statements and options, you can enhance the readability of your reports. */

proc import datafile = "/home/u60914068/FunRun_data_id_class"
DBMS = xlsx out = FR0 replace ;
run;
proc sort data = fr0;
by class;
run;

/*(1) Add descriptive titles and footnotes:
you can use the TITLE statement or the FOOTNOTE statement
to include from 1 to 10 lines of text at the top of the report.
Skipping over some values of n indicates that those lines are blank. */
proc print data = FR0 noobs
sumlabel="Total Fund Raised" grandtotal_label="Grand Total Fund Raised";
var name stu_id gender class fund;
sum fund;
by class;
id class;
title1 '4th Grade';
title3 'Fund Raised by Class';
footnote1 'CCS Fun Run';
footnote2 'SCHOOL CONFIDENTIAL INFORMATION';
run;
/*(2)Define and split labels across multiple lines:
To override the default headings, you need to do the following:
>Add the LABEL option to the PROC PRINT statement.
>Define the labels in the LABEL statement.
You can use the SPLIT= option to control where the labels are separated into multiple lines.*/
proc print data = FR0 noobs label split='/'
sumlabel="Total Fund Raised" grandtotal_label="Grand Total Fund Raised";
var name stu_id gender class fund;
sum fund;
by class;
id class;
label 	class = 'student / class'
		stu_id = 'student id'
		name = 'student / name'
		gender = 'student / gender'
		fund = 'fund / raised';
title1 '4th Grade';
title3 'Fund Raised by Class';
footnote1 'CCS Fun Run';
footnote2 'SCHOOL CONFIDENTIAL INFORMATION';
run;

/*(3) change report style:
Usually you can use ODS to change a report style, you can also use the STYLE= option in the PROC PRINT statement.
The STYLE= option interfaces with ODS to change the report style.
You can change report attributes such as fonts, colors, text alignment, and table cell size.

STYLE <(location(s))>=<style-element-name> <[style-attribute-name=style-attribute-value]>

location(s) identifies the part of the report that the STYLE= option affects.
style-element-name is the name of a style element that is registered with ODS.
A style element is a collection of style attributes that apply to a particular part of the output for a SAS program.
style-attribute-name=style-attribute-value describes the style attribute to change and its value.

For a list of style elements and style attributes, see SAS Output Delivery System: User’s Guide.
style elements
http://support.sas.com/documentation/cdl/en/odsug/61723/HTML/default/viewer.htm#a002685136.htm
style attributes
http://support.sas.com/documentation/cdl/en/odsug/61723/HTML/default/viewer.htm#a002972093.htm
*/

proc print data = FR0 noobs label split='/'
sumlabel="Total Fund Raised" grandtotal_label="Grand Total Fund Raised"

style(header)=headerstrong{backgroundcolor=very light green
color=black}
style(grandtotal)={backgroundcolor=very light blue color=blue};

var name stu_id gender class fund;
sum fund;
by class;
id class;
label 	class = 'student / class'
		stu_id = 'student id'
		name = 'student / name'
		gender = 'student / gender'
		fund = 'fund / raised';
title1 '4th Grade';
title3 'Fund Raised by Class';
footnote1 'CCS Fun Run';
footnote2 'SCHOOL CONFIDENTIAL INFORMATION';
run;
