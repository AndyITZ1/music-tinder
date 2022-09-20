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
}
login.onclick = function() {
    login.style.backgroundColor = "white";
    signup.style.backgroundColor = "rgb(233, 233, 233)";
    sform.style.display = "none";
    lform.style.display = "block";
    document.title = "Login";
}

var status = document.getElementById("status").value;
switch (status) {
	case "success1":
		Swal.fire({
			icon: 'success',
	  		title: "You're ready to go!'",
	  		text: 'Switch to login tab and start sharing!'
		});
		break;
	case "failed1":
		Swal.fire({
			icon: 'error',
			title: "Unsuccessful",
			text: 'Check to make sure you fully filled out the registration form. Otherwise an existing account may exist with given username or email!'
		});
		break;
	case "failed2":
		Swal.fire({
			icon: 'error',
			title: "Invalid username or password.",
			text: 'Please double-check your credentials.'
		});
		break;
	case "failed3":
		Swal.fire({
			icon: 'error',
			title: "Invalid password.",
			text: "Please double-check your password."
		});
		break;
	case "invalidUsername":
		Swal.fire({
			icon: 'error',
			title: "Username Missing",
			text: "Please enter a username."
		});
		break;
	case "invalidEmail1":
		Swal.fire({
			icon: 'error',
			title: "Email Missing",
			text: "Please enter an email address."
		});
		break;
	case "invalidEmail2":
		Swal.fire({
			icon: 'error',
			title: "Invalid Email",
			text: "Please enter a valid email address."
		});
		break;
	case "invalidPassword1":
		Swal.fire({
			icon: 'error',
			title: "Password Missing",
			text: "Please enter a password."
		});
		break;
	case "invalidPassword2":
		Swal.fire({
			icon: 'error',
			title: "Invalid Password",
			text: "Your password should be between 12-30 characters long."
		});
		break;
	case "invalidPassword3":
		Swal.fire({
			icon: 'error',
			title: "Invalid Password",
			text: 'Your password should contain the following: at least one uppercase letter, at least one lowercase letter, at least one number,'
			+ "at least one special character (excluding punctuation ones)."
		});
		break;
}