<hr>
<?php if (!$my_application) { ?>
   <h3>Will you be able to take the job?</h3>
   <p class="text-center">
       <button class="btn btn-primary btn-lg" id="btn_apply" data-toggle="modal" data-target="#dlg-apply"><i class="fa fa-arrow-right"></i> Yes, Go to Apply</button>
       <button class="btn btn-primary btn-lg" id="btn_apply" data-toggle="modal" data-target="#dlg-apply"><i class="fa fa-envelope-o"></i> Send a Message</button>
   </p>
   <?php
} else {
   $status = $my_application->get_my_status();
   if ($status == Applications::APP_APPLIED) {
      ?>
      <h3>You have applied for the job. <small><a href="#" id="btn_cancel" data-toggle="modal" data-target="#dlg-confirm-cancel"><i class="fa fa-times"></i> Cancel</a></small></h3>
   <?php } else if ($status == Applications::APP_ACCEPTED) { ?>
      <h3>You got accepted</h3>
      <p class="text-center">
          <button class="btn btn-primary btn-lg" id="btn_apply" data-toggle="" data-target="#dlg-apply"><i class="fa fa-arrow-right"></i> Confirm</button>
          <button class="btn btn-danger btn-lg" id="btn_apply" data-toggle="" data-target="#dlg-apply"><i class="fa fa-times"></i> Cancel</button>
      </p>
   <?php } else if ($status == Applications::APP_CANCELED) {
      ?>
      <h3>You canceled this job</h3>
      <p class="text-center">
          <a href="<?= get_url("job/apply_again/" . $my_application->id) ?>" class="btn btn-primary btn-lg" id="btn_apply_again" data-toggle="modal"><i class="fa fa-arrow-right"></i> Apply It Again</a>
      </p>
   <?php }
   ?>
   <?php
}