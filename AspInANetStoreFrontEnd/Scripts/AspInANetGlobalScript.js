var SetColorFromCatagoryCookie = function () {
    if (Cookies.get("CatagoryColor") === undefined) {
        $("#HighlightColor").css("background-color", "#222222");
    } else {
        $("#HighlightColor").css("background-color", Cookies.get("CatagoryColor"));
    }
}
$(function () {
    SetColorFromCatagoryCookie();
    $(".catagorycolor").hover(function () {
        Cookies.set("CatagoryColor", $(this).attr("setCatagoryColor"));
        SetColorFromCatagoryCookie();
    }, function () {
        Cookies.set("CatagoryColor", "#222222");
        SetColorFromCatagoryCookie();
    });
});