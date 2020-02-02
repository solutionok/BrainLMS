/*
Template Name: Admin Press Admin
Author: Themedesigner
Email: niravjoshi87@gmail.com
File: js
*/
$(function () {
    "use strict";
    // ============================================================== 
    //Tooltip
    // ============================================================== 
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
    // ============================================================== 
    //Popover
    // ============================================================== 
    $(function () {
        $('[data-toggle="popover"]').popover()
    })
    
    // ============================================================== 
    // Resize all elements
    // ============================================================== 
    $("body").trigger("resize"); 
    
    $('.gallery').colorbox({transition:'elastic',scalePhotos:true,maxWidth:1200,rel:'gallery',scalePhotos:true});
});
