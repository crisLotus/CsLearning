PROC EXPORT DATA= WORK.T 
            OUTFILE= "E:\sas\sasProgFile\c2\data\export.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;
