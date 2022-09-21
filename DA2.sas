DATA outdata;
SET SASHELP.birthwgt;
proc print data=outdata(obs=10);

proc univariate data=outdata;
var AgeGroup;
histogram;

proc sgplot data=outdata;
vbar Race;
run;

proc freq data=outdata order=data;
   tables Drinking*Smoking / chisq;
run;

ods graphics on;
proc freq data=outdata;
   tables Race*Smoking /
          chisq cmh plots(only)=freqplot;
run;
ods graphics off;