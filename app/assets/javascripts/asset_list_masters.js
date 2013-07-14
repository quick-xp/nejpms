$(function() {
  $('#asset-list-master-table').dataTable({
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap",
    "aLengthMenu": [[50, 100, 200, -1], [50, 100, 200, "All"]],
    "iDisplayLength": 50
  });
  $('#asset-list-transition-table').dataTable({
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap",
    "aLengthMenu": [[20, 50, 100, -1], [20, 50, 100, "All"]],
    "iDisplayLength": 20,
    "aaSorting":[[0,"desc"]]
  });

});
