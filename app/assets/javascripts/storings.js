$(function() {
  $('#store-list-master-table').dataTable({
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap",
    "aLengthMenu": [[50, 100, 200, -1], [50, 100, 200, "All"]],
    "iDisplayLength": 50,
     "aaSorting":[[0,"desc"]]
 });
});
