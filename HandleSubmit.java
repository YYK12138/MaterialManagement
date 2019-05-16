package myservlet.control;
import mybean.data.submit;
import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class HandleSubmit extends HttpServlet {
   public void init(ServletConfig config) throws ServletException { 
      super.init(config);
      try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   }
   public String handleString(String s)
   {  
   try{ byte bb[]=s.getBytes("gb2312");
            s=new String(bb);
       }
       catch(Exception ee){} 
       return s;  
   }
   public  void  doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
      Connection con; 
      Statement sql; 
	  PreparedStatement sql1;
	  submit userBean =new submit();                  //创建的Javabean模型
      request.setAttribute("userBean",userBean);
      String ANo=request.getParameter("ANo").trim();
      String RepairUser=request.getParameter("RepairUser").trim();
      String RepairTime=request.getParameter("RepairTime").trim();
	  String ReturnTime=request.getParameter("ReturnTime").trim();
	  String uri="jdbc:mysql://localhost:3306/materialmanagement?"+"user=root&password=&characterEncoding=gb2312";
	  boolean m=false,ml=true;
	  String backNews="3232323232";
	  if((ReturnTime.length()==0)||(ReturnTime.length()==8)){ m = true;}
	  System.out.println("1");
	  boolean boo=(ANo.length()>0)&&(RepairUser.length()>0)&&(RepairTime.length()==8)&&m&&ml;
	   System.out.println(boo);
      try{
		  con=DriverManager.getConnection(uri);
		  String condition="SELECT * FROM `user` WHERE `user`.ID='"+RepairUser+"'";         //查询
		  System.out.println(condition);                                                    //检查语句，可以正常运行到此
		  sql=con.createStatement();
		  ResultSet rs=sql.executeQuery(condition);
		  ml =rs.next();
		  String insertCondition="INSERT INTO repairlist(ANo,RepairUser,RepairTime,ReturnTime) VALUES(?,?,?,?)";                   //???????
		  System.out.println(condition);
		  sql1=con.prepareStatement(insertCondition);      
              System.out.println(insertCondition);		  //插入
		  if(boo){
			  sql1.setString(1,handleString(ANo));
			  sql1.setString(2,handleString(RepairUser));
			  sql1.setString(3,handleString(RepairTime));
			  sql1.setString(4,handleString(ReturnTime));
			  int n=sql1.executeUpdate();
			  if(n!=0){
				  backNews="提交成功";
				  userBean.setBackNews(backNews);
				  userBean.setANo(ANo);
				  userBean.setRepairUser(RepairUser);
				  userBean.setRepairTime(RepairTime);
				  }
				  System.out.println("ssss111");
		   }
		   else{
			   System.out.println("ssss---------------");
			   backNews="信息填写不完整或填写错误";
			   userBean.setBackNews(backNews);
		   }
		   con.close();
	}  
	catch(Exception exp){
		System.out.println("ssss222");
		backNews="该记录已被输入，请检查您的填写内容"+exp;
		userBean.setBackNews(backNews);
	}  
    System.out.println(backNews);
	RequestDispatcher dispatcher=request.getRequestDispatcher("submit.jsp");
	dispatcher.forward(request,response);
    }
	public  void  doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
      doPost(request,response);
   }
}
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  