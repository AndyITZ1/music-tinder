var signup = document.getElementById("signupform");
var login = document.getElementById("loginform");
var sform = document.getElementById("sform");
var lform = document.getElementById("lform");

signup.onclick = function() {
    login.style.backgroundColor = "rgb(233, 233, 233)";
    signup.style.backgroundColor = "white";
    sform.style.display = "block";
    lform.style.display = "none";
    document.title = "Sign Up";
    Swal.fire('Logging in');
}
login.onclick = function() {
    login.style.backgroundColor = "white";
    signup.style.backgroundColor = "rgb(233, 233, 233)";
    sform.style.display = "none";
    lform.style.display = "block";
    document.title = "Login";
}