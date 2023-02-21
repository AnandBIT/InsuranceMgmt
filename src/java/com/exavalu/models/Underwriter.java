/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.VerificationService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author kumar
 */
public class Underwriter extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

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

    public String doGetClaimInfo() throws Exception {
        String result = "SUCCESS";
        sessionMap.put("fnolId", this.getFnolId());
        return result;
    }

    public String doUpdateFnolStatus() throws Exception {
        String result = "REJECTED";
        boolean success = VerificationService.updateFnolStatus(this.getFnolId(), this.getStatus());
        if (success) {
            System.out.println("Returning Success from doUpdateFnolStatus method");
            if (Integer.parseInt(this.getStatus()) == 2) {
                result = "APPROVED";
            } else if (Integer.parseInt(this.getStatus()) == 4) {
                result = "REJECTED";
            }
        } else {
            System.out.println("Returning Failure from doUpdateFnolStatus method");
        }

        return result;
    }

    private String fnolId;
    private String status;

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
