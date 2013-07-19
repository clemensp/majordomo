;jQuery(function($) {
  $('.print-selected-tags').bind('click', function(){
    $('#printTagModal').foundation('reveal', 'open')
  });

  $(".gridster ul").gridster({
    widget_margins: [10, 10],
    widget_base_dimensions: [100, 70],
    shift_larger_widgets_down: false
  });
})
