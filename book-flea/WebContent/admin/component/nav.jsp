<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String adminId = null;

	if(session.getAttribute("adminId")==null)
	{
		adminId = "로그인";
	}else{
		adminId = (String)session.getAttribute("adminId");
	}
	
%>
<body>
    <!--=================================================-->
    <nav class="nav-1">
        <div class="nav__div nav-small">
            <div class="nav-small__col nav-small__col-left">
                <div class="nav-small__col-left__i-wrap">
                    <i class="fas fa-bars"></i>
                    <i class="fas fa-times"></i>
                </div>
            </div>
            <div class="nav-small__col nav-small__col-mid">
                <div class="nav-small__col-mid__logo-wrap logo-wrap">
                    <h1>BOOK</h1>
                    <img src="/BOOKFLEA/admin/component/logo.png" alt="" >
                    <h1>FLEA</h1>
                </div>
            </div>
            <div class="nav-small__col nav-small__col-right">
                <div class="nav-small__col-right__i-wrap fa-home-wrap">
                     <i class="fas fa-home"></i>
                </div>
            </div>
        </div>
        <div class="sep-menu">
            <ul>
                <li class="sep-menu__mypage">
                    <div class="sep-menu__mypage__wrap">
                        <div class="sep-menu__mypage__wrap__info">
                            <i class="fas fa-user-circle fa-lg"></i>
                           <span><a href="/BOOKFLEA/admin.jsp?sec=my"><%=adminId%></a></span>
                        </div>
                        <div class="sep-menu__mypage__wrap__signout">
                            <i class="fas fa-sign-in-alt"></i>
                        </div>
                    </div>
                </li>
                <div class="sep-menu__hr"></div>
                <li onclick="location.href='?sec=book'"><span class="sep-menu__col"><a>도서관리</a></span></li>
                <li onclick="location.href='?sec=order'"><span class="sep-menu__col"><a>주문관리</a></span></li>
                <li onclick="location.href='?sec=user'"><span class="sep-menu__col"><a>유저관리</a></span></li>
            </ul>
        </div>
    </nav>
    <!--=================================================-->
    <!--=================================================-->
    <nav class="nav-2">
        <div class="nav__div nav-big">
            <div class="nav-big__col nav-big__col-left">
                <div class="nav-big__col-left__i-wrap">
                    <i class="far fa-user-circle fa-lg" style="font-size: 24px;"></i>
                </div>
            </div>
            <div class="nav-big__col nav-big__col-mid">
                <div class="nav-big__col-mid__logo-wrap logo-wrap">
                    <h1>BOOK</h1>
                    <img src="/BOOKFLEA/admin/component/logo.png" alt="" >
                    <h1>FLEA</h1>
                </div>
            </div>
            <div class="nav-big__col nav-big__col-right">
                <div class="nav-big__col-right__i-wrap fa-home-wrap">
                    <i class="fas fa-home"></i>
                </div>
            </div>
        </div>
        <div class="nav-2__menu">
            <ul>
            	 <li onclick="location.href='?sec=book'"><a>도서관리</a></li>
                <li onclick="location.href='?sec=order'"><a>주문관리</a></li>
                <li onclick="location.href='?sec=user'"><a>유저관리</a></li>
            </ul>
        </div>
    </nav>
    <!--=================================================-->
    <div class="margin-top-maker" style="margin-top: 63px; height: 1px; width: 100%;"></div>
	<div class="margin-top-maker-2" style="margin-top: 52px; height: 0px; width: 100%;"></div>
    <!--=================================================-->
    
</body>