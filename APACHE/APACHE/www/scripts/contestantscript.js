var selected, modify, input, fName, lName, action, personid; 
//REPLACE THIS PART OF THE CODE WITH ACTUAL JUDGE ID / EVENT ID FROM LOGIN SCREEN
var eventID = 1;
var judgeID;
//eto nalang palitan natin para di na nakakalito
var service = 'http://192.168.43.238/uvtest2/service.svc/';
//var service = 'http://localhost/uvtest2/service.svc/';


//selects from slAddContestant

$('#tbAddContestant tbody ').on("click touchstart", "a", function (e) {
    //gets data
    var currentRow = $(this).closest('tr');
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

function clickAddNewContestant() {
    //fill-out necessary action
    var input1, input2, filter, table, tr, td, i, found = false;
    input1 = document.getElementById("txtAddFirstName").value.trim();
    input2 = document.getElementById("txtAddLastName").value.trim();
    fname = input1;
    lname = input2;
    filter1 = input1.toUpperCase();
    filter2 = input2.toUpperCase();
    table = document.getElementById("tbModifyContestant");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            if (td.innerHTML.toUpperCase() === filter1) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    if (td.innerHTML.toUpperCase() === filter2) {
                        found = true;
                    }
                }
            }
        }

    }
    table = document.getElementById("tbAddContestant");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            if (td.innerHTML.toUpperCase() === filter1) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    if (td.innerHTML.toUpperCase() === filter2) {
                        found = true;
                    }
                }
            }
        }

    }

    if (found) {
        alert(fname + ' ' + lname + " is already in the list of possible contestants. Add the person using the selection box above.");
    }
    else {
        $.ajax({
            type: 'POST',
            url: service + 'KFspAddPersonToContestant',
            data:
            '{' +
            '"fname":"' + fname + '",' +
            '"lname":"' + lname + '",' +
            '"eventID":"' + eventID + '",' +
            '}',

            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {
                alert(fname + " " + lname + " has been added to the contest!");
                PopulateContestants();
                document.getElementById("txtAddFirstName").value='';
                document.getElementById("txtAddLastName").value='';
            }
            ,
            error: function (msg) {
                alert(msg.responseText);
            }
        });
    }


}

$('#tbModifyContestant tbody').on("click touchstart", "a", function (e) {

    var currentRow = $(this).closest('tr');
    currentRow.addClass("selected").siblings().removeClass("selected");

    var fName = currentRow.find("td:first").html();
    var lName = currentRow.find("td:nth-child(2)").html();
    

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
});


$('#tbModifyContestant tbody').on("click touchstart", "input", function (e) {

    var currentRow = $(this).closest('tr');
    currentRow.addClass("selected").siblings().removeClass("selected");
    fName = currentRow.find("td:first").html();
    lName = currentRow.find("td:nth-child(2)").html();
    personid = currentRow.find("td:nth-child(3)").html();


    document.getElementById("txtFirstName").value = fName;
    document.getElementById("txtLastName").value = lName;

    document.getElementById('btnEdit').disabled = false;
    document.getElementById("txtFirstName").disabled = false;
    document.getElementById("txtLastName").disabled = false;

});

function clickModifyContestant() {
    //fill-out necessary action
    var input1, input2, filter, table, tr, td, i, found = false;
    input1 = document.getElementById("txtFirstName").value.trim();
    input2 = document.getElementById("txtLastName").value.trim();
    fname = input1;
    lname = input2;
    filter1 = input1.toUpperCase();
    filter2 = input2.toUpperCase();
    table = document.getElementById("tbModifyContestant");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            if (td.innerHTML.toUpperCase() === filter1) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    if (td.innerHTML.toUpperCase() === filter2) {
                        found = true;
                    }
                }
            }
        }

    }
    table = document.getElementById("tbAddContestant");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            if (td.innerHTML.toUpperCase() === filter1) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    if (td.innerHTML.toUpperCase() === filter2) {
                        found = true;
                    }
                }
            }
        }

    }
    if (found) {
        alert(fname + ' ' + lname + " is an already registered contestant. Cannot edit");
    }
    $.ajax({
        type: 'POST',
        url: service + 'KFspUpdateContestant',
        data:
        '{' +
        '"fname":"' + fname + '",' +
        '"lname":"' + lname + '",' +
        '"perid":"' + personid + '",' +
        '}',

        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            alert(fName + " " + lName + " has been changed to " + fname + ' ' + lname);
            PopulateContestants();
        }
        ,
        error: function (msg) {
            alert(msg.responseText);
        }
    });

}

function PopulateContestants() {
    $("#tbAddContestant tbody").empty(); 
    $("#tbModifyContestant tbody").empty(); 
    document.getElementById("txtFirstName").value = '';
    document.getElementById("txtLastName").value = '';
    document.getElementById("txtAddFirstName").value = '';
    document.getElementById("txtAddLastName").value = '';

    document.getElementById('btnEdit').disabled = true;
    document.getElementById("txtFirstName").disabled = true;
    document.getElementById("txtLastName").disabled = true;

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
                    '<tr><td>' + item.FirstName + '</td><td>' + item.LastName + '</td><td>' + item.PersonID + '</td><td><a href="#" class="addrow" ><input type="checkbox" /></a></td>' + '</tr>');
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

            $.each(varArResult, function (i, item) {
                var input = item.name.split(" ");
                fName = input[0];
                lName = input[1];
                //$('#tbModifyContestant').append(
                //    '<tr><td>' + fName + '</td><td>' + lName + '</td><td>' + item.PersonID + '</td><td><a href="#" class="delrow" >Remove Contestant</a></td></td><td><input type="radio" name ="edit"></td>' + '</tr>' );

                $('#tbModifyContestant').append(
                    '<tr><td>' + fName + '</td><td>' + lName + '</td><td>' + item.PersonID + '</td><td><a href="#" class="delrow"><input type="checkbox"/></a></td></td><td><input type="radio" name ="edit"></td>' + '</tr>' );
            });
        },
        error: function (msg) {
            alert('Error Retrieving Contestants List');
        }
    });
}

