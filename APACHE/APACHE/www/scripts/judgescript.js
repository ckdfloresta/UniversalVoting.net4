﻿var selected, modify, input, fName, lName, username, password, action;
var modifyLName, modifyFName, modifyUName, modifyPword;
var eventID = 1;
//eto nalang palitan natin para di na nakakalito
//var service = 'http://localhost/uvtest2/service.svc/';
var service = 'http://192.168.43.238/uvtest2/service.svc/';

//selects from tbAddJudges
$('#tbAddJudges tbody ').on("click touchstart", "a", function (e) {
    //gets data
    var currentRow = $(this).closest('tr');
    currentRow.addClass("selected").siblings().removeClass("selected");
    fName = currentRow.find("td:first").html();
    lName = currentRow.find("td:nth-child(2)").html();
    username = currentRow.find("td:nth-child(3)").html();
    password = currentRow.find("td:nth-child(4)").html();
    console.log(fName);
    clickAddJudge();

});


//click btnAddJudge
function clickAddJudge() {
//    alert(fName + " " + lName + " " + username + " " + password);
    $.ajax({
        type: 'POST',
        url: service + 'spAddJudgeToEventJudges',
        //data: {
        //    'fname': fName,
        //    'lname': lName,
        //    'eventID': eventID
        //}
        data:
        '{' +
        '"fname":"' + fName + '",' +
        '"lname":"' + lName + '",' +
        '"uname":"' + username + '",' +
        '"pass":"' + password + '",' +
        '"eventid":"' + eventID + '",' +
        '}',

        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            alert("A new judge has been added!!");
            PopulateJudges();
        }
        ,
        error: function (msg) {
            alert(msg.responseText);
        }

        
    });

}

function clickAddNewJudge()
{
    //fill-out necessary action
    var fname = document.getElementById("txtAddFNameJudge").value.trim();
    var lname = document.getElementById("txtAddLNameJudge").value.trim();
    var uname = document.getElementById("txtAddUserJudge").value.trim();
    var pass = document.getElementById("txtAddPassJudge").value.trim();
    if (fname === '' || lname === '' || uname === '' || pass === '')
    {
        alert('Please complete all the fields');
    }
    else
    {
        console.log(fname + lname + uname + pass);
        $.ajax({
            type: 'GET',
            url: service + 'spCheckUnameavailability',
            data: {
                'judgechars': uname
            },
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {
                var varArResult = JSON.parse(result.spCheckUnameavailabilityResult);
                if (!$.trim(varArResult)) {
                    $.ajax({
                        type: 'POST',
                        url: service + 'spAddPersonToEventJudges',
                        data:
                        '{' +
                        '"fname":"' + fname + '",' +
                        '"lname":"' + lname + '",' +
                        '"uname":"' + uname + '",' +
                        '"pass":"' + pass + '",' +
                        '"eventid":"' + eventID + '",' +
                        '}',

                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        processdata: true,
                        success: function (result) {
                            alert(uname + " has been added!!");
                            PopulateJudges();
                        }
                        ,
                        error: function (msg) {
                            alert(msg.responseText);
                        }
                    });
                }
                else {
                    alert("The username already exists");
                }
            },
            error: function (msg) {
                alert('Error Retrieving Judge List');
            }
        });
    }




    
}

//selects from tbModifyJudges

$('#tbModifyJudges tbody').on("click touchstart", "a", function (e) {

    var currentRow = $(this).closest('tr');
    currentRow.addClass("selected").siblings().removeClass("selected");
    modifyFName = currentRow.find("td:first").html();
    modifyLName = currentRow.find("td:nth-child(2)").html();
    modifyUName = currentRow.find("td:nth-child(3)").html();
    modifyPword = currentRow.find("td:nth-child(4)").html();

    document.getElementById("txtFNameJudge").value = modifyFName;
    document.getElementById("txtLNameJudge").value = modifyLName;
    document.getElementById("txtUserJudge").value = modifyUName;
    document.getElementById("txtPassJudge").value = modifyPword;
    
    removeJudge();
});

function removeJudge()
{
        //fill-out necessary action
        $.ajax({
            type: 'POST',
            url: service + 'spRemoveJudgefromEventJudges',
            data:
            '{' +
            '"fname":"' + modifyFName + '",' +
            '"lname":"' + modifyLName + '",' +
            '"uname":"' + modifyUName + '",' +
            '"pass":"' + modifyPword + '",' +
            '"eventid":"' + eventID + '",' +
            '}',

            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {
                alert(modifyUName + " has been removed from the event judges!");
                PopulateJudges();
            }
            ,
            error: function (msg) {
                alert(msg.responseText);
            }
        });
    
}

$('#tbModifyJudges tbody').on("click touchstart", "input", function (e) {

    var currentRow = $(this).closest('tr');
    currentRow.addClass("selected").siblings().removeClass("selected");
    modifyFName = currentRow.find("td:first").html();
    modifyLName = currentRow.find("td:nth-child(2)").html();
    modifyUName = currentRow.find("td:nth-child(3)").html();
    modifyPword = currentRow.find("td:nth-child(4)").html();

    document.getElementById("txtFNameJudge").value = modifyFName;
    document.getElementById("txtLNameJudge").value = modifyLName;
    document.getElementById("txtUserJudge").value = modifyUName;
    document.getElementById("txtPassJudge").value = modifyPword;

    document.getElementById("txtFNameJudge").disabled = false;
    document.getElementById("txtLNameJudge").disabled = false;
    document.getElementById("txtUserJudge").disabled = false;
    document.getElementById("txtPassJudge").disabled = false;   
});


function clickModifyJudge() {
    var oldFname = modifyFName;
    var oldLname = modifyLName;
    var oldUname = modifyUName;
    var oldPass = modifyPword;

    var newFname = document.getElementById('txtFNameJudge').value.trim();
    var newLname = document.getElementById('txtLNameJudge').value.trim();
    var newUname = document.getElementById('txtUserJudge').value.trim();
    var newPass = document.getElementById('txtPassJudge').value.trim();

    var input, filter, table, tr, td, i, found = false;

    //fill-out necessary action
    input = document.getElementById("txtUserJudge").value.trim();
    filter = input.toUpperCase();
    table = document.getElementById("tbModifyJudges");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2];
        if (td) {
            if (td.innerHTML.toUpperCase() === filter) {
                found = true;
            }

        }
    }
    table = document.getElementById("tbAddJudges");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2];
        if (td) {
            if (td.innerHTML.toUpperCase() === filter) {
                found = true;
            }

        }
    }

    if (found === true && (newUname.toUpperCase() !== oldUname.toUpperCase())) {
        alert('The username ' + input + ' is already taken. Choose another username');
    }
    else {
        //call this function to get person id
        $.ajax({
            type: 'GET',
            url: service + 'KFspCheckEventPerson',
            data: {
                'efname': oldFname,
                'elname': oldLname
            },
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {
                var varArResult = JSON.parse(result.KFspCheckEventPersonResult);
                console.log(varArResult);
                var personid = varArResult[0].PersonID;
                //call update function from wcf
                $.ajax({
                    type: 'POST',
                    url: service + 'spUpdatePersonJudgeDetails',
                    data:
                    '{' +
                    '"personid":"' + personid + '",' +
                    '"fname":"' + newFname + '",' +
                    '"lname":"' + newLname + '",' +
                    '"uname":"' + newUname + '",' +
                    '"pass":"' + newPass + '",' +
                    '"eventid":"' + eventID + '",' +
                    '}',

                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    processdata: true,
                    success: function (result) {
                    }
                    ,
                    error: function (msg) {
                        alert(msg.responseText);
                    }
                });
                alert('The account "' + oldUname + '" has been edited');
                PopulateJudges();
            },
            error: function (msg) {
                alert('Error Retrieving PersonID');
            }
        });
        clickCancel();

    }

}







function PopulateJudges() {
    //document.getElementById('tbAddJudges').options.length = 0;
    //document.getElementById('slModifyCriteria').options.length = 0;
    eventID = sessionStorage.getItem("EventID");
    console.log('EventID = ' + eventID);
    $("#tbAddJudges tbody").empty(); 
    $("#tbModifyJudges tbody").empty(); 
    document.getElementById('txtFNameJudge').value = '';
    document.getElementById('txtLNameJudge').value = '';
    document.getElementById('txtUserJudge').value = '';
    document.getElementById('txtPassJudge').value = '';
    $.ajax({
        type: 'GET',
        url: service + 'spViewNotEventJudges',
        data: {
            'eventid': eventID
        },
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            var varArResult = JSON.parse(result.spViewNotEventJudgesResult);
            console.log(varArResult);
            $.each(varArResult, function (i, item) {
                //$('#tbAddJudges').append(
                //    '<tr><td>' + item.FirstName + '</td><td>' + item.LastName + '</td><td>' + item.judgeUname + '</td><td>' + item.judgePword + '</td><td><a href="#" class="addrow" >Add Judge</a></td>' + '</tr>');
  
                //here we go
                $('#tbAddJudges').append(
                    '<tr><td>' + item.FirstName + '</td><td>' + item.LastName + '</td><td>' + item.judgeUname + '</td><td>' + item.judgePword + '</td><td><a href="#" class="addrow"><input type="checkbox" /></a></td>' + '</tr>');
            });

        },
        error: function (msg) {
            alert('Error Retrieving Available Judge List');
        }
    });

    $.ajax({
        type: 'GET',
        url: service + 'spViewEventJudges',
        data: {
            'eventid': eventID
        },
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            var varArResult = JSON.parse(result.spViewEventJudgesResult);
            console.log(varArResult);

            $.each(varArResult, function (i, item) {
                //$('#tbModifyJudges').append(
                //    '<tr><td>' + item.FirstName + '</td><td>' + item.LastName + '</td><td>' + item.judgeUname + '</td><td>' + item.judgePword + '</td><td><a href="#" class="delrow" >Remove Judge</a></td><td><input type="radio" name ="edit"></td>' + '</tr>');
                $('#tbModifyJudges').append(
                    '<tr><td>' + item.FirstName + '</td><td>' + item.LastName + '</td><td>' + item.judgeUname + '</td><td>' + item.judgePword + '</td><td><a href="#" class="delrow"><input type="checkbox" /></a></td><td><input type="radio" name ="edit"></td>' + '</tr>');
            });
        },
        error: function (msg) {
            alert('Error Retrieving Judge List');
        }
    });
}


