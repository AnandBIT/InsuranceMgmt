/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.AuthService;
import com.exavalu.services.FNOLService;
import com.exavalu.services.UserService;
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
public class User extends ActionSupport implements SessionAware, Serializable {

    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String roleId;
    private String roleName;

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    public String doSignUp() throws Exception {
        String result = "FAILURE";

        boolean success = AuthService.getInstance().doSignUp(this);

        if (success) {
            System.out.println("Returning Success from doSignUp method");
            result = "SUCCESS";
        } else {
            System.out.println("Returning Failure from doSignUp method");
        }

        return result;
    }

    public String doLogin() throws Exception {
        String result = "FAILURE";

        boolean success = AuthService.getInstance().doLogin(this);

        if (success) {
            System.out.println("Returning Success from doLogin method");
            User user = UserService.getUser(this.getEmail());
            ArrayList fnolList = FNOLService.getAllFnols();
            sessionMap.put("fnolList", fnolList);
            sessionMap.put("user", user);
            result = "SUCCESS";
        } else {
            System.out.println("Returning Failure from doLogin method");
        }

        return result;
    }

    public String doLogOut() throws Exception {
        String result = "SUCCESS";

        sessionMap.clear();

        return result;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

}
