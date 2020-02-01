
$(function() {
    "use strict";

    var latestOne = "";
    $(".aj").click(function(e) {

        if($(this).attr('href') != latestOne){

            if($(this).hasClass('scrollTop')){
                $('html,body').animate({ scrollTop: 0 }, 'fast');
            }

            if(latestOne != ""){
                if($(this).attr('href') != undefined){
                    showHideLoad();
                }
            }
            latestOne = $(this).attr('href');

            $("body").toggleClass("show-sidebar");
            $(".nav-toggler i").toggleClass("ti-menu");
            $(".nav-toggler i").addClass("ti-close");
            
            $("#sidebarnav li").removeClass('active');
            $("#sidebarnav li a").removeClass('active');
            $(this).addClass('active');
        //    $(this).parent('li').addClass('active');

        }
    });

    
    $(".sidebar-nav li").each(function( key, value ) {
        if($(this).find("ul").length && $(this).find("ul").children().length == 0){
            this.remove();
        }
    });

    $("#chgAcademicYear").click(function(e) {
        $('#myModal').modal('show');
    });

    $('.chat-box').slimScroll({
        position: 'right'
        , size: "5px"
        , height: '470'
        , color: '#dcdcdc'
     });

});

var showHideLoad = function(hideIndicator) {
    if (typeof hideIndicator === "undefined" || hideIndicator === null) {
        $('#overlay').show();
    }else{
        $('#overlay').hide();
    }
}
