window.onhashchange = function(){
    render(window.location.hash);
}


function render(hashKey){
    
    let pages = document.querySelectorAll(".page")
    for (let i = 0; i < pages.length; i++){
        pages[i].style.display = 'none';
    }
    switch(hashKey){
        case "":
            pages[0].style.display = 'block';
            break;
        case "#home":
            pages[0].style.display = 'block';
            break;
        case "#top5":
            pages[1].style.display = 'block';
            break;
        case "#all":
            pages[2].style.display = 'block';
            break;
        default:
            pages[0].style.display = 'block';
    }
    console.log(pages)
}














