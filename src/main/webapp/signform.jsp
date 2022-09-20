<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;1,400;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/signform.css">
    <link rel="stylesheet" href="sweetalert2.min.css">
</head>
<body>
    <div class="wrapper">
        <header>
            <a href="index.jsp" class="logo">MuseIt</a>
        </header>
        <section>
            <div class="tabbed-pane-wrapper">
                <div class="tabbed-panes">
                    <div class="tabbed-signuptab" id="signupform">Sign Up</div>
                    <div class="tabbed-logintab" id="loginform">Login</div>
                </div>
                <div class="tabbed-pane-content sform" id="sform">
                    <div class="formheader">
                        <h1 class="form-header">Sign Up Now!</h1>
                        <p class="form-desc">Join the greatest <br> music community!</p>
                    </div>
                    <div class="form-content">
                        <form action="register" method="post">
                            <div class="form-input">
                                <input type="text" name="username" placeholder="Username" required>
                            </div>
                            <div class="form-input">
                                <input type="email" name="email" id="" placeholder="Email Address" required>
                            </div>
                            <div class="form-input">
                                <input type="password" name="password" id="" placeholder="Password" required>
                            </div>
                            <div class="tos">
                                <span>
                                    By clicking "Sign up," you agree to the <a href="#">Terms of Use</a> and <a href="#">Privacy Policy</a>.
                                </span>
                            </div>
                            <button class="form-button" type="submit">
                                <span class="button-content">Sign up</span>
                            </button>
                        </form>
                    </div>
                </div>
                <div class="tabbed-pane-content lform" id="lform">
                    <div class="formheader">
                        <h1 class="form-header">Login into your account.</h1>
                        <p class="form-desc">Join the greatest <br> music community!</p>
                    </div>
                    <div class="form-content">
                        <form action="login" method="post">
                            <div class="form-input">
                                <input type="text" name="username" placeholder="Username" required>
                            </div>
                            <div class="form-input">
                                <input type="password" name="password" id="" placeholder="Password" required>
                            </div>
                            <div class="tos">
                                <span>
                                    By clicking "Login," you agree to the <a href="#">Terms of Use</a> and <a href="#">Privacy Policy</a>.
                                </span>
                            </div>
                            <button class="form-button" type="submit">
                                <span class="button-content">Login</span>
                            </button>
                            <br>
                            <a href="#" class="fpass">Forgot your password?</a>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
    <script src="js/signup.js"></script>
</body>
</html>