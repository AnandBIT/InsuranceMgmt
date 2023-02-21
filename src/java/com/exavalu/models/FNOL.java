/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.FNOLService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author kumar
 */
public class FNOL extends ActionSupport implements SessionAware, Serializable {

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    public String doCreateFNL() throws Exception {
        String result = "FAILURE";

        boolean success = FNOLService.doLogFnol(this);

        if (success) {
            ArrayList fnolList = FNOLService.getAllFnols();
            sessionMap.put("fnolList", fnolList);
            System.out.println("Returning Success from doCreateFNL method");
            result = "SUCCESS";
        } else {
            System.out.println("Returning Failure from doCreateFNL method");
        }

        return result;
    }

    private String fnolId;
    private String email;
    private String policyNumber;
    private String description;
    private String vehicleNumber;
    private String status;
    private String statusInfo;

    public String getFnolId() {
        return fnolId;
    }

    public void setFnolId(String fnolId) {
        this.fnolId = fnolId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPolicyNumber() {
        return policyNumber;
    }

    public void setPolicyNumber(String policyNumber) {
        this.policyNumber = policyNumber;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatusInfo() {
        return statusInfo;
    }

    public void setStatusInfo(String statusInfo) {
        this.statusInfo = statusInfo;
    }

}
