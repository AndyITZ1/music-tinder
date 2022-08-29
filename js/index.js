function drop() {
    document.getElementById("myAcct").classList.toggle("show");
}

var modal = document.getElementById("cap-modal");
var modalBtn = document.getElementById("cap-trigger");
var closeSpan = document.getElementById("close");
var forum = document.getElementById("forum");
var postTxt = document.getElementById("post-text");


modalBtn.onclick = function() {
    modal.style.display = "flex";
}

closeSpan.onclick = function() {
    modal.style.display = "none";
    forum.value = "";
    postTxt.value = "";
}

window.onclick = function(event) {
    if (!event.target.matches('.dropbtn')) {
        var dropdowns = document.getElementsByClassName("account-actions");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains("show")) {
                openDropdown.classList.remove("show");
            }
        }
    }

    if (event.target == modal) {
        modal.style.display = "none";
        forum.value = "";
        postTxt.value = "";
    }
}