var selected, modify, input, fName, lName, username, password, action;


//selects from tbAddJudges
$("#tbAddJudges tbody tr").click(function (e) {

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
    alert(fName + " " + lName + " " + username + " " + password);

    document.getElementById("btnAddExistJudge").disabled = true;

}

//selects from tbModifyJudges

$("#tbModifyJudges tbody tr").click(function (e) {

    //gets data
    $(this).addClass("selected").siblings().removeClass("selected");
    fName = $(this).find("td:first").html();
    lName = $(this).find("td:nth-child(2)").html();
    username = $(this).find("td:nth-child(3)").html();
    password = $(this).find("td:nth-child(4)").html();

    document.getElementById("txtFNameJudge").value = fName;
    document.getElementById("txtLNameJudge").value = lName;
    document.getElementById("txtUserJudge").value = username;
    document.getElementById("txtPassJudge").value = password;


});

$("#btnEditJudge, #btnRemoveJudge, #btnAddJudge").click(function (e) {
    document.getElementById("btnContinueJudge").disabled = false;
    document.getElementById("btnCancelJudge").disabled = false;
    if (e.target.id === "btnEditJudge") {
        action = "Edit";
        document.getElementById("btnAddJudge").disabled = true;
        document.getElementById("btnRemoveJudge").disabled = true;
        document.getElementById("tbModifyJudges").disabled = false;

    }
    else if (e.target.id === "btnAddJudge") {
        action = "Add";
        document.getElementById("btnEditJudge").disabled = true;
        document.getElementById("btnRemoveJudge").disabled = true;
    }
    else if (e.target.id === "btnRemoveJudge") {
        action = "Remove";
        document.getElementById("btnEditJudge").disabled = true;
        document.getElementById("btnAddJudge").disabled = true;
        document.getElementById("tbModifyJudges").disabled = false;
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
}


function clickModifyJudge() {


    //dunno about de image

    if (action === "Edit") {
        //fill-out necessary action
    }
    else if (action === "Add") {
        //fill-out necessary action
    }
    else if (action === "Remove") {

        //fill-out necessary action
    }

    clickCancel();


}
