<?php global $user; ?>
<div class="panel panel-default">
    <div class="panel-heading">Basic Information</div>
    <div class="panel-body">
<div class="form-group">
    <label for="first_name" class="col-sm-offset-1 col-sm-2 control-label">Name </label>
    <div class="col-sm-3">
    <?=$form->render("first_name", array("class" => "form-control"));?>
    </div>
    <div class="col-sm-3">
        <?=$form->render("family_name", array("class" => "form-control"))?>
    </div>
</div>
<div class="form-group">
    <label for="avatar" class="col-sm-offset-1 col-sm-2 control-label">Profile Picture </label>
    <div>
    <div class="col-sm-2">
        <a href="#" id="choose-picture">
        <img src="<?=$user->get_profile_picture_url()?>" class="img-rounded img-thumbnail"/>
        </a>
        <input type="file" name="profile_picture" id="profile_picture" accept="image/*">
        <script>
        $("#choose-picture").click(function() {
            $("#profile_picture").trigger('click');
        });
        </script>
    </div>
    </div>
</div>
<div class="form-group">
    <label for="email" class="col-sm-offset-1 col-sm-2 control-label">Email </label>
    <div class="col-sm-4 form-control-static">
    <?=$user->email?>
    </div>
</div>
<div class="form-group">
    <label for="email" class="col-sm-offset-1 col-sm-2 control-label">Password </label>
    <div class="col-sm-4 form-control-static">
        <a href="#">Change Password</a>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-offset-1 col-sm-2 control-label">Gender </label>
    <div class="col-sm-4">
<label class="radio-inline">
    <?=$form->render("gender", array("value" => "male"))?>Male
</label>
<label class="radio-inline">
    <?=$form->render("gender", array("value" => "female"))?>Female
</label>
<label class="radio-inline">
    <?=$form->render("gender", array("value" => "other"))?>Other
</label>
        </div>
</div>
<div class="form-group">
    <label for="dob" class="col-sm-offset-1 col-sm-2 control-label">Birthday</label>
    <div class="col-sm-3">
    <?=$form->render("dob", array("class" => "form-control")) ?>
    </div>
</div>
            </div>
</div>
