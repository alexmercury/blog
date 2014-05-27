
#var text = $(this).val();

#alert(text);

#$('span[class = tag]').each(function()
#      {
#        if(text == $(this).html())
#        {
#          //alert(text);
#          $('input[id = post_listTags_'+$(this).attr('id')+']').attr("checked","checked");
#
#        }
#
#
#      });

indexTag = 0;

add_tag = ->
  $("<input class = \"tag" + indexTag + "\" id=\"post_tags_attributes_" + indexTag + "_text\" type=\"text\" size=\"30\" name=\"post[tags_attributes][" + indexTag + "][text]\">").insertBefore "span.pop"
  indexTag++
  return

remove_tag = ->
  indexTag--
  $(".tag" + indexTag).remove()
  return

$(document).ready ->
  $("input[id $= text]").each ->
    indexTag++
    return

  return