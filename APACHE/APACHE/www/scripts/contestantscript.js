﻿var selected, modify, input, fName, lName, action; 


//selects from slAddContestant
$("#slAddContestant").click(function () {

    //gets data
    selected = $("#slAddContestant option:selected").val();
    input = selected.split(" ");
    fName = input[0];
    lName = input[1];

});

//click btnAddContestant
function clickAddContestant() {
    alert(selected);
    
}


//selects from slModifyContestant
$("#slModifyContestant").click(function () {
    //gets data
    modify = $("#slModifyContestant option:selected").val();
    input = modify.split(" ");
    fName = input[0];
    lName = input[1];

    document.getElementById("txtFirstName").value = fName;
    document.getElementById("txtLastName").value = lName;

});

$("#btnEdit, #btnRemove, #btnAdd").click(function (e) {
    document.getElementById("btnContinue").disabled = false;
    document.getElementById("btnCancel").disabled = false;

    if (e.target.id == "btnEdit")
    {
        action = "Edit";
        document.getElementById("btnAdd").disabled = true;
        document.getElementById("btnRemove").disabled = true;
        document.getElementById("slModifyContestant").disabled = false;
    }
    else if (e.target.id == "btnAdd")
    {
        action = "Add";
        document.getElementById("btnEdit").disabled = true;
        document.getElementById("btnRemove").disabled = true;
    }
    else if (e.target.id == "btnRemove")
    {
        action = "Remove";
        document.getElementById("btnEdit").disabled = true;
        document.getElementById("btnAdd").disabled = true;
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
}

function clickModifyContestant() {
    if (action == "Edit")
    {

    }
    else if (action == "Add")
    {

    }
    else if (action == "Remove")
    {

    }

    clickCancel();


}
