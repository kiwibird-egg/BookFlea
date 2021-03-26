const menuBtn = document.querySelector(".nav-small__col-left__i-wrap");
const sepMenu = document.querySelector(".sep-menu");

const menuIcon = document.querySelector(".nav-small__col-left__i-wrap > i:nth-child(1)");
const cancelIcon = document.querySelector(".nav-small__col-left__i-wrap > i:nth-child(2)");

menuBtn.addEventListener('click', ()=>{
    if(sepMenu.style.display=='none'){
        sepMenu.style.display = 'block';
        cancelIcon.style.display = 'block';
        menuIcon.style.display = 'none';
        
    }else{
        sepMenu.style.display = 'none';
        cancelIcon.style.display = 'none';
        menuIcon.style.display = 'block';
    }
});

const signOutBtn = document.querySelector(".sep-menu__mypage__wrap__signout");

signOutBtn.addEventListener('click', ()=>{
    location.href="http://naver.com";
});

const bookmarkBtn = document.querySelector(".bookmark-wrap");
bookmarkBtn.addEventListener('click', ()=>{
    location.href="http://naver.com";
});

const navLogo1 = document.querySelector(".nav-small__col-mid__logo-wrap");
    navLogo1.addEventListener('click', ()=>{
    location.href="/BOOKFLEA/admin-page/main.jsp";
});
const navLogo2 = document.querySelector(".nav-big__col-mid__logo-wrap");
    navLogo2.addEventListener('click', ()=>{
    location.href="/BOOKFLEA/admin-page/main.jsp";
});