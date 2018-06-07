var selected, modify, input, fName, lName, action;
//REPLACE THIS PART OF THE CODE WITH ACTUAL JUDGE ID / EVENT ID FROM LOGIN SCREEN
var eventID = 1;
var judgeID;
//eto nalang palitan natin para di na nakakalito
//var service = 'http://192.168.43.238/uvtest2/service.svc/';
var service = 'http://localhost/uvtest2/service.svc/';


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

function clickFinalize() {
    var sumCriteria = 0;
    var numJudge = -1;
    var numContestant = -1;
    $('#tbFinalizeCriterias tr').each(function () {
        sumCriteria += parseInt($(this).find(".criteriaWeight").html());
        if (isNaN(sumCriteria))
        {
            sumCriteria = 0;
        }
    });
    $('#tbFinalizeJudges tr').each(function (e) { numJudge++; });
    $('#tbFinalizeContestants tr').each(function (e) { numContestant++; });
    console.log(numJudge);
    console.log(numContestant);

    if (numJudge <= 0)
    {
        alert('Error, there are no judges for this event');
    }
    else if (sumCriteria < 100) {
        alert('Error, total criteria weight does not add up to 100%');
    }
    else if (numContestant === 0) {
        alert('Error, there are no contestants for this event');
    }
    else if (numContestant === 1) {
        alert('Error, there is only one contestant for this event');
    }
    else
    {
        if (confirm("WARNING: Finalizing an event means nothing can be changed afterwards. Are you sure you want to do this?")) {
            $.ajax({
                type: 'POST',
                url: service + 'KFspFinalizeEvent',
                data:
                '{' +
                '"eventid":"' + eventID + '"' +
                '}',

                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                processdata: true,
                success: function (result) {
                    alert("The event has been finalized! Returning to the homepage...");
                    setTimeout(window.location.replace("index.html"), 3000);
                }
                ,
                error: function (msg) {
                    alert(msg.responseText);
                }
            });
        }
        else {
            PopulateEvent();
        }
    }

}

function PopulateEvent() {
    //document.getElementById('tbAddJudges').options.length = 0;
    //document.getElementById('slModifyCriteria').options.length = 0;
    $("#tbFinalizeJudges tbody").empty();
    $("#tbFinalizeCriterias tbody").empty();
    $("#tbFinalizeContestants tbody").empty();
    eventID = sessionStorage.getItem("EventID");
    console.log('EventID = ' + eventID);
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
                $('#tbFinalizeJudges').append(
                    '<tr><td>' + item.FirstName + '</td><td>' + item.LastName + '</td><td>' + item.judgeUname + '</td><td>' + item.judgePword + '</td></tr>');
            });
        },
        error: function (msg) {
            alert('Error Retrieving Judge List');
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
                $('#tbFinalizeCriterias').append(
                    '<tr><td>' + item.CriteriaName + '</td><td class="criteriaWeight">' + item.Weight + '</td></tr>');
            });

        },
        error: function (msg) {
            alert('Error Retrieving Criteria List');
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
                $('#tbFinalizeContestants').append(
                    '<tr><td>' + item.name + '</td></tr>');
            });
        },
        error: function (msg) {
            alert('Error Retrieving Contestants List');
        }
    });
}

