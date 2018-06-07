/***********************************
        SCRIPT FILE FOR WCF
 ***********************************/

var ipAddress = 'localhost'; //Use this if you need to change the ip address
var directory = 'UVSApp-WCF'; //Use this to change your WCF directory name (change to UVSApp-WCF to make life easier) 
//var service = 'http://' + ipAddress + '/' + directory + '/service.svc/'; 
//var service = 'http://192.168.43.238/uvtest2/service.svc/';
var service = 'http://localhost/uvtest2/service.svc/';

//index.html
function btnLogin_OnClick() {

    var struname = "";
    var strpass = "";
    var funcresult = "";
    var resulttable = "";

    struname = document.getElementById("txtUsername").value;
    strpass = document.getElementById("txtPassword").value;


    if ((struname.length < 1) || (strpass.length < 1)) {
        alert("Invalid username and password!");
    }
    else {
        var Data = { uname: struname, pass: strpass };
        $.ajax({
            type: 'POST',
            url: service + 'index_login_OnClick',
            data: JSON.stringify(Data),
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {
                resulttable = JSON.parse(result.index_login_OnClickResult);
                console.log(result);
                console.log("resulttable :" + resulttable);
                console.log("Length: " + resulttable.length);
                console.log("account Type: " + resulttable[0].accounttype);
                console.log(resulttable); //show array
                if (resulttable[0].accounttype === "4") {
                    alert("no account found, sad");
                }
                else {
                    console.log("  account found, yey");
                    if (resulttable[0].accounttype === "1") {  //judge
                        //redirect sa home.html
                        sessionStorage.setItem("judgeid", resulttable[0].JudgeID);
                        console.log(sessionStorage.getItem("judgeid"));
                        sessionStorage.setItem("personid", resulttable[0].PersonID);
                        console.log(sessionStorage.getItem("personid"));
                        sessionStorage.setItem("accountype", resulttable[0].accounttype);
                        console.log(sessionStorage.getItem("accountype"));
                        setTimeout(window.location.replace("home.html"), 3000);
                    }
                    else if (resulttable[0].accounttype === "2") {
                        //redirect sa event finalizing
                        sessionStorage.setItem("EventID", resulttable[0].EventID);
                        console.log(sessionStorage.getItem("EventID"));
                        setTimeout(window.location.replace("judgeTab.html"), 3000);
                    }
                    else {
                        alert("Event is already finalized");
                    }

                }

            },
            error: function (msg) {
                alert(msg.responseText);
            }
        });
    }
}
function clearsession() {
    sessionStorage.clear();
}

//createevent.html
function btnCreateEvent() {
    var fname = document.getElementById('txtFN').value;
    var lname = document.getElementById('txtLN').value;
    var uname = document.getElementById('txtUsername').value;
    var pname = document.getElementById('txtPassword').value;
    var ename = document.getElementById('txtEventName').value;

    $.ajax({
        type: 'GET',
        url: service + 'KFspCheckEventAccount',
        data: {
            'epname': pname,
            'euname': uname
        },
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            var varArResult = JSON.parse(result.KFspCheckEventAccountResult);
            console.log(varArResult === null);
            if ($.trim(varArResult)) {
                alert("Event Account already Exists");
            }
            else
            {

                $.ajax({
                    type: 'GET',
                    url: service + 'KFspCheckEventPerson',
                    data: {
                        'efname': fname,
                        'elname': lname
                    },
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    processdata: true,
                    success: function (result) {
                        var varArResult = JSON.parse(result.KFspCheckEventPersonResult);
                        console.log(varArResult);
                        if ($.trim(varArResult)) {
                            alert("Person Name already Exists");
                        }
                        else
                        {
                            $.ajax({
                                type: 'GET',
                                url: service + 'KFspCheckEventName',
                                data: {
                                    'ename': ename
                                },
                                contentType: 'application/json;charset=utf-8',
                                dataType: 'json',
                                processdata: true,
                                success: function (result) {
                                    var varArResult = JSON.parse(result.KFspCheckEventNameResult);
                                    console.log(varArResult);
                                    if ($.trim(varArResult)) {
                                        alert("Event Name already Exists");
                                    }
                                    else
                                    {
                                        $.ajax({
                                            type: 'POST',
                                            url: service + 'KFspCreateEvent',
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
                                                $("lblError").text("Please check your inputs and try again");
                                                $("lblError").css('display', 'block');
                                            }
                                        });
                                    }
                                },
                                error: function (msg) {
                                    alert('Error in account creation');
                                }
                            });
                        }
                    },
                    error: function (msg) {
                        alert('Error in account creation');
                    }
                });

                
            }
        },
        error: function (msg) {
            alert('Error in account creation');
        }
    });

    
}

//home.html
function checksession() {
    console.log("person id " + sessionStorage.getItem("personid"));
    console.log("account type" + sessionStorage.getItem("accountype"));
    console.log("judge id" + sessionStorage.getItem("judgeid"));

    var judgeID = sessionStorage.getItem("judgeid");
    var personid = sessionStorage.getItem("personid");
    var ddlEvent = document.getElementById('ddlEvents');
    var option = document.createElement('option');
    var name = "";

    if ((judgeID === null) || (personid === null)) {
        alert("You should not be here, redirecting..");
        setTimeout(window.location.replace("index.html"), 3000);
    }

    $.ajax({
        type: 'GET',
        url: service + 'spViewJudgeUsingJudgeID',
        data: {
            'JudgeID': judgeID
        },
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {

            var varArResult = JSON.parse(result.spViewJudgeUsingJudgeIDResult);
            console.log(varArResult);
            for (intCtr in varArResult) {
                var ddlEvent = document.getElementById('ddlEvents');
                var option = document.createElement('option');
                option.text = varArResult[intCtr].EventName;
                option.value = varArResult[intCtr].EventID;
                ddlEvent.add(option);
                if (varArResult[intCtr].PersonID === personid) {
                    var name = "Hi " + varArResult[intCtr].FirstName + " " + varArResult[intCtr].LastName + "!";
                    console.log(name);
                    document.getElementById('judgename').innerText = name;
                }
            }
            eventselectchange(document.getElementById('ddlEvents'));
        },
        error: function (msg) {
            alert('Error Retrieving Events list');
        }
    });
}
function eventselectchange(sel) {

    var Data = { EventID: sel.value };
    console.log("event id value from selection: " + sel.value);
    sessionStorage.setItem("EventName", sel.options[sel.selectedIndex].text);

    $.ajax({
        type: 'GET',
        url: service + 'home_eventselect_change',
        data: {
            'EventID': sel.value
        },
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {

            var varArResult = JSON.parse(result.home_eventselect_changeResult);

            $('#ddlParticipants option').remove();

            for (intCtr in varArResult) {
                var ddlParticipant = document.getElementById('ddlParticipants');
                var option = document.createElement('option');

                option.text = varArResult[intCtr].FirstName + " " + varArResult[intCtr].LastName;
                option.value = varArResult[intCtr].ContestantID;
                ddlParticipants.add(option);


            }
            sessionStorage.setItem("EventID", sel.value);
        },
        error: function (msg) {
            alert('Error Retrieving Contestants for Event');
        }
    });
}
function contestantselect() {
    var choice = document.getElementById("ddlParticipants");
    if (choice.value !== "") //error check to prevent selecting on blank space in second select area
    {
        sessionStorage.setItem("contestantID", choice.value);
        console.log("contestant id: " + sessionStorage.getItem("contestantID"));

        //getting eventjudge id based from event and judge
        $.ajax({
            type: 'GET',
            url: service + 'home_get_eventjudgeid',
            data: {
                'EventID': sessionStorage.getItem("EventID"),
                'judgeid': sessionStorage.getItem("judgeid")
            },
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {

                var varArResult = JSON.parse(result.home_get_eventjudgeidResult);
                console.log("Event Judges ID: " + varArResult[0].EventJudgesID);
                sessionStorage.setItem("EventJudgeID", varArResult[0].EventJudgesID);

                setTimeout(window.location.replace("profile.html"));


            },
            error: function (msg) {
                alert('Error Retrieving Events list');
            }
        });

    }


}
function gotoresults() {

    setTimeout(window.location.replace("results.html"));

}

//profile.html
function loadcontestant() {
    var conid = sessionStorage.getItem("contestantID");
    var ejid = sessionStorage.getItem("EventJudgeID");
    console.log(sessionStorage.getItem("EventName"));
    console.log("contestant id: " + conid);
    console.log("Event judge id :" + ejid)
    if (conid === null) {
        alert("You should not be here, redirecting..");
        setTimeout(window.location.replace("home.html"), 3000);
    }

    else {
        $.ajax({
            type: 'GET',
            url: service + 'MCspViewContestant',
            data: { 'ContestantID': conid },
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {

                var myresult = JSON.parse(result.MCspViewContestantResult);
                console.log("Contestant:");
                console.log(myresult);
                document.getElementById("contestantname").innerText = myresult[0].FirstName + " " + myresult[0].LastName + " #" + myresult[0].ContestantNumber;
                document.getElementById("mypic").src = "images/" + myresult[0].PersonID + ".jpg";
                document.getElementById("mypic").alt = "Person With personid=" + myresult[0].PersonID + " picture should be here";
            },
            error: function (msg) {
                alert('Error Contacting Server, please try again later.');
            }
        });

        $.ajax({
            type: 'GET',
            url: service + 'home_get_criteriawithscore',
            data: { 'ejid': ejid, 'conid': conid },
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {
                var x = 0;
                var myresult = JSON.parse(result.home_get_criteriawithscoreResult);
                console.log("Result of eventjudgeID");
                for (intctr in myresult) {
                    $('#mytable tbody').append('<tr id=tblrow' + intctr + '><td id=crit' + intctr + '>' + myresult[intctr].CriteriaName + '</td><td><input id="sr' + intctr + '" name="' + myresult[intctr].EventCriteriaID + '" type="range" min="1" step="1" max="10" list="tickmarks" value="' + myresult[intctr].Score + '" onchange="assignnumber(this,' + intctr + ')" class="input-transparent" /><h4 id="tv' + intctr + '">' + myresult[intctr].Score + '</h4></td></tr>');
                    x++;
                }

                console.log("current score data obtained:");
                console.log(myresult);
            },
            error: function (msg) {
                alert('Error Contacting Server, please try again later.');
            }
        });


    };

}
function assignnumber(input, selectornumber) {

    var x = document.getElementById("sr" + selectornumber).value;
    var conid = sessionStorage.getItem("contestantID");
    var ejid = sessionStorage.getItem("EventJudgeID");
    document.getElementById("tv" + selectornumber).innerText = x;

    // console.log("On row:" + selectornumber);
    //console.log(input.name);
    //add score to person
    $.ajax({
        type: 'GET',
        url: service + 'MCspUpdateScore',
        data: {
            'EventJudgeID': ejid,
            'ContestantID': conid,
            'EventCriteriaID': input.name,
            'Score': x

        },
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {
            console.log("Update complete");

        },
        error: function (msg) {
            alert('Error Contacting Server, please try again later.');
        }
    });


}
function profilechecksession()
{
    var conid = sessionStorage.getItem("contestantID");
    var ejid = sessionStorage.getItem("EventJudgeID");
    console.log(sessionStorage.getItem("EventName"));
    console.log("contestant id: " + conid);
    console.log("Event judge id :" + ejid)


    if (conid === null) {
        alert("You should not be here, redirecting..");
        setTimeout(window.location.replace("home.html"), 3000);
    }

    else {

        var mydata = { '_eventID': sessionStorage.getItem("EventID") };
        var hehe;

        $.ajax({
            type: 'POST',
            url: service + 'profile_get_eventstatus',
            data: JSON.stringify(mydata),
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            processdata: true,
            success: function (result) {

                hehe = result.profile_get_eventstatusResult;
                if (hehe === 'False') {
                    loadcontestant();
                }
                else {
                    document.getElementById("contestantname").innerText = "Event is Finished, All judges have already voted, Please visit Results page instead..";
                    document.getElementById("mytable").hidden = "true";
                    console.log("is false");
                }

            },
            error: function (msg) {
                alert('Error Contacting Server, please try again later.');
            }
        });


    };


   

}

//results.html
function displaycontestants() {
    var mydata = { '_eventID': sessionStorage.getItem("EventID") };
    $.ajax({
        type: 'POST',
        url: service + 'profile_get_loadcontestants',
        data: JSON.stringify(mydata),
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {

            var myresult = JSON.parse(result.profile_get_loadcontestantsResult);
            console.log(myresult);
            var x = 0;

            for (intctr in myresult) {
                $('#mytable tbody').append(' <tr id="tblrow' + [intctr] + '"><td id="con' + [intctr] + '"><h3 id="name' + [intctr] + '">' + myresult[intctr].Name + '</h3></td><td><h4 id="tv' + [intctr] + '">' + Math.round(myresult[intctr].FScore) + '</h4></td></tr>');
                x++;
            }
        },
        error: function (msg) {
            alert('Error Contacting Server, please try again later.');
        }
    });

}
function resultschecksession() {
    var conid = sessionStorage.getItem("contestantID");
    var ejid = sessionStorage.getItem("EventJudgeID");
    document.getElementById("resultname").innerText = "Event Results for " + sessionStorage.getItem("EventName");

    console.log("Event id: " + sessionStorage.getItem("EventID"));
    console.log("contestant id: " + conid);
    console.log("Event judge id :" + ejid)

    var mydata = { '_eventID': sessionStorage.getItem("EventID") };
    var hehe;
    $.ajax({
        type: 'POST',
        url: service + 'profile_get_eventstatus',
        data: JSON.stringify(mydata),
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        processdata: true,
        success: function (result) {

            hehe = result.profile_get_eventstatusResult;
            if (hehe === 'True') {
                displaycontestants();
            }
            else {
                document.getElementById("eventresultstatus").innerText = "Event is not yet Finished, There are Judges who have not yet voted";
                console.log("is false");
            }

        },
        error: function (msg) {
            alert('Error Contacting Server, please try again later.');
        }
    });

}

