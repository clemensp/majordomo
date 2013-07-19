;jQuery(function($) {
  $('.print-selected-tags').bind('click', function(){
    var selectedAssets = $('input.print-asset-tag-checkbox:checked')

    _.each(selectedAssets, function(selectedAsset, index){
      var name = $(selectedAsset).closest('tr.asset-row').data('asset-name');
      
      $('.asset-tag-'+(index+1)).html(name)
      $('.asset-tag-'+(index+1)).data('value', $(selectedAsset).val())
    })

    $('#printTagModal').foundation('reveal', 'open')
  });

  $('.print-tags').bind('click', function(){
    var label1 = $("li[data-row='1'][data-col='1']").data('value')
      , label2 = $("li[data-row='1'][data-col='2']").data('value')
      , label3 = $("li[data-row='2'][data-col='1']").data('value')
      , label4 = $("li[data-row='2'][data-col='2']").data('value')
      , label5 = $("li[data-row='3'][data-col='1']").data('value')
      , label6 = $("li[data-row='3'][data-col='2']").data('value')
      , label7 = $("li[data-row='4'][data-col='1']").data('value')
      , label8 = $("li[data-row='4'][data-col='2']").data('value')
      , label9 = $("li[data-row='5'][data-col='1']").data('value')
      , label10 = $("li[data-row='5'][data-col='2']").data('value')

    var query = ''
    
    if(label1)
      query += 'label[1]='+label1+'&';
    if(label2)
      query += 'label[2]='+label2+'&';
    if(label3)
      query += 'label[3]='+label3+'&';
    if(label4)
      query += 'label[4]='+label4+'&';
    if(label5)
      query += 'label[5]='+label5+'&';
    if(label6)
      query += 'label[6]='+label6+'&';
    if(label7)
      query += 'label[7]='+label7+'&';
    if(label8)
      query += 'label[8]='+label8+'&';
    if(label9)
      query += 'label[9]='+label9+'&';
    if(label10)
      query += 'label[10]='+label10+'&';

    console.log(label10)

     window.open('/assets/99/qrcode.pdf?'+query)
  });

  $(".gridster ul").gridster({
    widget_margins: [10, 10],
    widget_base_dimensions: [100, 70],
    shift_larger_widgets_down: false
  });
})
