//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require holder

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

function remove_fields(link) {
  $(link).previous("input[type=hidden]").value = "1"
  $(link).parent("#upload-control").hide();
}