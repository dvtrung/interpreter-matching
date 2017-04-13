<div class="container">
    <h2 class="text-center">Create New Account</h2>
<div class="col-lg-4 col-lg-offset-4">
    <p class="text-center"><button class="btn btn-xlarge btn-facebook"><i class="fa fa-facebook"></i> | Connect with Facebook</button></p>
    <p class="text-center">or</p>
<?php 
if (isset($messages)) { ?>
    <div class="alert alert-danger" role="alert"><?php
    foreach ($messages as $message) {
        ?>
        <p><?=$message?></p>
        <?php
    } ?>
    </div>
<?php }
?>
<form method="post" action="<?=get_url("signup")?>" class="form-horizontal">

<div class="form-group">
    <div class="col-sm-12">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
        <input id="email" type="email" class="form-control" name="email" placeholder="Email Address" required>
    </div>
    </div>
</div>
<div class="form-group">
    <div class="col-lg-12">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <input id="login-password" type="text" class="form-control" name="first_name" placeholder="First Name" required>
        <input id="login-password" type="text" class="form-control" name="family_name" placeholder="Family Name" required>
    </div>
    </div>
</div>
<div class="form-group">
    <div class="col-lg-12">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
        <input id="login-password" type="password" class="form-control" name="password" placeholder="Password">
        <input id="login-password" type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password">
    </div>
    </div>
</div>

<div class="form-group">
    <div class="col-lg-12 text-center">
        <p>What account type you want to register for?</p>
        <div class="btn-group" data-toggle="buttons">
                <label class="btn btn-default">
                    <input type="radio" id="q156" name="type" value="customer" /> Customer
                </label> 
                <label class="btn btn-default">
                    <input type="radio" id="q157" name="type" value="interpreter" /> Interpreter
                </label> 
        </div>
    </div>
</div>

<div class="form-group">
    <div class="center-block">
        <input type="submit" class="btn btn-primary center-block btn-lg" value="Create Account"/>
    </div>
</div>
</form>
</div>
</div>