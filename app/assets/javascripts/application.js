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
//= require jquery_nested_form
//= require_tree .
//= require chosen-jquery
//= require d3
//= require stupidtable.min

$(window).load(function () {
      $("#close").click(function(){
        $(".msgbox").fadeOut("400")
      $.cookie('fadeOut', true);
});

    if($.cookie('fadeOut') == 'true'){
        $('.msgbox').hide();
    } else {
        $('.msgbox').click();
    }   

    $(".edit-rating .rating_star").click(function() {
      var val = $(this).attr('data-rating-id');
      var id = $(this).parent().parent().attr("id");
      setStars(val, id);
      setValue(val, id);
    });

  var setStars = function(val, id) {
    stars = $("#"+id+" .rating_star");
    $(stars).each(function(){
      var currentId = $(this).attr('data-rating-id');
      if (currentId <= val)
        $(this).addClass('on')
      else 
        $(this).removeClass('on')
    })
  }

  var setValue = function(val, id) {
    $("#internship_"+id).val(val)
  }

  $(".recommend-edit").click(function() {
    if ($("#recommend").hasClass( "icon-thumbs-up" )) {
      $(".recommend-edit").removeClass( "icon-thumbs-up" );
      $(".recommend-edit").removeClass( "green-thumb" );
      $(".recommend-edit").addClass( "icon-thumbs-down" );
      $(".recommend-edit").addClass( "red-thumb" );
    }
    if ($("#recommend").hasClass( "icon-thumbs-down" )) {
      $(".recommend-edit").removeClass( "icon-thumbs-down" );
      $(".recommend-edit").removeClass( "red-thumb" );
      $(".recommend-edit").addClass( "icon-thumbs-up" );
      $(".recommend-edit").addClass( "green-thumb" );
    }
  });

});

$(document).ready(function() {
     $("#hide_all").click(function () {
     $(".answer").slideToggle("slow");
     $(".comment").slideToggle("slow");
     $(".answer_2").slideToggle("slow");
     $("#comment_form").slideToggle("slow");
  });

});

click_reset = function() {
  $(".chzn-select").val('').trigger("liszt:updated");
  $(".search-choice").remove();
  $("#search_button").click();
}

 