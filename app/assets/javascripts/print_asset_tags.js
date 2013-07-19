;jQuery(function($) {
  $('.print-selected-tags').bind('click', function(){
    var selectedAssets = $('input.print-asset-tag-checkbox:checked')

    _.each(selectedAssets, function(selectedAsset, index){
      var name = $(selectedAsset).closest('tr.asset-row').data('asset-name');
      
      index += 1

      $('.asset-tag-'+index).html(name)
    })

    $('#printTagModal').foundation('reveal', 'open')
  });

  $(".gridster ul").gridster({
    widget_margins: [10, 10],
    widget_base_dimensions: [100, 70],
    shift_larger_widgets_down: false
  });
})
