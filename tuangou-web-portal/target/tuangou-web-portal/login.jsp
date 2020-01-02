﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>美淘网会员登录</title>
<link href="css/global.css"  type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />
<style type="text/css"></style>
</head>

<body>
<iframe src="head.html" width="100%" height="104" scrolling="no" frameborder="0"></iframe>
<div id="middle">
  <div id="allnav">
    <div id="nav">
      <ul>
        <!--组织一级菜单-->
        <li class="menuList"><a href="#" class="category">全部商品分类</a>
          <ul>
            <li><a href="#">美食</a></li>
            <li><a href="#">旅游</a></li>
            <li><a href="#">酒店</a></li>
            <li><a href="#">电影</a></li>
            <li><a href="#">KTV</a></li>
            <li><a href="#">时尚</a></li>
            <li><a href="#">生活服务</a></li>
          </ul>
        </li>
        <li><a href="#">首页</a></li>
        <li><a href="#">团购</a></li>
        <li><a href="#">美食</a></li>
        <li><a href="#">电影</a></li>
        <li><a href="#">KTV</a></li>
        <li><a href="#">酒店订票</a></li>
        <li><a href="#">购物</a></li>
        <li><a href="#">品牌特卖</a></li>
      </ul>
    </div>
  </div>
  <!--导航结束-->
  <div id="content">
   <div id="register">
      <form action="main" method="post">
        <fieldset>
          <legend>注册新用户</legend>
          <ul>
            <li><a href="#emailreg" class="current">邮箱注册</a></li>
            <li><a href="#phonereg">手机注册</a></li>
          </ul>
          <div class="box">
            <div id="emailreg">
              <p>
                <label>邮箱：</label>
                <input name="login" type="text" class="txt" />
                <span>推荐使用qq邮箱</span>
              </p>
              <p>
                <label for="userName" accesskey="n">用户名：</label>
                <input name="customerName" type="text" class="txt"  id="userName"/>
                <span>4-16字符，不能包含数字</span>
              </p>
               <p>
                <label>创建密码：</label>
                <input name="pwd" type="password" class="txt" />
                <span>6-32字符</span>
              </p>
               <p>
                <label>确认密码：</label>
                <input name="pwd2" type="password" class="txt" />
                <span>请再次输入密码</span>
              </p>
               <p>
                <label>所在城市：</label>
                <select class="txt" name="address1">
                   <option>--省--</option>
                   <option>北京</option>
                   <option>湖北</option>
                </select>
                 <select class="txt" name="address2">
                   <option>--市区--</option>
                   <option>北京</option>
                   <option>武汉</option>
                </select>
              </p>
               <p>
                <label>验证码：</label>
                <input name="" type="text" class="txt check" />
                <img src="images/code_img.gif" style="vertical-align:bottom" />
              </p>
             <p>
            <button type="submit" >   <input type="image" class="btn" src="images/register.jpg" />
              </button> <a href="#">《美淘网用户协议》</a>
               
             </p>
            </div>
            <!--通过email注册-->
            <div id="phonereg"> 
             <p>
                <label>电话：</label>
                <input name="tel" type="text" class="txt" />
                <span>用于登录，找回密码，不会公开</span>
               
              </p>
              <p>
                <label>短信验证码：</label>
                <input name="" type="text" class="txt" />
                <span>请输入手机收到的验证码</span>
              </p>
               <p>
                <label>创建密码：</label>
                <input name="pwd" type="text" class="txt" />
                <span>6-32字符</span>
              </p>
               <p>
                <label>确认密码：</label>
                <input name="pwd1" type="text" class="txt" />
                 <span>请再次输入密码</span>
                
              </p>
               <p>
               <button type="submit"><input type="image" class="btn" src="images/register.jpg" />
               </button>
               <a href="#">《美淘网用户协议》</a>
             </p>
            </div>
            <!--通过电话注册--> 
          </div>
        </fieldset>
      </form>
    </div>
    <div id="login">
      <form>
        <fieldset>
          <legend>登录MEITAO.COM</legend>
          <ul>
            <li><a href="#email" class="current">邮箱用户</a></li>
            <li><a href="#phone">手机用户</a></li>
          </ul>
          <div class="box">
            <div  id="email">
              <p>
                <label>邮箱：</label>
                <input name="" type="text" class="txt" />
              </p>
              <p>
                <label>密码：</label>
                <input name="" type="text" class="txt" />
              </p>
              <p>
                <input type="image" src="images/login.jpg" class="btn" />
                <a href="#">忘记密码了？</a></p>
            </div>
            <div id="phone">
              <p>
                <label>手机号：</label>
                <input name="" type="text" class="txt" />
              </p>
              <p>
                <label>密 码：</label>
                <input name="" type="text" class="txt" />
              </p>
              <p>
                <input type="image" src="images/login.jpg" class="btn" />
                <a href="#">忘记密码了？</a></p>
            </div>
          </div>
        </fieldset>
      </form>
    </div>
   
  </div>
  <!--中间内容块结束--> 
</div>
<iframe src="foot.html" width="100%"  scrolling="no" frameborder="0" height="185"></iframe>
</body>
</html>
