var selected, modify, input, fName, lName, action;
var newCname, newWeight, oldCname, oldWeight;
//REPLACE THIS PART OF THE CODE WITH ACTUAL JUDGE ID / EVENT ID FROM LOGIN SCREEN
var eventID = 1;
var judgeID;
//eto nalang palitan natin para di na nakakalito
var service = 'http://localhost/uvtest2/service.svc/';

//selects from slAddCriteria
$("#slAddCriteria").click(function () {

    //gets data
    selected = $("#slAddCriteria option:selected").text();
    document.getElementById("txtAddWeight").disabled = false;
    document.getElementById("btnAddCriteria").disabled = false;

});

//click btnAddCriteria
function clickAddCriteria() {
    //var slCriteria = document.getElementById("slAddCriteria");
    //var slName = slAddCriteria.options[slAddCriteria.selectedIndex].text;
    //var slValue = slAddCriteria.options[slAddCriteria.selectedIndex].value;
    var weight = document.getElementById("txtAddWeight").value;
    var cname = selected;
    if (weight == '')
    {
        alert("Please assign a weight for the criteria");
    }
    else
    {
        $.ajax({
            type: 'POST',
            url: service + 'spAddOldCriteriaToEventCriteria',
            //data: {
            //    'fname': fName,
            //    'lname': lName,
            //    'eventID': eventID
            //}
            data:
            '{' +
            '"cname":"' + cname + '",' +
            '"weight":"' + weight + '",' +
            '"eventid":"' + eventID + '",' +
            '}',

            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {
                alert("A new criteria has been added!!");
                PopulateCriteria();
            }
            ,
            error: function (msg) {
                alert(msg.responseText);
            }
        });
        document.getElementById("slAddCriteria").selectedIndex = "-1";
        document.getElementById("btnAddCriteria").disabled = true;
        document.getElementById("txtAddWeight").value = null;
    }
}


//selects from slModifyCriteria
$("#slModifyCriteria").click(function () {
    modify = $("#slModifyCriteria option:selected").text();
    var weight = $("#slModifyCriteria option:selected").val();
    document.getElementById("txtModifyCname").value = modify;
    document.getElementById("txtModifyWeight").value = weight;

});

$("#btnEdit, #btnRemove, #btnAdd").click(function (e) {
    document.getElementById("btnContinue").disabled = false;
    document.getElementById("btnCancel").disabled = false;

    if (e.target.id === "btnEdit") {
        action = "Edit";
        //document.getElementById("btnAdd").disabled = true;
        //document.getElementById("btnRemove").disabled = true;
        document.getElementById("txtModifyCname").disabled = false;
        document.getElementById("txtModifyWeight").disabled = false;
        document.getElementById("txtModifyCname").value = null;
        document.getElementById("txtModifyWeight").value = null;
        document.getElementById("slModifyCriteria").disabled = false;
    }
    else if (e.target.id === "btnAdd") {
        action = "Add";
        //document.getElementById("btnEdit").disabled = true;
        //document.getElementById("btnRemove").disabled = true;
        document.getElementById("txtModifyCname").disabled = false;
        document.getElementById("txtModifyWeight").disabled = false;
        document.getElementById("txtModifyCname").value = null;
        document.getElementById("txtModifyWeight").value = null;
        document.getElementById("slModifyCriteria").disabled = true;
    }
    else if (e.target.id === "btnRemove") {
        action = "Remove";
        //document.getElementById("btnEdit").disabled = true;
        //document.getElementById("btnAdd").disabled = true;
        document.getElementById("txtModifyWeight").value = null;
        document.getElementById("txtModifyWeight").disabled = true;
        document.getElementById("txtModifyCname").value = null;
        document.getElementById("txtModifyCname").disabled = true;
        document.getElementById("slModifyCriteria").disabled = false;
    }

});


function clickCancel() {
    //reset
    document.getElementById("btnEdit").disabled = false;
    document.getElementById("btnAdd").disabled = false;
    document.getElementById("btnRemove").disabled = false;
    document.getElementById("btnContinue").disabled = true;
    document.getElementById("btnCancel").disabled = true;
    document.getElementById("slModifyCriteria").selectedIndex = "-1";
    document.getElementById("slModifyCriteria").disabled = true;
    document.getElementById("txtModifyCname").value = null;
    document.getElementById("txtModifyWeight").value = null;

}

function clickModifyCriteria() {
    var weight = document.getElementById("txtModifyWeight").value;
    var cname = document.getElementById("txtModifyCname").value.trim();
    oldCname = $("#slModifyCriteria option:selected").text();
    oldWeight = $("#slModifyCriteria option:selected").val();
    newWeight = document.getElementById("txtModifyWeight").value;
    newCname = document.getElementById("txtModifyCname").value.trim();
    if (action === "Edit") {
        //fill-out necessary action
        var slModifyCriteria = document.getElementById("slModifyCriteria");
        var found = false;
        var filter = cname;
        var select = document.getElementById("slModifyCriteria");
        var a = select.getElementsByTagName("option");
        for (i = 0; i < a.length; i++) {
            if (a[i].text.toUpperCase() == filter.toUpperCase()) {
                found = true;
            }
        }
        select = document.getElementById("slAddCriteria");
        a = select.getElementsByTagName("option");
        for (i = 0; i < a.length; i++) {
            if (a[i].text.toUpperCase() == filter.toUpperCase()) {
                found = true;
            }
        }
        if (found == true) {
            alert(filter + " is already in the list of possible criteria.");
        }
        else if (cname == '' || weight == '') {
            alert('Please complete all fields');
        }
        else
        {
            //call wcf to get criteria id
            $.ajax({
                type: 'GET',
                url: service + 'spCheckcnameavailability',
                data: {
                    'cname': oldCname
                },
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                processdata: true,
                success: function (result) {
                    var varArResult = JSON.parse(result.spCheckcnameavailabilityResult);
                    console.log(varArResult);
                    var critid = varArResult[0].CriteriaID;
                    $.ajax({
                        type: 'POST',
                        url: service + 'spUpdateEventCriteria',
                        data:
                        '{' +
                        '"cname":"' + newCname + '",' +
                        '"weight":"' + newWeight + '",' +
                        '"eventid":"' + eventID + '",' +
                        '"critid":"' + critid + '",' +
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
                    alert(oldCname + ": " + oldWeight + " has been changed to " + newCname + ': ' + newWeight);
                    PopulateCriteria();
                },
                error: function (msg) {
                    alert('Error Retrieving Available Criteria List');
                }
            });
        }
        
    }
    else if (action === "Add") {
        //fill-out necessary action
        var found = false;
        var filter = cname;
        var select = document.getElementById("slModifyCriteria");
        var a = select.getElementsByTagName("option");
        for (i = 0; i < a.length; i++) {
            if (a[i].text.toUpperCase() == filter.toUpperCase()) {
                found = true;
            }
        }
        select = document.getElementById("slAddCriteria");
        a = select.getElementsByTagName("option");
        for (i = 0; i < a.length; i++) {
            if (a[i].text.toUpperCase() == filter.toUpperCase()) {
                found = true;
            }
        }
        if (found == true) {
            alert(filter + " is already in the list of possible criteria. Add the criteria using the selection box above.");
        }
        else if (cname == '' || weight == '')
        {
            alert('Please complete all fields');
        }
        else {
            $.ajax({
                type: 'POST',
                url: service + 'spAddCriteriaToEventCriteria',
                data:
                '{' +
                '"cname":"' + cname + '",' +
                '"weight":"' + weight + '",' +
                '"eventid":"' + eventID + '",' +
                '}',

                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                processdata: true,
                success: function (result) {
                    alert(cname + " has been added to the event criteria!");
                    PopulateCriteria();
                }
                ,
                error: function (msg) {
                    alert(msg.responseText);
                }
            });
        }

    }
    else if (action === "Remove") {
        //fill-out necessary action
        var cname = document.getElementById("txtModifyCname").value;
        var weight = document.getElementById("txtModifyWeight").value;
        if (cname == '') {
            alert("Please pick a criteria to be deleted");
        }
        else
        {
            $.ajax({
                type: 'POST',
                url: service + 'spRemoveCriteriaFromEventCriteria',
                data:
                '{' +
                '"cname":"' + cname + '",' +
                '"eventid":"' + eventID + '",' +
                '}',

                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                processdata: true,
                success: function (result) {
                    alert(cname + " has been removed from the event criteria!");
                    PopulateCriteria();
                }
                ,
                error: function (msg) {
                    alert(msg.responseText);
                }
            });
        }

    }

        clickCancel();


}

function PopulateCriteria() {
    document.getElementById('slAddCriteria').options.length = 0;
    document.getElementById('slModifyCriteria').options.length = 0;
    eventID = sessionStorage.getItem("EventID");
    console.log('EventID = ' + eventID);
    $.ajax({
        type: 'GET',
        url: service + 'spViewNotEventCriteria',
        data: {
            'eventid': eventID
        },
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            var varArResult = JSON.parse(result.spViewNotEventCriteriaResult);
            console.log(varArResult);
            for (intCtr in varArResult) {
                var slAddCriteria = document.getElementById('slAddCriteria');
                var option = document.createElement('option');
                option.text = varArResult[intCtr].CriteriaName;
                //option.value = varArResult[intCtr].PersonID;
                slAddCriteria.add(option);
            }
        },
        error: function (msg) {
            alert('Error Retrieving Available Criteria List');
        }
    });

    $.ajax({
        type: 'GET',
        url: service + 'spViewEventCriteria',
        data: {
            'eventid': eventID
        },
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            var varArResult = JSON.parse(result.spViewEventCriteriaResult);
            console.log(varArResult);
            for (intCtr in varArResult) {
                var slModifyCriteria = document.getElementById('slModifyCriteria');
                var option = document.createElement('option');
                option.text = varArResult[intCtr].CriteriaName;
                option.value = varArResult[intCtr].Weight;
                slModifyCriteria.add(option);
            }
        },
        error: function (msg) {
            alert('Error Retrieving Criteria List');
        }
    });
}

