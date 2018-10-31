jQuery(document).ready(function ($) {
    $.ajax({
        type: "POST",
        url: "/login1",
        timeout: 100000,
        success: function (data) {
            if (data === "3") {
            }
            else{
                display(data);
            }
        }
    });
});
function display(data) {
    $('.topbar-child2').replaceWith(data);
}
