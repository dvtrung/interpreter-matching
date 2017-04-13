<p>An email was sent to you at <strong></strong></p>
Please check the confirmation email
<?php echo $this->tag->form(array("signup/userinfo_customer")); ?>
<div style="form-group">
    <label for="confirm_code">Confirmation Code
    </label>
</div>
<div class="form-group">
    <div class="col-sm-offset-5 col-sm-2">
        <?=$this->tag->submitButton(array("Continue", "class" => "btn btn-default")) ?>
    </div>
</div>
</form>