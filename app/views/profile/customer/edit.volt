<div class="container">
<?php echo $this->tag->form(array("dashboard/update_profile", "class" => "form-horizontal",  "enctype" => "multipart/form-data")); ?>        
{{ partial('profile/sections/basic') }}
{{ partial('profile/sections/company') }}


<div class="panel panel-default">
    <div class="panel-heading">Payment Method</div>
    <div class="panel-body">
        Not specified
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
</div>