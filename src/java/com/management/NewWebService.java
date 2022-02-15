/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.management;

import com.commondb.Common_DB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Java
 */
@WebService(serviceName = "NewWebService")
public class NewWebService {

    /**
     * This is a sample web service operation
     */
   @WebMethod(operationName = "Register")
    public String Register (@WebParam(name = "id") String id,@WebParam(name = "name") String name,@WebParam(name = "mobile") String mobile,@WebParam(name = "emailid") String emailid,@WebParam(name = "age") String age,@WebParam(name = "item") String item,@WebParam(name = "item1") String item1,@WebParam(name = "location") String location,@WebParam(name = "date") String date) {
    
   try{
           Common_DB cd=new Common_DB();
           int rs=Common_DB.InsertTable("hospital","INSERT INTO pregister(id,name,mobile,emailid,age,bgroup,gender,location,date)values('"+id+"','"+name+"','"+mobile+"','"+emailid+"','"+age+"','"+item+"','"+item1+"','"+location+"','"+date+"')");
       if(rs>0){
           return "success";
       }
       else
       {
       return "username is already exist";
       }
    }
       catch(Exception ex){
         Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE,null,ex);
         return "server temporarilt not avilable";
       }
    }
    
    @WebMethod(operationName = "submit")
    public String submit(@WebParam(name = "pid") String pid) {
         try {
//           Common_DB cd=new Common_DB();
//            ResultSet rs=Common_DB.LoginCheck("psjav09", "tracking","username","password", username, password);
            String qur="select id from pregister where'"+pid+"'";
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","password");
            Statement st=c.createStatement();
            ResultSet rs=st.executeQuery(qur);
            if(rs.next()) {
            return "success";
            }
            else {
                return "Invalid id";
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
            return "server temporarily not available";
        }       
    } 
    
    @WebMethod(operationName = "Health")
    public String Health (@WebParam(name = "condition") String condition,@WebParam(name = "time") String time,@WebParam(name = "info") String info,@WebParam(name = "pid") String pid) {
    
   try{
//           Common_DB cd=new Common_DB();
//           int rs1=cd.InsertTable("hospital","INSERT INTO healthproblem(condition,startedtiming,information,patientid) VALUES ('"+condition+"','"+time+"','"+info+"','"+pid+"')");
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","password");
            PreparedStatement ps=c.prepareStatement("insert into healthproblem values(?,?,?,?)");
            ps.setString(1, condition);
            ps.setString(2, time);
            ps.setString(3, info);
            ps.setString(4, pid);
            ps.executeUpdate();
//       if(rs1>0){
//           return "success";
//       }
//       else
//       {
//       return "username is already exist";
//       }
    }
       catch(Exception ex){
         Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE,null,ex);
         return "server temporarily not avilable";
       }
       return "success";
    }
    
    @WebMethod(operationName = "report")
    public String report(@WebParam(name = "pid") String pid) {
        StringBuilder sb = new StringBuilder();
         try {
             String file;
             
//           Common_DB cd=new Common_DB();
//            ResultSet rs=Common_DB.LoginCheck("psjav09", "tracking","username","password", username, password);
            String qur="SELECT * FROM filenames WHERE patientid='"+pid+"'";
             System.out.println(qur);
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","password");
            Statement st=c.createStatement();
            ResultSet rs=st.executeQuery(qur);
           while(rs.next()) {
               sb.append(rs.getString("filename"));
               sb.append("@");
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
            return "server temporarily not available";
        }  
       return sb.toString();
       
        
       
    }
    @WebMethod(operationName = "Donar")
    public String Donar (@WebParam(name = "username") String username,@WebParam(name = "password") String password,@WebParam(name = "mobile") String mobile,@WebParam(name = "location") String location,@WebParam(name = "place") String place,@WebParam(name = "item") String item,@WebParam(name = "item1") String item1) {
    
   try{
           Common_DB cd=new Common_DB();
           int rs=Common_DB.InsertTable("hospital","INSERT INTO donarlist(username,password,mobile,location,place,bgroup,gender)values('"+username+"','"+password+"','"+mobile+"','"+location+"','"+place+"','"+item+"','"+item1+"')");
       if(rs>0){
           return "success";
       }
       else
       {
       return "username is already exist";
       }
    }
       catch(Exception ex){
         Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE,null,ex);
         return "server temporarilt not avilable";
       }
    }
    
     @WebMethod(operationName = "Donarlogin")
    public String Donarlogin(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
         try {
           Common_DB cd=new Common_DB();
            ResultSet rs=Common_DB.LoginCheck("hospital", "donarlist","username","password", username, password);
            if(rs.next()) {
            return "success";
            }
            else {
                return "username or password is invalid";
            }
        } catch (Exception ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
            return "server temporarily not available";
        }       
    }  
    @WebMethod(operationName = "Search")
    public String Search(@WebParam(name = "item") String item, @WebParam(name = "location") String location) {
        StringBuilder sb = new StringBuilder();
         try {
           Common_DB cd=new Common_DB();
            ResultSet rs=Common_DB.LoginCheck("hospital", "donarlist","bgroup","location", item, location);
            while(rs.next()) {
            sb.append(rs.getString("username"));
              sb.append("\n");  
              sb.append(rs.getString("mobile"));
              sb.append("\n");
              sb.append(rs.getString("place"));
              sb.append("\n");
              sb.append(rs.getString("gender"));
              sb.append("@");
              
            }
           
        } catch (Exception ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
            return "server temporarily not available";
        } 
         return sb.toString();
    } 
    @WebMethod(operationName = "Request")
    public String Request(@WebParam(name = "hname") String hname, @WebParam(name = "hadd") String hadd,@WebParam(name = "hmob") String hmob,@WebParam(name = "hloca") String hloca) {
       try {
           Common_DB cd=new Common_DB();
            int rs=Common_DB.InsertTable("hospital", "INSERT INTO request(name,address,mobile,location) VALUES('"+hname+"','"+hadd+"','"+hmob+"','"+hloca+"')");
            
            //int r=Common_DB.InsertTable("bloodbank", "INSERT INTO userlogin(userid,password) VALUES('"+userid+"','"+password+"')");
        if(rs>0) {
            return "success";
            }
            else {
                return "username is already exists";
            }
        } catch (Exception ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
            return "server temporarily not available";
        }
        
    }
    
    @WebMethod(operationName = "getDeviceList2")
    public String getDeviceList2(@WebParam(name = "report") String report) {
       StringBuilder sb = new StringBuilder();
       
        try {
           
          ResultSet rs2=Common_DB.ViewTable("hospital", "request");
          while(rs2.next()){
              
              sb.append(rs2.getString("name"));
              sb.append("\n"); 
              sb.append(rs2.getString("address"));
               sb.append("\n"); 
              sb.append(rs2.getString("mobile"));
               sb.append("\n"); 
              sb.append(rs2.getString("location"));
              sb.append("@"); 
          }

               
            
          
        } catch (Exception ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sb.toString();
    }
    
    @WebMethod(operationName = "conditionresult")
    public String conditionresult(@WebParam(name = "pid") String pid) {
        StringBuilder sb = new StringBuilder();
         try {
             String file;
             
//           Common_DB cd=new Common_DB();
//            ResultSet rs=Common_DB.LoginCheck("psjav09", "tracking","username","password", username, password);
            String qur="SELECT * FROM conditionresult WHERE patientid='"+pid+"'";
             System.out.println(qur);
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","password");
            Statement st=c.createStatement();
            ResultSet rs=st.executeQuery(qur);
           while(rs.next()) {
              String tn=rs.getString("tabletname");
              String mr=rs.getString("morning");
              String an=rs.getString("afternoon");
              String ni=rs.getString("night");
              String des=rs.getString("description");
              sb.append("Tablet Name: ").append(tn);
              sb.append("\n"); 
              sb.append("Morning: ").append(mr);
              sb.append("\n"); 
              sb.append("Afternoon: ").append(an);
              sb.append("\n"); 
              sb.append("Night: ").append(ni);
              sb.append("\n"); 
              sb.append("Description: ").append(des);
              sb.append("@"); 
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
            return "server temporarily not available";
        }  
       return sb.toString();
       
        
       
    }
}
