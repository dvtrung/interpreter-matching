<?php echo $this->tag->form(array("dashboard/update_profile", "class" => "form-horizontal",  "enctype" => "multipart/form-data")); ?>        

    {{ partial('dashboard/profile_basic') }}
    {{ partial('dashboard/profile_address') }}
    
<div class="form-group">
    <div class="col-sm-offset-5 col-sm-2">
        <?=$this->tag->submitButton(array("Continue", "class" => "btn btn-primary center-block")) ?>
    </div>
</div>
    
</form>