$(function(){
    var tooltip_selector = $('*[data-toggle="tooltip"]');
    tooltip_selector.tooltip();
    tooltip_selector.on('shown.bs.tooltip', function () {
        var tooltip_id = jQuery(this).attr('aria-describedby');
        var tooltip_color = jQuery(this).data('tooltip-color');
        $('#' + tooltip_id + '> .tooltip-inner').addClass(tooltip_color);
    });
});