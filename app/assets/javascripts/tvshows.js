$(document).ready(function(){
  $('#tvshow_showid').on('change', function(){
    var showid =  $('#tvshow_showid').val();
    var data   = gon.shows[ showid ];
    console.log("you choose " + showid );
    console.dir( data );

    for( var i in data ) {
      var value = data[i];

      $('#tvshow_' + i).val( value );
    }

    if( data['ended'] == '0' ) {
      $('#tvshow_ended').val('');
    }
  });
});
