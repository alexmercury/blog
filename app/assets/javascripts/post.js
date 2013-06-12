var indexTag = 0;

$(document).ready(function(){

  $('input[id $= cont]').each(function()
    {
      //var text = $(this).val();

      indexTag++;

      //alert(text);

      /*$('span[class = tag]').each(function()
      {
        if(text == $(this).html())
        {
          //alert(text);
          $('input[id = post_listTags_'+$(this).attr('id')+']').attr("checked","checked");

        }


      }); */

    });
  });

var indexTag = 0;

function add_tag() {
  $('<input class = "tag'+indexTag+'" id="post_tags_attributes_'+indexTag+'_cont" type="text" size="30" name="post[tags_attributes]['+indexTag+'][cont]">').insertBefore("span.pop");
  indexTag++;
}

function remove_tag() {
  $('.tag'+indexTag).remove();
  indexTag--;
}