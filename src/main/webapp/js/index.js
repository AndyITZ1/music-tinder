function drop() {
    console.log("drop");
    document.getElementById("myAcct").classList.toggle("show");
}

var currentTheme = 1;
function themeSwitch() {
    currentTheme += 1;
    if (currentTheme == 4)
        currentTheme = 1;
    var themeObjects = document.getElementsByClassName("theme");
    for (var i = 0; i < themeObjects.length; i++) {
        switch(currentTheme) {
            case 2:
                themeObjects[i].classList.toggle("dark");
                break;
            case 3:
                themeObjects[i].classList.toggle("dark");
                themeObjects[i].classList.toggle("blue");
                break;
            default:
                themeObjects[i].classList.toggle("blue");
                break;
        }
    }
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

const menuBtn = document.getElementById("menu");
const menuCloseBtn = document.getElementById("menu-close");
const mobileMenu = document.getElementById("nav-mobile");

menuBtn.addEventListener('click', function() {
    menuBtn.classList.toggle('menu-closed');
    menuCloseBtn.classList.toggle('menu-opened');
    mobileMenu.classList.toggle('is-active');
})

menuCloseBtn.addEventListener('click', function() {
    menuBtn.classList.toggle('menu-closed');
    menuCloseBtn.classList.toggle('menu-opened');
    mobileMenu.classList.toggle('is-active');
})

modalBtn.onclick = function() {
	console.log("Clicked");
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


var user = document.getElementById("user");
var login = document.getElementsByClassName("login");
var logout = document.getElementsByClassName("logout");
if (user == null || user.value == "" || user.value == "null") {
    for (var i = 0; i < logout.length; i++)
	    logout[i].style.display = "none";
}
else {
    for (var i = 0; i < login.length; i++)
	    login[i].style.display = "none";
}
