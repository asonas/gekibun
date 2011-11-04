$(function() {
  //access_token = $('input[name=authenticity_token]').val();
  //console.log(access_token)
  $('div').click(function(){
    message = $('#card_commnent_body').val();
    access_token = $('input[name=authenticity_token]').val();
    
    $.ajax({
      type: "POST",
      url: "/cards",
      data: "commnent_body="+message+'&authenticity_token='+access_token,
      success: function(msg){
        message = '';//初期化
      }
    })

  })
  
  /*
  $('buttom').click(function(){
    $.ajax({
      type: "POST",
      url: "/cards/create",
      data: "commnent_body",
      success: function(msg){
        alert( "Data Saved: " + msg );
        message = '';
      }
    })
  });
  */
})
