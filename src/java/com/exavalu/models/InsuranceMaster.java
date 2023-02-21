/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.VerificationService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author kumar
 */
public class InsuranceMaster extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    public void setSessionMap(SessionMap<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }

    public ApplicationMap getMap() {
        return map;
    }

    public void setMap(ApplicationMap map) {
        this.map = map;
    }

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();
    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    @Override
    public void setApplication(Map<String, Object> application) {
        map = (ApplicationMap) application;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    public String doGetInsuranceDetails() throws Exception {
        String result = "SUCCESS";
        HttpRequest postRequest = HttpRequest.newBuilder().uri(new URI("https://mocki.io/v1/9f8ea85b-4e24-45c2-a97e-a73c839cb96f")).build();

        //creating client object to send request
        HttpClient httpClient = HttpClient.newHttpClient();

        HttpResponse<String> postResponse = httpClient.send(postRequest, HttpResponse.BodyHandlers.ofString());
        //to get body of response
        // System.out.println(postResponse.body());
        String textArea = postResponse.body();
        sessionMap.put("TextArea", textArea);

        Gson gson = new Gson();
        InsuranceMaster policy = gson.fromJson(postResponse.body(), InsuranceMaster.class);
        sessionMap.put("policy", policy);
        return result;
    }

    public String doSanctionClaim() throws Exception {
        String result = "REJECTED";
        boolean success = VerificationService.updateFnolStatus(this.getFnolId(), this.getStatus());
        if (success) {
            System.out.println("Returning Success from doSanctionClaim method");
            if (Integer.parseInt(this.getStatus()) == 3) {
                result = "SANCTIONED";
            } else if (Integer.parseInt(this.getStatus()) == 4) {
                result = "REJECTED";
            }
        } else {
            System.out.println("Returning Failure from doSanctionClaim method");
        }

        return result;
    }

    private String policyNumber;
    private String email;
    private String claimAmount;
    private String vehicleNumber;
    private String validTill;
    private String insuranceType;
    private String fnolId;
    private String status;

    public String getPolicyNumber() {
        return policyNumber;
    }

    public void setPolicyNumber(String policyNumber) {
        this.policyNumber = policyNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getClaimAmount() {
        return claimAmount;
    }

    public void setClaimAmount(String claimAmount) {
        this.claimAmount = claimAmount;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getValidTill() {
        return validTill;
    }

    public void setValidTill(String validTill) {
        this.validTill = validTill;
    }

    public String getInsuranceType() {
        return insuranceType;
    }

    public void setInsuranceType(String insuranceType) {
        this.insuranceType = insuranceType;
    }

    public String getFnolId() {
        return fnolId;
    }

    public void setFnolId(String fnolId) {
        this.fnolId = fnolId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
