PROC IMPORT OUT= WORK.data 
            DATAFILE= "E:\sas\sasProgFile\c2\data\inport.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
