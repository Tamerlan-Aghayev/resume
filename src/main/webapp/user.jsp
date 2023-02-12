<%-- 
    Document   : user
    Created on : Feb 8, 2023, 9:27:47 PM
    Author     : HP
--%>

<%@page import="entity.User"%>
<%@page import="dao.impl.UserDaoImpl"%>
<%@page import="dao.inter.UserDaoInter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
         <%
             UserDaoInter userDao=new UserDaoImpl();
             
             if(request.getParameter("save")!=null &&request.getParameter("save").equals("Save")){
                     int id=Integer.valueOf(request.getParameter("id"));
        String name=request.getParameter("name");
        String surname=request.getParameter("surname");
        User u=userDao.getById(id);
        u.setName(name);
        u.setSurname(surname);
        userDao.updateUser(u);
             }

             User u=userDao.getById(1);
         %>
         <div>
         <form action="UserController" method="POST">
             <input type="hidden" name="id" value="<%=u.getId()%>"/>
        <label for="name">
            name:
        </label >
        <input type="text" name="name" value="<%=u.getName()%>"/>
        </br>
        <label for="surname">
            Surname:
        </label>
        <input type="text" name="surname" value="<%=u.getSurname()%>"/>
        </br>
        <input type="submit" name="save" value="Save"/>
        
    
    </form>
         </div>
    </body>
</html>
