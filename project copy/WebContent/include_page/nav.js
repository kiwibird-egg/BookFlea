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
