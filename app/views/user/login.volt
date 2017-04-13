<div class="container col-sm-4 col-sm-offset-4">
<div class="panel panel-default">
    <div class="panel-heading"><h4 class="text-center">Sign In</h4></div>
<div class="panel-body">
<?php echo $this->tag->form(array("user/start", "class" => "form-signin")); ?>

    <label for="inputEmail" class="sr-only">Email address</label>
        <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
        <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <p class="text-right">        
<?=$this->tag->linkTo("user/forgetpassword", "Forgot the password?")?>
        </p>
        <?=$this->tag->submitButton(array("Sign In", "class" => "btn btn-lgd btn-primary btn-block")) ?>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
</form>
</div>
</div>
</div>