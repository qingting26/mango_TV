$(function () {
    $("#ul_l li").click(function () {
        var val = $(this).children().attr("href");
        window.location = val
    });
    $(".variety_w").click(function () {
        var val = $(this).children().attr("href");
        window.location = val
    });
    $("#ul_t li").click(function () {
        var val = $(this).children().attr("href");
        window.location = val
    });
    $(".nav_two ul li").click(function () {
        var val = $(this).children().attr("href");
        window.location = val
    });
    $(".swiper-slide").click(function () {
        var val = $(this).children().attr("href");
        window.location = val
    })

})