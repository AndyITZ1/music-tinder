function drop() {
    console.log("drop");
    document.getElementById("myAcct").classList.toggle("show");
}

var forumName = document.getElementById("forumName");
var modal = document.getElementById("cap-modal");
var modalBtn = document.getElementById("cap-trigger");
var closeSpan = document.getElementById("close");
var forum = document.getElementById("forum");
var postTxt = document.getElementById("post-text");
var postTitle = document.getElementById("title");

if (forumName == null || forumName == undefined) {
    forum.value = "m+General";
}
else {
    forum.value = forumName.dataset.name;
}

modalBtn.onclick = function() {
    modal.style.display = "flex";
}

closeSpan.onclick = function() {
    modal.style.display = "none";
    if (forumName == null || forumName == undefined) {
        forum.value = "m+General";
    }
    else {
        forum.value = forumName.dataset.name;
    }
    postTitle.value = "";
    postTxt.value = "";
}

window.onclick = function(event) {
    if (!event.target.matches('.dropbtn')) {
        // console.log("drop2");
        var dropdowns = document.getElementsByClassName("account-actions");
        var i;
        console.log(dropdowns.length);
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains("show")) {
                openDropdown.classList.remove("show");
            }
        }
    }

    if (event.target == modal) {
        modal.style.display = "none";
        if (forumName == null || forumName == undefined) {
            forum.value = "m+General";
        }
        else {
            forum.value = forumName.dataset.name;
        }
        postTitle.value = "";
        postTxt.value = "";
    }
}