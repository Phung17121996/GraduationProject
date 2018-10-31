jQuery(document).ready(function ($) {
    $("#login-nav").submit(function (event) {
        // Prevent the form from submitting via the browser.
        event.preventDefault();
        userLogin();
    });
});

function userLogin() {
    $.ajax({
        type: "POST",
        url: "login?email=" + $("#email").val() + "&password=" + $("#password").val(),
        timeout: 100000,
        success: function (data) {
            if (data == 1) {
                alert("Your email is incorrect. Try again!")
            }
            else if (data == 2) {
                alert("Your password is incorrect.Try again!")
            }
            else if (data == 4) {
                alert("Your account is disabled by admin! Please contact to admin for question!")
            }
            else {
                display(data);
            }
        }
    });

    // function display(data) {
    //     var newData= data.split('||');
    //     if(newData[0] !== 'admin'){
    //         $('.topbar-child2').replaceWith(data);
    //     }
    //     else {
    //         window.location.replace(newData[0]);
    //         $('.topbar-child2').replaceWith(newData[1]);
    //     }
    // }
    function  display(data) {
        $('.topbar-child2').replaceWith(data);
    }
}


