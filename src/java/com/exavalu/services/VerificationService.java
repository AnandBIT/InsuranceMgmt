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
import org.apache.log4j.Logger;

/**
 *
 * @author kumar
 */
public class VerificationService {

    public static VerificationService verificationService = null;
    private static final Logger logger = Logger.getLogger(VerificationService.class);

    public static VerificationService getInstance() {
        if (verificationService == null) {
            return new VerificationService();
        } else {
            return verificationService;
        }
    }

    public static boolean updateFnolStatus(String fnolId, String status) {
        boolean result = false;
        try {

            Connection con = JDBCConnectionManager.getMySQLConnection();

            String sql = "UPDATE fnol SET status = ? WHERE (fnolId = ?);";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, status);
            preparedStatement.setString(2, fnolId);

            int row = preparedStatement.executeUpdate();
            if (row == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            logger.error(ex.getMessage());
        }

        return result;
    }

}
