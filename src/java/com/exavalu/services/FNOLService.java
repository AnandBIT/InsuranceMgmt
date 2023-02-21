/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.FNOL;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.log4j.Logger;

/**
 *
 * @author kumar
 */
public class FNOLService {

    private static final Logger logger = Logger.getLogger(FNOLService.class);

    public static boolean doLogFnol(FNOL fnol) {
        boolean result = false;

        try {
            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "INSERT INTO fnol (email,policyNumber,description,vehicleNumber) VALUES (? ,? ,?,? )";
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, fnol.getEmail());
            preparedStatement.setString(2, fnol.getPolicyNumber());
            preparedStatement.setString(3, fnol.getDescription());
            preparedStatement.setString(4, fnol.getVehicleNumber());

            System.out.println("sql:" + preparedStatement);

            int row = preparedStatement.executeUpdate();
            if (row == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            logger.error(ex.getMessage());
        }
        return result;

    }

    public static ArrayList getAllFnols() {
        ArrayList fnolList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "SELECT * from fnol f, status s WHERE f.status=s.status";
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                FNOL fnolData = new FNOL();
                fnolData.setFnolId(rs.getString("fnolId"));
                fnolData.setEmail(rs.getString("email"));
                fnolData.setDescription(rs.getString("description"));
                fnolData.setPolicyNumber(rs.getString("policyNumber"));
                fnolData.setVehicleNumber(rs.getString("vehicleNumber"));
                fnolData.setStatus(rs.getString("status"));
                fnolData.setStatusInfo(rs.getString("statusInfo"));

                fnolList.add(fnolData);
            }

        } catch (SQLException ex) {
            logger.error(ex.getMessage());
        }
        return fnolList;

    }
}
