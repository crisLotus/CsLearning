PROC IMPORT OUT= libzhf.class1 
            DATAFILE= "E:\sas\lab\lab1\data.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
