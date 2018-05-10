//index.html
//todo by lorenz: create function that will call the error message from wcf :)
function IsConnected() {
    $.ajax({
        type: 'GET',
        url: 'http://localhost/uvtest2/service.svc/IsConnected',
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

function checksession() {
    //REPLACE THIS PART OF THE CODE WITH ACTUAL JUDGE ID FROM LOGIN SCREEN
    var judgeID = 1;
    var ddlEvent = document.getElementById('ddlEvents');
    var option = document.createElement('option');
    $.ajax({
        type: 'GET',
        url: 'http://localhost/uvtest2/service.svc/spViewJudgeUsingJudgeID',
        data: {
            'JudgeID': judgeID
        },
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            var varResult = '';
            var varArResult = JSON.parse(result.spViewJudgeUsingJudgeIDResult);
            for (intCtr in varArResult) {
                var ddlEvent = document.getElementById('ddlEvents');
                var option = document.createElement('option');
                option.text = varArResult[intCtr].EventName;
                ddlEvent.add(option);
            }

        },
        error: function (msg) {
            alert('You are not connected');
        }
    });
}

function btnCreateEvent() {
    var fname = document.getElementById('txtFN').value;
    var lname = document.getElementById('txtLN').value;
    var uname = document.getElementById('txtUsername').value;
    var pname = document.getElementById('txtPassword').value;
    var ename = document.getElementById('txtEN').value;

    $.ajax({
        type: 'POST',
        url: 'http://localhost/uvtest2/service.svc/KFspCreateEvent',
        data:
        '{' +
        '"efname":"' + fname.trim() + '",' +
        '"elname":"' + lname.trim() + '",' +
        '"epname":"' + pname.trim() + '",' +
        '"ename":"' + ename.trim() + '",' +
        '"euname":"' + uname.trim() + '",' +
        '}',
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            alert("Event was created Successfully! Redirecting to home page...");
            setTimeout(window.location.replace("index.html"), 5000);
        },
        error: function (msg) {
            $("lblError").text(msg.responseText);
            $("lblError").css('display','block');
        }
    });
}

