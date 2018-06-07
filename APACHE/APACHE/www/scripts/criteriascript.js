var selected, modify, input, cname, weight, action;
var newCname, newWeight, oldCname, oldWeight;
var totalWeight;
//REPLACE THIS PART OF THE CODE WITH ACTUAL JUDGE ID / EVENT ID FROM LOGIN SCREEN
var eventID = 1;
var judgeID;
//eto nalang palitan natin para di na nakakalito
var service = 'http://localhost/uvtest2/service.svc/';
//var service = 'http://192.168.43.238/uvtest2/service.svc/';


$('#tbAddCriteria tbody ').on("click touchstart", "input", function (e) {
    //gets data
    var currentRow = $(this).closest('tr')
    currentRow.addClass("selected").siblings().removeClass("selected");
    cname = currentRow.find("td:first").html();
    console.log(cname);
    $('#txtAddOldCriteriaName').val(cname);
    document.getElementById("btnAddCriteria").disabled = false;

});

//click btnAddCriteria
function clickAddCriteria() {
    console.log("value in cname: " + cname);
    console.log("value in weight: " + weight);
    weight = parseFloat($('#txtAddOldCriteriaWeight').val());
    if (isNaN(weight) || weight <= 0 || weight > 100 || weight != parseInt(weight, 10))
    {
        alert("Please assign a proper weight for the criteria");
    }
    else
    {
        getTotalWeight();
        if (totalWeight + weight > 100)
        {
            alert("Cannot add weight because the total goes over 100");
        }
        else {
            $.ajax({
                type: 'POST',
                url: service + 'spAddOldCriteriaToEventCriteria',
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
            document.getElementById("btnAddCriteria").disabled = true;
            document.getElementById("txtAddOldCriteriaWeight").value = '';
            document.getElementById("txtAddOldCriteriaName").value = '';

        }
    }

}

function clickAddNewCriteria()
{
    //fill-out necessary action
    getTotalWeight();
    var input, filter, table, tr, td, i, found = false;

    //fill-out necessary action
    input = document.getElementById("txtAddCriteriaName").value.trim(); 
    var cname = input;
    var weight = parseFloat(document.getElementById("txtAddCriteriaWeight").value);
    filter = input.toUpperCase();
    table = document.getElementById("tbAddCriteria");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            if (td.innerHTML.toUpperCase() === filter) {
                found = true;
            }

        }
    }
    table = document.getElementById("tbModifyCriteria");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            if (td.innerHTML.toUpperCase() === filter) {
                found = true;
            }

        }
    }
    if (found === true) {
        alert(filter + " is already in the list of possible criteria. Add the criteria using the selection box above.");
    }
    else if (cname === '' || isNaN(weight)) {
        alert('Please complete all fields');
    }
    else if (isNaN(weight) || weight <= 0 || weight > 100 || weight != parseInt(weight, 10)) {
        alert("Please assign a proper weight for the criteria");
    }
    else if (totalWeight + weight > 100) {
        alert("Cannot add weight because the total goes over 100");
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




$('#tbModifyCriteria tbody').on("click touchstart", "a", function (e) {

    var currentRow = $(this).closest('tr');
    currentRow.addClass("selected").siblings().removeClass("selected");

    var cname = currentRow.find("td:first").html();

    if (cname === '') {
        alert("Please pick a criteria to be deleted");
    }
    else {
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
});

$('#tbModifyCriteria tbody').on("click touchstart", "input", function (e) {
    //gets data
    var currentRow = $(this).closest('tr')
    currentRow.addClass("selected").siblings().removeClass("selected");
    oldCname = currentRow.find("td:first").html();
    oldWeight = parseInt(currentRow.find("td:nth-child(2)").html());
    console.log(oldCname);
    console.log(oldWeight);
    $('#txtModifyCriteriaName').val(oldCname);
    $('#txtModifyWeight').val(oldWeight);
    document.getElementById("txtModifyCriteriaName").disabled = false;
    document.getElementById("txtModifyWeight").disabled = false;
    document.getElementById("btnEdit").disabled = false;
});

function clickModifyCriteria() {
    var found, filter, select, a;
    newWeight = parseFloat(document.getElementById("txtModifyWeight").value);
    newCname = document.getElementById("txtModifyCriteriaName").value.trim();

        ////fill-out necessary action
        //found = false;
        //filter = cname;
        //select = document.getElementById("slModifyCriteria");
        //a = select.getElementsByTagName("option");
        //for (i = 0; i < a.length; i++) {
        //    if (a[i].text.toUpperCase() === filter.toUpperCase()) {
        //        found = true;
        //    }
        //}
        //if (oldCname === newCname)
        //{
        //    found = false;
        //}
        //select = document.getElementById("slAddCriteria");
        //a = select.getElementsByTagName("option");
        //for (i = 0; i < a.length; i++) {
        //    if (a[i].text.toUpperCase() === filter.toUpperCase()) {
        //        found = true;
        //    }
        //}
    getTotalWeight();
    var input, filter, table, tr, td, i, found = false;

    //fill-out necessary action
    filter = newCname.toUpperCase();
    table = document.getElementById("tbAddCriteria");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            if (td.innerHTML.toUpperCase() === filter) {
                found = true;
            }

        }
    }
    table = document.getElementById("tbModifyCriteria");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            if (td.innerHTML.toUpperCase() === filter) {
                found = true;
            }

        }
    }
    if (newCname === '' || isNaN(newWeight)) {
        alert('Please complete all fields');
    }
    else if (isNaN(newWeight) || newWeight <= 0 || newWeight > 100) {
        alert("Please assign a proper weight for the criteria");
    }
    else if (found === true) {
        if (oldCname === newCname) {
            getTotalWeight();
            if ((totalWeight - parseInt(oldWeight) + parseInt(newWeight)) > 100) {
                alert('Cannot edit weight because the total will be higher than 100');
            }
            else {
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
                        document.getElementById("txtModifyCriteriaName").disabled = true;
                        document.getElementById("txtModifyWeight").disabled = true;
                        document.getElementById("btnEdit").disabled = true;
                        PopulateCriteria();
                    },
                    error: function (msg) {
                        alert('Error Retrieving Available Criteria List');
                    }
                });
            }
        }
        else {
            alert(newCname + " is already in the list of possible criteria.");

        }
    }
    else {
        getTotalWeight();
        if ((totalWeight - parseInt(oldWeight) + parseInt(newWeight)) > 100) {
            alert('Cannot edit weight because the total will be higher than 100');
        }
        else {
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
                    document.getElementById("txtModifyCriteriaName").disabled = true;
                    document.getElementById("txtModifyWeight").disabled = true;
                    document.getElementById("btnEdit").disabled = true;
                    PopulateCriteria();
                },
                error: function (msg) {
                    alert('Error Retrieving Available Criteria List');
                }
            });
        }
        //call wcf to get criteria id

    }
}

function PopulateCriteria() {
    //document.getElementById('slAddCriteria').options.length = 0;
    //document.getElementById('slModifyCriteria').options.length = 0;
    //eventID = sessionStorage.getItem("EventID");
    $("#tbAddCriteria tbody").empty();
    $("#tbModifyCriteria tbody").empty(); 
    document.getElementById("txtAddCriteriaName").value = '';
    document.getElementById("txtAddCriteriaWeight").value = '';

    document.getElementById("txtModifyCriteriaName").value = '';
    document.getElementById("txtModifyWeight").value = '';


    totalWeight = 0;
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
            //var varArResult = JSON.parse(result.spViewNotEventCriteriaResult);
            //console.log(varArResult);
            //for (intCtr in varArResult) {
            //    var slAddCriteria = document.getElementById('slAddCriteria');
            //    var option = document.createElement('option');
            //    option.text = varArResult[intCtr].CriteriaName;
            //    //option.value = varArResult[intCtr].PersonID;
            //    slAddCriteria.add(option);
            //}

            var varArResult = JSON.parse(result.spViewNotEventCriteriaResult);
            console.log(varArResult);
            $.each(varArResult, function (i, item) {
                $('#tbAddCriteria').append(
                    '<tr><td>' + item.CriteriaName   + '</td><td><a href="#" class="addrow" ><input type="radio" name="hello"/></a></td>' + '</tr>');
            });
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

            $.each(varArResult, function (i, item) {
                $('#tbModifyCriteria').append( 
                    '<tr><td>' + item.CriteriaName + '</td><td class="criteriaWeight">' + item.Weight + '</td><td><a href="#" class="delrow"><input type="checkbox"/></a></td></td><td><input type="radio" name ="edit"></td>' + '</tr>');
            });
        },
        error: function (msg) {
            alert('Error Retrieving Criteria List');
        }
    });
}


function getTotalWeight()
{
    totalWeight = 0;
    $('#tbModifyCriteria tr').each(function () {
        totalWeight += parseInt($(this).find(".criteriaWeight").html());
        if (isNaN(totalWeight)) {
            totalWeight = 0;
        }
    });
    console.log("tweight : " + totalWeight);
    return totalWeight;
}