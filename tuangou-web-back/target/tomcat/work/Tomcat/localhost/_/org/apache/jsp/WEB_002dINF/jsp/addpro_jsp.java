/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2019-12-19 03:19:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addpro_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery-3.4.1.min.js\" charset=\"utf-8\"></script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\r\n");
      out.write("\t\tfunction getArea() {\r\n");
      out.write("\t\t\tvar AreaList = $(\"#area\");//获取id=area的html对象，并封装成一个jquery对象\r\n");
      out.write("\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\ttype : 'POST',\r\n");
      out.write("\t\t\t\tdataType : 'json',//预期服务器返回的数据类型\t\t\t\r\n");
      out.write("\t\t\t\turl : 'getarea',//相对路径访问\r\n");
      out.write("\t\t\t\tsuccess : function(responseData, status, xhr) {\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\tAreaList.html(\"\");//把页面上的select清空数据\r\n");
      out.write("\t\t\t\t\tvar str =\"\";//定义存放区域select中的html\r\n");
      out.write("\t\t\t\t\t//responseData是ajax从服务端拿到的区域json\r\n");
      out.write("\t\t\t\t\t$.each(responseData, function(i, obj) {//i 循环索引 ,obj 每次循环拿到的元素\r\n");
      out.write("\t\t\t\t\t\t//此循环就是拼接一段html静态代码\r\n");
      out.write("\t\t\t\t\t\tstr = str\r\n");
      out.write("\t\t\t\t\t\t\t\t+ '<option value=\"'+obj.areaid+'\">'\r\n");
      out.write("\t\t\t\t\t\t\t\t+ obj.areaname + \"</option>\"\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\tconsole.info(str);\r\n");
      out.write("\t\t\t\t\tAreaList.html(str);//把上面拼接的静态代码丢过去\r\n");
      out.write("\t\t\t\t},\r\n");
      out.write("\t\t\t\terror : function(xhr, status, error) {\r\n");
      out.write("\t\t\t\t\tconsole.info(\"出错了！\");\r\n");
      out.write("\t\t\t\t\tconsole.info(error);\r\n");
      out.write("\t\t\t\t\tAreaList.html('<option>'+获取区域异常+\"</option>\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tgetArea();\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("添加商品\r\n");
      out.write("<form action=\"product/add\" method=\"post\" enctype=\"multipart/form-data\">\r\n");
      out.write("\t商品标题：<input type=\"text\" name=\"title\" /><br>\r\n");
      out.write("\t 商品描述：<textarea name=\"productdesc\" cols=\"50\" rows=\"3\"></textarea><br>\r\n");
      out.write("\t \r\n");
      out.write("\t 原价：<input type=\"text\" name=\"originalprice\" /><br>\r\n");
      out.write("\t 当前团购价：<input type=\"text\" name=\"currentprice\" /><br>\r\n");
      out.write("\t \r\n");
      out.write("\t<!-- 异步请求：从数据库中查询出所有的区域,商店，类型列表，动态（js,或jstl）显示在下拉列表中\r\n");
      out.write("\t 区域：<select name=\"areaid\">\r\n");
      out.write("\t \t<option value=\"4\">江汉路</option>\r\n");
      out.write("\t \t<option value=\"6\">武广</option>\r\n");
      out.write("\t </select><br>\r\n");
      out.write("\t-->\r\n");
      out.write("\t 区域：\r\n");
      out.write("\t <select id=\"area\" name=\"areaid\">\r\n");
      out.write("\t \t<!-- 拼接的静态代码放此处 -->\r\n");
      out.write("\t </select><br>\r\n");
      out.write("\t \r\n");
      out.write("\t<!-- 从数据库中查询出所有的区域列表，动态（js,或jstl）显示在下拉列表中 -->\r\n");
      out.write("\t  商店：\r\n");
      out.write("\t <select name=\"shopid\">\r\n");
      out.write("\t \t<option value=\"2\">领先一步干果店</option>\r\n");
      out.write("\t \t<option value=\"4\">谷一韩式自助餐厅武广店</option>\r\n");
      out.write("\t </select><br>\r\n");
      out.write("\t <!-- 从数据库中查询出所有的区域列表，动态（js,或jstl）显示在下拉列表中 -->\r\n");
      out.write("\t 商品类型：\r\n");
      out.write("\t <select name=\"categoryid\">\r\n");
      out.write("\t \t<option value=\"7\">火锅</option>\r\n");
      out.write("\t \t<option value=\"13\">食品</option>\r\n");
      out.write("\t </select><br>\r\n");
      out.write("\t \r\n");
      out.write("\t <!-- 后期通过上传图片，将图片的地址保存到数据库 -->\r\n");
      out.write("\t 商品图片1：\r\n");
      out.write("\t <input type=\"file\" name=\"attachs\" id=\"picPath1\"/><br>\r\n");
      out.write("\t \r\n");
      out.write("\t  商品图片2：\r\n");
      out.write("\t <input type=\"file\" name=\"attachs\" id=\"picPath2\"/><br>\r\n");
      out.write("\t\r\n");
      out.write("\t<input type=\"submit\" value=\"添加\"  />\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
