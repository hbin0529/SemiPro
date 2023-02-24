$(function () {
    // nav 2번째 호버
    $(".nav_links>li").mouseover(function() {
        $(this).children(".submenu").stop().slideDown()
    });
    $(".nav_links>li").mouseout(function() {
        $(this).children(".submenu").stop().slideUp()
    });


    // 이미지 왼쪽으로 슬라이드
    setInterval(function() {
        if($("#img").position().left == -3840){
            $("#img").animate({"left": "-=1920px"},function() {
                $("#img").css("left", 0);
            })
        }else{
            $("#img").animate({"left": "-=1920px"})
        }
    }, 3000)
    
    // 회원가입 정보창에 정보 입력할 때 색깔 바뀌게
    $(".text-field").keyup(function() {
        $(this).css({"background-color" : "#E8F0FE"})
    });
    
    $(".text-field2").keyup(function() {
        $(this).css({"background-color" : "#E8F0FE"})
    });
})