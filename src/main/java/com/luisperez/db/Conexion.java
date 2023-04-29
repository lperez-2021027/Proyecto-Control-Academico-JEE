package com.luisperez.db;

/**
 *
 * /**
 *
 * @author Luis Carlos Pérez
 * @date 30/08/2022
 * @time 09:33:00 Código técnico: IN5BM
 *
 *
 */

import java.sql.*;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

public class Conexion {

    private static final String HOST = "127.0.0.1"; //local host
    private static final String PORT = "3306";
    private static final String DB = "db_control_estudiante_in5bm";
    private static final String USER = "kinal";
    private static final String PASS = "admin";

    private static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB + "?useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";

    private static BasicDataSource instanceDS;

    public static DataSource getInstanceDS() {
        if (instanceDS == null)
        { // Aplicando patron singleton
            instanceDS = new BasicDataSource();
            instanceDS.setUrl(URL);
            instanceDS.setUsername(USER);
            instanceDS.setPassword(PASS);
            instanceDS.setInitialSize(25); // Indica la cantidad de conecciónes disponibles
        }
        return instanceDS;
    }

    public static Connection getConnection() throws SQLException {
        return getInstanceDS().getConnection();
    }
    
    // Sobrecarga de métodos
    // Método para cerrar un ResultSet
    public static void close(ResultSet rs) {
        try
        {
            rs.close();
        } catch (SQLException e)
        {
            e.printStackTrace(System.out);
        }
    }

    // Método para cerrar un PreparedStatement
    public static void close(PreparedStatement pstmt) {
        try
        {
            pstmt.close();
        } catch (SQLException e)
        {
            e.printStackTrace(System.out);
        }
    }
    
    // Método para cerrar una Connection
    public static void close(Connection con) {
        try
        {
            con.close();
        } catch (SQLException e)
        {
            e.printStackTrace(System.out);
        }
    }
}
