var selected, modify, input, fName, lName, action, personid; 
//REPLACE THIS PART OF THE CODE WITH ACTUAL JUDGE ID / EVENT ID FROM LOGIN SCREEN
var eventID = 1;
var judgeID;
//eto nalang palitan natin para di na nakakalito
//var service = 'http://192.168.43.238/uvtest2/service.svc/';
var service = 'http://localhost/uvtest2/service.svc/';


//selects from slAddContestant

$('#tbAddContestant tbody ').on("click touchstart", "a", function (e) {
    //gets data
    var currentRow = $(this).closest('tr')
    currentRow.addClass("selected").siblings().removeClass("selected");
    fName = currentRow.find("td:first").html();
    lName = currentRow.find("td:nth-child(2)").html();
    personid = currentRow.find("td:nth-child(3)").html();
    console.log(fName);
    clickAddContestant();

});

//click btnAddContestant
function clickAddContestant() {
    console.log("value in fname: " + fName);
    console.log("value in lname: " + lName);
    $.ajax({
        type: 'POST',
        url: service + 'KFspAddExistingPersontoContestant',
        //data: {
        //    'fname': fName,
        //    'lname': lName,
        //    'eventID': eventID
        //}
        data:
        '{' +
        '"fname":"' + fName + '",' +
        '"lname":"' + lName + '",' +
        '"eventID":"' + eventID + '",' +
        '}',

        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            alert("A new contestant has been added!!");
            PopulateContestants();
        }
        ,
        error: function (msg) {
            alert(msg.responseText);
        }
    });

    
}


//selects from slModifyContestant
$("#slModifyContestant").on("change", function (e) {
    modify = $("#slModifyContestant option:selected").text();
    input = modify.split(" ");
    fName = input[0];
    lName = input[1];

    document.getElementById("txtFirstName").value = fName;
    document.getElementById("txtLastName").value = lName;

});

$("#btnEdit, #btnRemove, #btnAdd").click(function (e) {
    document.getElementById("btnContinue").disabled = false;
    document.getElementById("btnCancel").disabled = false;

    if (e.target.id === "btnEdit")
    {
        action = "Edit";
        //document.getElementById("btnAdd").disabled = true;
        //document.getElementById("btnRemove").disabled = true;
        document.getElementById("txtFirstName").disabled = false;
        document.getElementById("txtLastName").disabled = false;
        document.getElementById("txtFirstName").value = null;
        document.getElementById("txtLastName").value = null;
        document.getElementById("slModifyContestant").disabled = false;
    }
    else if (e.target.id === "btnAdd")
    {
        action = "Add";
        //document.getElementById("btnEdit").disabled = true;
        //document.getElementById("btnRemove").disabled = true;
        document.getElementById("txtFirstName").disabled = false;
        document.getElementById("txtLastName").disabled = false;
        document.getElementById("txtFirstName").value = null;
        document.getElementById("txtLastName").value = null;
        document.getElementById("slModifyContestant").disabled = true;
    }
    else if (e.target.id === "btnRemove")
    {
        action = "Remove";
        //document.getElementById("btnEdit").disabled = true;
        //document.getElementById("btnAdd").disabled = true;
        document.getElementById("txtFirstName").value = null;
        document.getElementById("txtLastName").value = null;
        document.getElementById("txtFirstName").disabled = true;
        document.getElementById("txtLastName").disabled = true;
        document.getElementById("slModifyContestant").disabled = false;
    }
    
});


function clickCancel() {
    //reset
    document.getElementById("btnEdit").disabled = false;
    document.getElementById("btnAdd").disabled = false;
    document.getElementById("btnRemove").disabled = false;
    document.getElementById("btnContinue").disabled = true;
    document.getElementById("btnCancel").disabled = true;
    document.getElementById("slModifyContestant").selectedIndex = "-1";
    document.getElementById("slModifyContestant").disabled = true;


    document.getElementById("txtFirstName").value = "";
    document.getElementById("txtLastName").value = "";
}

function clickModifyContestant() {


    fName = document.getElementById("txtFirstName").value.trim();
    lName = document.getElementById("txtLastName").value.trim();
    //dunno about de image

    if (action === "Edit") {
        //fill-out necessary action
        var slModifyContestant = document.getElementById("slModifyContestant");
        var slName = slModifyContestant.options[slModifyContestant.selectedIndex].text;
        var perid = slModifyContestant.options[slModifyContestant.selectedIndex].value;
        var splitName = slName.split(' ');
        var oldfName = splitName[0];
        var oldlName = splitName[1];
        $.ajax({
            type: 'POST',
            url: service + 'KFspUpdateContestant',
            data:
            '{' +
            '"fname":"' + fName + '",' +
            '"lname":"' + lName + '",' +
            '"perid":"' + perid + '",' +
            '}',

            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {
                alert(oldfName + " " + oldlName + " has been changed to " + fName + ' ' + lName);
                PopulateContestants();
            }
            ,
            error: function (msg) {
                alert(msg.responseText);
            }
        });
    }
    else if (action === "Add") {
        //fill-out necessary action
        var found = false;
        var filter = fName + ' ' + lName;
        var select = document.getElementById("slModifyContestant");
        var a = select.getElementsByTagName("option");
        for (i = 0; i < a.length; i++) {
            if (a[i].text.toUpperCase() === filter.toUpperCase()) {
                found = true;
            }
        }
        select = document.getElementById("slAddContestant");
        a = select.getElementsByTagName("option");
        for (i = 0; i < a.length; i++) {
            if (a[i].text.toUpperCase() === filter.toUpperCase()) {
                found = true;
            }
        }
        if (found === true) {
            alert(filter + " is already in the list of possible contestants. Add the person using the selection box above.");
        }
        else
        {
            $.ajax({
                type: 'POST',
                url: service + 'KFspAddPersonToContestant',
                data:
                '{' +
                '"fname":"' + fName + '",' +
                '"lname":"' + lName + '",' +
                '"eventID":"' + eventID + '",' +
                '}',

                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                processdata: true,
                success: function (result) {
                    alert(fName + " " + lName + " has been added to the contest!");
                    PopulateContestants();
                }
                ,
                error: function (msg) {
                    alert(msg.responseText);
                }
            });
        }
        
    }
    else if (action === "Remove")
    {
        //fill-out necessary action
        $.ajax({
            type: 'POST',
            url: service + 'KFspRemoveContsestantFromEvent',
            data:
            '{' +
            '"fname":"' + fName + '",' +
            '"lname":"' + lName + '",' +
            '"eventid":"' + eventID + '",' +
            '}',

            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {
                alert(fName + " " + lName + " has been removed from the contest!");
                PopulateContestants();
            }
            ,
            error: function (msg) {
                alert(msg.responseText);
            }
        });
    }

//    clickCancel();


}

function PopulateContestants() {
    $("#tbAddContestant tbody").empty(); 
    document.getElementById('slModifyContestant').options.length = 0;
    eventID = sessionStorage.getItem("EventID");
    console.log('EventID = ' + eventID);
    $.ajax({
        type: 'GET',
        url: service + 'KFspViewNotEventContestants',
        data: {
            'eventid': eventID
        },
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            var varArResult = JSON.parse(result.KFspViewNotEventContestantsResult);
            console.log(varArResult);
            $.each(varArResult, function (i, item) {
                $('#tbAddContestant').append(
                    '<tr><td>' + item.FirstName + '</td><td>' + item.LastName + '</td><td>' + item.PersonID + '</td><td><a href="#" class="addrow" >Add Contestant</a></td>' + '</tr>');
            });
        },
        error: function (msg) {
            alert('Error Retrieving Available Contestants List');
        }
    });

    $.ajax({
        type: 'GET',
        url: service + 'MCspViewContestantsEvent',
        data: {
            'EventID': eventID
        },
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            var varArResult = JSON.parse(result.MCspViewContestantsEventResult);
            console.log(varArResult);
            for (intCtr in varArResult) {
                var slModifyContestant = document.getElementById('slModifyContestant');
                var option = document.createElement('option');
                option.text = varArResult[intCtr].name;
                option.value = varArResult[intCtr].PersonID;
                slModifyContestant.add(option);
            }
        },
        error: function (msg) {
            alert('Error Retrieving Contestants List');
        }
    });
}

