[jdbc指南](http://wiki.jikexueyuan.com/project/jdbc/)

# JDBC 的 API
* DriverManager 管理数据库驱动程序
* Driver 处理与数据库服务器的通信
* Connection 
* Statement 使用创建于这个接口的对象将 SQL 语句提交到数据库
* ResultSet 保存从数据获得的数据
* SQLException 

# 使用方法
## 注册JDBC驱动程序
方法1 - Class.forName()
```
try {
Class.forName("oracle.jdbc.driver.OracleDriver");
}
catch(ClassNotFoundException ex) {
    System.out.println("Error: unable to load driver class!");
    System.exit(1);
}

或
try {
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
}
catch(ClassNotFoundException ex) {
    System.out.println("Error: unable to load driver class!");
    System.exit(1);
catch(IllegalAccessException ex) {
    System.out.println("Error: access problem while loading!");
    System.exit(2);
catch(InstantiationException ex) {
    System.out.println("Error: unable to instantiate driver!");
    System.exit(3);
}
```
方法2 - DriverManager.registerDriver()：使用的是不兼容 JVM 的非 JDK

## 创建数据库连接

### 数据库URL 
* MySQL   jdbc:mysql://hostname/databaseName
* ORACLE  jdbc:oracle:thin:@hostname:port Number:databaseName
* DB2     jdbc:db2:hostname:portNumber/databaseName
* Sybase  jdbc:sybase:Tds:hostname:portNumber/databaseName

### 创建连接对象

```
DriverManager.getConnection
getConnection(String url)
getConnection(String url, Properties prop)
getConnection(String url, String user, String password)

方法一
import java.util.*;
String URL = "jdbc:oracle:thin:@amrood:1521:EMP";
Properties info = new Properties( );
info.put( "user", "username" );
info.put( "password", "password" );
Connection conn = DriverManager.getConnection(URL, info);

方法二
getConnection(String url, String user, String password)
```

### 关闭数据库
con.close();

## 执行sql语句

### 接口

* [Statement示例教程](http://www.tutorialspoint.com/jdbc/statement-object-example.htm)
* [PreparedStatement]() 
* [CallableStatement]() 

### Statement
```
boolean execute(String SQL)
int executeUpdate(String SQL) 
ResultSet executeQuery(String SQL)

Statement stmt = null;
try {
    stmt = conn.createStatement( );
    . . .
}
catch (SQLException e) {
    . . .
}
finally {
    stmt.close();
    conn.close();
}

```

### PreparedStatement

```
PreparedStatement pstmt = null;
try {
    String SQL = "Update Employees SET age = ? WHERE id = ?";
    pstmt = conn.prepareStatement(SQL);
    pstmt.setInt(1,20);
    pstmt.setInt(2,20);
    . . .
}
catch (SQLException e) {
    . . .
}
finally {
    pstmt.close();
}
```

### CallableStatement
```
CallableStatement cstmt = null;
try {
    String SQL = "{call getEmpName (?, ?)}";
    cstmt = conn.prepareCall (SQL);
    . . .
}
catch (SQLException e) {
    . . .
}
finally {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
```

## 结果集
ResultSet

## 事务
```
try{
    //Assume a valid connection object conn
    conn.setAutoCommit(false);
    Statement stmt = conn.createStatement();

    String SQL = "INSERT INTO Employees " +"VALUES (106, 20, 'Rita', 'Tez')";
    stmt.executeUpdate(SQL);

    //Submit a malformed SQL statement that breaks
    String SQL = "INSERTED IN Employees " +
    "VALUES (107, 22, 'Sita', 'Singh')";
    stmt.executeUpdate(SQL);
    
    // If there is no error.
    conn.commit();
}catch(SQLException se){
    // If there is any error.
    conn.rollback();
}
```

### 使用还原点

```
try{
    //Assume a valid connection object conn
    conn.setAutoCommit(false);
    Statement stmt = conn.createStatement();
    
    //set a Savepoint
    Savepoint savepoint1 = conn.setSavepoint("Savepoint1");
    String SQL = "INSERT INTO Employees " +
    "VALUES (106, 20, 'Rita', 'Tez')";
    stmt.executeUpdate(SQL);
    
    //Submit a malformed SQL statement that breaks
    String SQL = "INSERTED IN Employees " +
    "VALUES (107, 22, 'Sita', 'Tez')";
    stmt.executeUpdate(SQL);
    
    // If there is no error, commit the changes.
    conn.commit();
}catch(SQLException se){
    // If there is any error.
    conn.rollback(savepoint1);
}
```

## 批处理


# 创建数据库
```
public void creatDatabase(String DB_NAME) {
    Connection conn = null;
    Statement stmt = null;
    String DB_NAME = DB_NAME;
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance(); 
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/", "root", "toor"); 
        stmt = conn.createStatement();
        
        String sql = "CREATE DATABASE " + DB_NAME + " default character set utf8 default collate utf8_general_ci;";
        try{
            stmt.executeUpdate(sql);
        } catch(Exception e) {
            String dsql = "Drop Database " + DB_NAME;
            System.out.println("Drop and Create database!");
            stmt.executeUpdate(dsql);
            stmt.executeUpdate(sql);
            System.out.println("Drop and Create database successful");
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally{
        //finally block used to close resources
        try{
            if(stmt!=null)
                stmt.close();
        } catch(SQLException se2) {
            se2.printStackTrace();
        }// nothing we can do
        try{
            if(conn!=null)
                conn.close();
        } catch(SQLException se) {
            se.printStackTrace();
        }//end finally try
    }
}
```

# 验证用户名或密码
如下为完整可运行类，配置好mysql后，修改DBURL,USERNAME,PASSWORD,SQL后可以直接使用
```
import java.sql.*;

public class Test {
    public static void main(String[] args) {
        new Test().signin("root", "toor");
    }
    public void signin(String _username, String _password) {
        String DBURL = "jdbc:mysql://127.0.0.1:3306/mis_exfly";
        String USERNAME = "root";
        String PASSWORD = "toor";
        String SQL = "select * from user WHERE username=? and password=?";
        
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            con = DriverManager.getConnection(DBURL, USERNAME, PASSWORD);
            try {
                pstmt = con.prepareStatement(SQL);
                pstmt.setString(1, _username);
                pstmt.setString(2, _password);
                rs = pstmt.executeQuery();
                if(!rs.next()) {
                    //验证失败
                    System.out.println(_username+" "+_password+" "+"F");
                }else {
                    //验证成功
                    System.out.println(_username+" "+_password+" "+"T");
                }
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally{
            //finally block used to close resources
            try{
                if(pstmt!=null)
                    pstmt.close();
            } catch(SQLException se2) {
                se2.printStackTrace();
            }// nothing we can do
            try{
                if(con!=null)
                    con.close();
            } catch(SQLException se) {
                se.printStackTrace();
            }//end finally try
        }
    }
}

```