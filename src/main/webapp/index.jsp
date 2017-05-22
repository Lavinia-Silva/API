<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cosmética - Login</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CSS -->
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<div class="main">
		<div class="container">
			<center>
				<div class="middle">
					<div id="login">
						<form action="login_adm" method="post" >
							<fieldset class="clearfix">
								<p>
									<span class="fa fa-user"></span><input type="text"
										Placeholder="Login" name="email" required>
								</p>
								<p>
									<span class="fa fa-lock"></span><input type="password"
										Placeholder="Senha" name="senha" required>
								</p>
								<div>
									<span
										style="width: 50%; text-align: right; display: inline-block; margin-left: 50%;"><input
										type="submit" value="Entrar" ></span>
								</div>
							</fieldset>
							<div class="clearfix"></div>
						</form>
						<div class="clearfix"></div>
					</div>
					<div class="logo" style="margin-top: 4%;">
						<img src="resources/img/logo.png">
						<div class="clearfix"></div>
					</div>
				</div>
			</center>
		</div>
	</div>	
</body>
</html>