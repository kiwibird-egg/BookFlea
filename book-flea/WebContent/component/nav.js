const menuBtn = document.querySelector(".nav-small__col-left__i-wrap");
const sepMenu = document.querySelector(".sep-menu");

const menuIcon = document.querySelector(".nav-small__col-left__i-wrap > i:nth-child(1)");
const cancelIcon = document.querySelector(".nav-small__col-left__i-wrap > i:nth-child(2)");

menuBtn.addEventListener('mousedown', ()=>{
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
