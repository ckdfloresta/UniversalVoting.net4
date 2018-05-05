//index.html
function IsConnected() {
    $.ajax({
        type: 'GET',
        url: 'http://localhost/uvtesting/service.svc/IsConnected',
        data: '{}',
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            alert('Successfully Connected!');
        },
        error: function (msg) {
            alert('You are not connected');
        }
    });
}

/****** Sample ********
 *
function btnLogin() {
    var uname = document.getElementById("txtUsername").value;
    var pword = document.getElementById("txtPassword").value;
    

    $.ajax({
        type: 'GET',
        url: 'http://localhost/uvtesting/service.svc/GetUser?username=' + uname + '&password=' + pword,
        data: '{}',
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            var x = result.GetUserResult;
            if (uname == 'admin' && pword == 'admin')
                window.location = "admin.html";
            else if (x == "0")
                alert("Incorrect username and password");
            else {
                localStorage.userID = x;
                window.location = "lpg.html";
            }
        },
        error: function (msg) {
            alert('You are not connected');
        }
    });
}

//signup.html
function btnSignUp() {
    var uname = document.getElementById("txtUsername").value;
    var pword = document.getElementById("txtPassword").value;
    var name = document.getElementById("txtName").value;
    var email = document.getElementById("txtEmail").value;
    var address = document.getElementById("txtAddress").value;
    var contactNum = document.getElementById("txtContactNum").value;

    $.ajax({
        type: 'GET',
        url: 'http://localhost/uvtesting/service.svc/AddUser?Name=' + name + '&Username=' + uname + '&Password=' + pword + '&Email=' + email + '&Address=' + address + '&ContactNum=' + contactNum,
        data: '{}',
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            var x = result.AddUserResult;
            if (x == "0")
                alert("Incorrect input!");
            else {
                alert("Correct input!");
                window.location = "index.html";
            }
        },
        error: function (msg) {
            alert('You are not connected');
        }
    });
}


 */
