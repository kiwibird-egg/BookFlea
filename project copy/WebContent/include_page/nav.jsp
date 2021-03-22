<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- css -->
        <style>
        :root {
        --border-color : #ccc;
        --background-color : #fff;
        --bar-color : #f1f1f1;
        }
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        body{
            margin : 0;
            padding : 0;
        }
        a {
            text-decoration: none;
            color : black;
        }
        /*=========================================*/
        .wide_nav {
            text-align : center;
            border-top: 1px solid var(--border-color);
            border-bottom : 1px solid var(--border-color);
        }
        .wide_nav ul {
            margin : 12px;
            padding : 0px;
        }
        .wide_nav li:first-child{
        	margin-left:55px;
        }
        .wide_nav li {
            margin : 0px;
            margin-right: 55px;
            padding : 8px;
            padding-right: 15px;
            padding-left: 15px;
            display: inline;
            border-radius: 4px;
        }
        .wide_nav li:hover {
            background-color: rgb(235, 235, 235);
            cursor: pointer;
        }
        /*=========================================*/
        .narrow_nav{
        	background-color : #fcfcfc;
            display : none;
            text-align : left;
            border-bottom : 1px solid var(--border-color);
        }
        .narrow_nav ul {
            list-style: none;
            padding : 0px;
            margin : 0px;
        }
        .narrow_nav li {
            margin : 0px;
            padding : 10px 20px 10px 20px;
        }
        .narrow_nav li:not(:last-child) {
        	/*border-bottom : 1px solid var(--border-color);
        	*/
        }
        #narrow_login_info {
        	border-bottom : 1px solid #ccc;
        	padding : 0px 20px 0px 20px;
        	cursor : pointer;
        }
        /*=========================================*/
        .nav_bar {
            display : none;
            text-align : center; 
            border-top : 1px solid var(--border-color);
            border-bottom : 1px solid var(--border-color);
            background-color: rgb(243, 243, 243);
            cursor: pointer;
        }
        #nav_bar2{
            display : none;
        }
    
    	#narrow_nav_list > li > a {
    		display:block;
    	}
        @media screen and (max-width: 768px){
            .wide_nav {
                display: none;
            }
            /*=========================================*/
            .nav_bar {
                display: block;
            }
            /*=========================================*/
            .narrow_nav.active{
                display : block;
            }
            #nav_bar1.inactive {
                display : none;
            }
            #nav_bar2.active {
                display : block;
            }
            .narrow_nav {
                display: none;
            }
    
        }
        </style>
        <!-- font awesome -->
        <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
        <script src="./nav.js" defer></script>
        <title>nav</title>
        <!--Noto Sans KR-->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    </head>
    <%
		String id = (String) session.getAttribute("userID"); // Object 타입이므로 다운캐스팅
	%>
    <body>
        <nav class="wide_nav">
            <ul>
                <li><a href="/project_copy/forum/q&a.jsp">Q&amp;A</a></li>
                <li><a>Tech</a></li>
                <li><a>커뮤니티</a></li>
                <li><a href="#">칼럼</a></li>
                <li><a href="/project_copy/my_page.jsp">MyPage</a></li>
            </ul>
        </nav>
        <!-------------------------->
        <div class="nav_bar" id="nav_bar1">
            <i class="fas fa-bars icon_bars" style="color : grey;"></i>
        </div>
        <div class="nav_bar" id="nav_bar2">
            <i class="fas fa-times" style="color : grey;"></i>
        </div>
        <nav class="narrow_nav">
            	
				<% if (id!=null){ %>
				<div id="narrow_login_info" onclick="location.href='/project_copy/my_page.jsp'">
				<% } 
				else if(id==null){ %>
				<div id="narrow_login_info" onclick="location.href='/project_copy/login/login.jsp'">
				<% } %>
					<span style="display:inline-block; width : 89%;">
						<span style="height:42px; line-height:42px;">
							<i class="fas fa-user-circle" style="font-size:130%; margin-right:5px; color:grey;"></i>
							<% if (id!=null){ %>
							<a style="font-size:100%; font-weight:bold"><%=id %></a>
							<% } 
							else if(id==null){ %>
							<a style="font-size:130%; font-weight:bold" href="login/login.jsp">로그인하기</a>
							<% } %>
						</span>
					</span>
					<span style="display:inline-block; width : 9%; text-align : right;">
						<span style="height:30px; line-height:30px;">
							<% if (id!=null){ %>
							<a href="/project_copy/login/logout.jsp" style="font-size:100%; display:block; cursor:pointer;">
								<i class="fas fa-sign-out-alt" style="color:grey; margin : 14px 5px 5px 5px; line-height:32px;"></i>
							</a>
							<% } %>
						</span>
						
					</span>
				<% if (id!=null){ %>
				</div>
				<% } 
				else if(id==null){ %>
				</div>
				<% } %>
            <div style="padding:10px 20px; cursor:pointer;" onclick="location.href='/project_copy/forum/q&a.jsp'">
            	<a>Q&amp;A</a>
            </div>
            <div style="padding:10px 20px; cursor:pointer;" onclick="location.href='/project_copy/my_page.jsp'">
            	<a>Tech</a>
            </div>
            <div style="padding:10px 20px; cursor:pointer;" onclick="location.href='/project_copy/my_page.jsp'">
            	<a>커뮤니티</a>
            </div>
            <div style="padding:10px 20px; cursor:pointer;" onclick="location.href='/project_copy/my_page.jsp'">
            	<a>칼럼</a>
            </div>
        </nav>
        <script>
	        const toggleBtn1 = document.querySelector('#nav_bar1');
	        const toggleBtn2 = document.querySelector('#nav_bar2')
	        const menu = document.querySelector('.narrow_nav')
	
	
	        toggleBtn1.addEventListener('click', ()=>{
	            menu.classList.toggle('active');
	            toggleBtn1.classList.toggle('inactive');
	            toggleBtn2.classList.toggle('active');
	        })
	
	
	        toggleBtn2.addEventListener('click', ()=>{
	            menu.classList.toggle('active');
	            toggleBtn1.classList.toggle('inactive');
	            toggleBtn2.classList.toggle('active');
	        })
        </script>
    </body>
    </html>