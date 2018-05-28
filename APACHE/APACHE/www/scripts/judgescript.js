var selected, modify, input, fName, lName, username, password, action;
var modifyLName, modifyFName, modifyUName, modifyPword;
var eventID = 1;
//eto nalang palitan natin para di na nakakalito
var service = 'http://192.168.43.238/uvtest2/service.svc/';

//selects from tbAddJudges
$('#tbAddJudges tbody').on("click touchstart", "tr", function (e) {
    //gets data
    
     $(this).addClass("selected").siblings().removeClass("selected");
     fName = $(this).find("td:first").html();
     lName = $(this).find("td:nth-child(2)").html();
     username = $(this).find("td:nth-child(3)").html();
     password = $(this).find("td:nth-child(4)").html();
     document.getElementById("btnAddExistJudge").disabled = false;
   


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


    document.getElementById("btnAddExistJudge").disabled = true;

}

//selects from tbModifyJudges

$('#tbModifyJudges tbody').on("click touchstart", "tr", function (e) {
    console.log(document.getElementById('tbModifyJudges').disabled);

    if (document.getElementById('tbModifyJudges').disabled === false) {
        //gets data
        $(this).addClass("selected").siblings().removeClass("selected");
        modifyFName = $(this).find("td:first").html();
        modifyLName = $(this).find("td:nth-child(2)").html();
        modifyUName = $(this).find("td:nth-child(3)").html();
        modifyPword = $(this).find("td:nth-child(4)").html();

        document.getElementById("txtFNameJudge").value = modifyFName;
        document.getElementById("txtLNameJudge").value = modifyLName;
        document.getElementById("txtUserJudge").value = modifyUName;
        document.getElementById("txtPassJudge").value = modifyPword;
    }

});

$("#btnEditJudge, #btnRemoveJudge, #btnAddJudge").click(function (e) {
    document.getElementById("btnContinueJudge").disabled = false;
    document.getElementById("btnCancelJudge").disabled = false;
    if (e.target.id === "btnEditJudge") {
        action = "Edit";
        document.getElementById("btnAddJudge").disabled = true;
        document.getElementById("btnRemoveJudge").disabled = true;
        document.getElementById("tbModifyJudges").disabled = false;

        document.getElementById("txtFNameJudge").disabled = false;
        document.getElementById("txtLNameJudge").disabled = false;
        document.getElementById("txtUserJudge").disabled = false;
        document.getElementById("txtPassJudge").disabled = false;
    }
    else if (e.target.id === "btnAddJudge") {
        action = "Add";
        document.getElementById("btnEditJudge").disabled = true;
        document.getElementById("btnRemoveJudge").disabled = true;
        document.getElementById("tbModifyJudges").disabled = true;

        document.getElementById("txtFNameJudge").disabled = false;
        document.getElementById("txtLNameJudge").disabled = false;
        document.getElementById("txtUserJudge").disabled = false;
        document.getElementById("txtPassJudge").disabled = false;
    }
    else if (e.target.id === "btnRemoveJudge") {
        action = "Remove";
        document.getElementById("btnEditJudge").disabled = true;
        document.getElementById("btnAddJudge").disabled = true;
        document.getElementById("tbModifyJudges").disabled = false;

        document.getElementById("txtFNameJudge").disabled = true;
        document.getElementById("txtLNameJudge").disabled = true;
        document.getElementById("txtUserJudge").disabled = true;
        document.getElementById("txtPassJudge").disabled = true;
    }

});

function clickCancel() {
    //reset
    document.getElementById("btnEditJudge").disabled = false;
    document.getElementById("btnAddJudge").disabled = false;
    document.getElementById("btnRemoveJudge").disabled = false;
    document.getElementById("btnContinueJudge").disabled = true;
    document.getElementById("btnCancelJudge").disabled = true;
    document.getElementById("tbModifyJudges").selectedIndex = "-1";
    document.getElementById("tbModifyJudges").disabled = true;

    document.getElementById("txtFNameJudge").value = '';
    document.getElementById("txtLNameJudge").value = '';
    document.getElementById("txtUserJudge").value = '';
    document.getElementById("txtPassJudge").value = '';
}

function clickModifyJudge() {
    var oldFname = modifyFName;
    var oldLname = modifyLName;
    var oldUname = modifyUName;
    var oldPass = modifyPword;

    var newFname = document.getElementById('txtFNameJudge').value.trim();
    var newLname = document.getElementById('txtLNameJudge').value.trim();
    var newUname = document.getElementById('txtUserJudge').value.trim();
    var newPass = document.getElementById('txtPassJudge').value.trim();
    if (action === "Edit") {

        //fill-out necessary action
        var input, filter, table, tr, td, i, found = false;
        input = document.getElementById("txtUserJudge").value.trim();
        filter = input.toUpperCase();
        table = document.getElementById("tbModifyJudges");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    found = true;
                }

            }
        }
        table = document.getElementById("tbAddJudges");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    found = true;
                }

            }
        }
        if (found === true && (newUname.toUpperCase() !== oldUname.toUpperCase()))
        {
            //if (oldFname == newFname && oldLname == newLname && oldUname == newUname && oldPass == newPass)
            //{
            //    alert('No changes were found. The editing will not continue');
            //}
            alert('The username ' + input + ' is already taken. Choose another username');
        }
        else
        {
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
                    alert('The account "' + oldUname + '" has been edited' );
                    PopulateJudges();
                },
                error: function (msg) {
                    alert('Error Retrieving PersonID');
                }
            });
        }
    }
    else if (action === "Add") {
        //fill-out necessary action
        var fname = document.getElementById("txtFNameJudge").value;
        var lname = document.getElementById("txtLNameJudge").value;
        var uname = document.getElementById("txtUserJudge").value;
        var pass = document.getElementById("txtPassJudge").value;

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
    else if (action === "Remove") {

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

    clickCancel();


}

function PopulateJudges() {
    //document.getElementById('tbAddJudges').options.length = 0;
    //document.getElementById('slModifyCriteria').options.length = 0;
    eventID = sessionStorage.getItem("EventID");
    console.log('EventID = ' + eventID);
    $("#tbAddJudges tbody").empty(); 
    $("#tbModifyJudges tbody").empty(); 
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
                $('#tbAddJudges').append(
                    '<tr><td>' + item.FirstName + '</td><td>' + item.LastName + '</td><td>' + item.judgeUname + '</td><td>' + item.judgePword + '</td></tr>');
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
                $('#tbModifyJudges').append(
                    '<tr><td>' + item.FirstName + '</td><td>' + item.LastName + '</td><td>' + item.judgeUname + '</td><td>' + item.judgePword + '</td></tr>');
            });
        },
        error: function (msg) {
            alert('Error Retrieving Judge List');
        }
    });
}