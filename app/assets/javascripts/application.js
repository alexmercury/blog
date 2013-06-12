// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap




$(document).ready(function(){
    $("#adm-msg").click(function() {
        if ($(".post-adm-comment").css("display") == 'none')
        {
            $(".post-adm-comment").show(300);
        }
        else
        {
            $(".post-adm-comment").hide(300);
        }
    });

  $("#msg-close").click(function() {

    $(".blog-massage-panel").hide(2000);
    $(".blog-massage").hide(0);

  });

    $(document).ready(function(){
        if( ! $('#myCanvas').tagcanvas({
            textColour : '#008DF0',
            outlineColour: '#008DF0',
            weight: true,
            outlineThickness : 1,
            zoom: 0.8,
            maxSpeed : 0.03,
            depth : 0.70,
            textHeight: 14
        }, 'tagcloud'));
    });
});