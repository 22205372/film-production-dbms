package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection connect() {
        try {
            String url = "jdbc:postgresql://aws-1-ap-south-1.pooler.supabase.com:6543/postgres?sslmode=require";
            String user = "postgres.ayvzpyxxniunbbysthej";
            String password = "DBMSITEC344";

            Connection conn = DriverManager.getConnection(url, user, password);

            System.out.println("Connected to Supabase!");
            return conn;

        } catch (Exception e) {
            System.out.println("Connection Failed!");
            e.printStackTrace();
            return null;
        }
    }
}