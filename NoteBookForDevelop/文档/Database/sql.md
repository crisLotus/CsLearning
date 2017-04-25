# 基本操作
```
CREATE DATABASE DATABASE_NAME;
DROP DATABASE DATABASE_NAME;
CREATE TABLE Employees
(
   id INT NOT NULL,
   age INT NOT NULL,
   first VARCHAR(255),
   last VARCHAR(255),
   PRIMARY KEY ( id )
);
DROP TABLE table_name;
INSERT INTO Employees(...) VALUES(100,18,'Zara','Ali');
SELECT column_name, column_name, ...
     FROM table_name
     WHERE conditions;WHERE 子句可以使用 =, !=, <, >, <=, >=, BETWEEN 和 LIKE 这些比较操作符
UPDATE Employees SET age=20 WHERE id=100;
DELETE FROM table_name WHERE conditions;
```

# 查询
select colname[, colname2] from tablename where colname == 'value' [and ...]
```
select username from users; # 有重复数据
select distinct username from users; # 去除重复数据

```
## where 
## group by having  order by
group by 分组数据
having 过滤数据
order by 排序 asc desc 升序 降序
## 根据表达式排序
