import java.sql.*;

public class Main {
    // Connect to your database.
    // Replace server name, username, and password with your credentials
    public static void main(String[] args) throws Exception{
        String connectionUrl = "jdbc:sqlserver://DESKTOP-3JQPIBS\\MSSQLSERVER:1433;"
                + "database=JY;"
                + "integratedSecurity=true;";
        Connection connection = DriverManager.getConnection(connectionUrl);
        Statement statement = connection.createStatement();

        // Create and execute a SELECT SQL statement.
        String selectSql = "SELECT * FROM BOOK";
        ResultSet resultSet = statement.executeQuery(selectSql);
        // Print results from select statement
        PrintResultSet.printResultSet(resultSet);

        selectSql = "SELECT * FROM READER";
        resultSet = statement.executeQuery(selectSql);
        PrintResultSet.printResultSet(resultSet);

        selectSql = "SELECT * FROM RECORD";
        resultSet = statement.executeQuery(selectSql);
        PrintResultSet.printResultSet(resultSet);
    }
}

class PrintResultSet{
    public static void printResultSet( ResultSet rs ) throws Exception{
        ResultSetMetaData rsmd = rs.getMetaData();

        int numberOfColumns = rsmd.getColumnCount();

        for (int i = 1; i <= numberOfColumns; i++) {
            if (i > 1) System.out.print("  ");
            String columnName = rsmd.getColumnName(i);
            System.out.print(columnName);
        }
        System.out.println("");

        while (rs.next()) {
            for (int i = 1; i <= numberOfColumns; i++) {
                if (i > 2) System.out.print("  ");
                String columnValue = rs.getString(i);
                System.out.print(columnValue);
            }
            System.out.println("");
        }
        System.out.println("");
    }
}
//https://blog.csdn.net/u010739369/article/details/24140557
//http://www.java2s.com/Code/Java/Database-SQL-JDBC/Outputdatafromtable.htm
//https://docs.microsoft.com/en-us/sql/connect/jdbc/step-3-proof-of-concept-connecting-to-sql-using-java?view=sql-server-ver15
//https://www.jetbrains.com/help/idea/microsoft-sql-server.html