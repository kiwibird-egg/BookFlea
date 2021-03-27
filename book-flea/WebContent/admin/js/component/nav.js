const menuBtn = document.querySelector(".nav-small__col-left__i-wrap");
const sepMenu = document.querySelector(".sep-menu");
sepMenu.style.display = 'none';

const menuIcon = document.querySelector(".nav-small__col-left__i-wrap > i:nth-child(1)");
const cancelIcon = document.querySelector(".nav-small__col-left__i-wrap > i:nth-child(2)");

menuBtn.addEventListener('click', ()=>{
    if(sepMenu.style.display==='none'){
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

const faHomeBtn = document.querySelectorAll(".fa-home-wrap");
faHomeBtn.forEach(i =>{
    i.addEventListener('click', ()=>{
        location.href="/BOOKFLEA/index.jsp";
    });
});

const navLogo = document.querySelectorAll(".logo-wrap");
navLogo.forEach(i =>{
    i.addEventListener('click', ()=>{
        location.href="/BOOKFLEA/admin.jsp";
    });
});

const userLogo = document.querySelectorAll(".nav-big__col-left__i-wrap");
userLogo.forEach(i =>{
    i.addEventListener('click', ()=>{
        location.href="/BOOKFLEA/admin.jsp?sec=my";
    });
});