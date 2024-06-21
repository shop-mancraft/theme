/**
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License version 3.0
* that is bundled with this package in the file LICENSE.txt
* It is also available through the world-wide-web at this URL:
* https://opensource.org/licenses/AFL-3.0
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade this module to a newer
* versions in the future. If you wish to customize this module for your needs
* please refer to CustomizationPolicy.txt file inside our module for more information.
*
* @author Webkul IN
* @copyright Since 2010 Webkul
* @license https://opensource.org/licenses/AFL-3.0 Academic Free License version 3.0
*/

if ((typeof wk_fb_app_id !== 'undefined') && typeof is_logged === 'undefined') {
    window.fbAsyncInit = function () {
        // FB JavaScript SDK configuration and setup
        FB.init({
            appId: wk_fb_app_id, // FB App ID
            cookie: true, // enable cookies to allow the server to access the session
            xfbml: true, // parse social plugins on this page
            version: 'v2.8' // use graph api version 2.8
        });
    };

    // Load the JavaScript SDK asynchronously
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Facebook login with JavaScript SDK
    function fbLogin() {
        if (typeof FB != 'undefined') {
            FB.login(function (response) {
                if (response.authResponse) {
                    // Get and display the user profile data
                    getFbUserData();
                } else {
                    showErrorMsg(user_cancel);
                    //document.getElementById('status').innerHTML = user_cancel;
                }
            }, { scope: 'email' });
        } else {
            showErrorMsg(fbConnectionError);
        }
    }

    // Fetch the user profile data from facebook
    function getFbUserData() {
        FB.api('/me', { locale: 'en_US', fields: 'id,first_name,last_name,email,gender,locale' },
            function (response) {
                var isValidated = validateFacebookResponse(response);
                if (isValidated == true) {
                    proceedLogin(response.first_name, response.last_name, response.email);
                }
            });
    }

    function validateFacebookResponse(response) {
        if (!response.first_name || response.first_name === 'undefined') {
            deleteFacebookPermissions();
            showErrorMsg(error_fname);
        } else if (!response.last_name || response.last_name === 'undefined') {
            deleteFacebookPermissions();
            showErrorMsg(error_lname);
        } else if (!response.email || response.email === 'undefined') {
            deleteFacebookPermissions();
            showErrorMsg(error_email);
        } else {
            return true;
        }

        return false;
    }

    function deleteFacebookPermissions() {
        FB.api("/me/permissions", "DELETE");
    }
}

function showErrorMsg(msg) {
    $.growl.error({ title: "", message: msg });
}

function showSuccessMsg(msg) {
    $.growl.error({ title: "", message: msg });
}

function proceedLogin(first_name, last_name, email) {
    if (first_name && last_name && email) {
        $.ajax({
            type: "POST",
            url: wkcheckout,
            async: false,
            dataType: 'json',
            data: {
                ajax: true,
                action: 'proceedLogin',
                first_name: first_name,
                last_name: last_name,
                email: email,
                token: wktoken,
            },
            success: function (result) {
                if (result == '1') {
                    window.location.reload(true);
                }
            }
        });
    }
}