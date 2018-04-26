var selected, fName, lName; 

$("#tbAddContestant tbody tr").click(function () {
    $(this).addClass('selectedContestant').siblings().removeClass('selectedContestant');
    selected = $(this).find('td:first').html() + " " + $(this).find('td:nth-child(2)').html();


    //alert(selected); 
});

function clickAddContestant() {
    alert(selected);
    $('.selectedContestant').remove(); 
    
}