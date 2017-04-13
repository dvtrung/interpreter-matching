
    <div class="page-header"><h2>Edit Profile</h2></div>
<?php echo $this->tag->form(array("dashboard/update_profile", "class" => "form-horizontal",  "enctype" => "multipart/form-data")); ?>        
<div class="panel panel-default">
    <div class="panel-heading">Basic Information</div>
    <div class="panel-body">
        {{ partial('dashboard/profile_basic') }}
    </div>
</div>

    
<div class="panel panel-default">
    <div class="panel-heading">Address</div>
    <div class="panel-body">


<div class="form-group">
    <label for="country" class="col-sm-offset-1 col-sm-2 control-label">Country </label>
    <div class="col-sm-3">
    <?=$form->render("country", array("class" => "form-control"))?>
    </div>
</div>
        
<div class="form-group">
    <label for="zipcode" class="col-sm-offset-1 col-sm-2 control-label">Zip Code </label>
    <div class="col-sm-3">
    <?=$form->render("zipcode", array("class" => "form-control"))?>
    </div>
</div>
        
<div class="form-group">
    <label for="prefecture" class="col-sm-offset-1 col-sm-2 control-label">Prefecture </label>
    <div class="col-sm-3">
    <?=$form->render("prefecture", array("class" => "form-control"))?>
    </div>
    
    <label for="city" class="col-sm-1 control-label">City </label>
    <div class="col-sm-3">
    <?=$form->render("city", array("class" => "form-control"))?>
    </div>
</div>
        
<div class="form-group">
    <label for="address_1" class="col-sm-offset-1 col-sm-2 control-label">Address 1 </label>
    <div class="col-sm-3">
    <?=$form->render("address_1", array("class" => "form-control"))?>
    </div>
</div>
<div class="form-group">
    <label for="address_2" class="col-sm-offset-1 col-sm-2 control-label">Address 2 </label>
    <div class="col-sm-3">
    <?=$form->render("address_2", array("class" => "form-control"))?>
    </div>
</div>
    
<div class="form-group">
    <label for="lang" class="col-sm-offset-1 col-sm-2 control-label">Language </label>
    <div class="col-sm-3">
    <?=$form->render("language", array("class" => "form-control"))?>
    </div>
</div>

</div>
</div>
    

<div class="form-group">
    <div class="col-sm-offset-5 col-sm-1">
        <?=$this->tag->submitButton(array("Change", "class" => "btn btn-primary")) ?>
    </div>
    <div class="col-sm-1">
        <?=$this->tag->submitButton(array("Cancel", "class" => "btn btn-default")) ?>
    </div>
</div>
</form>
    