<div class="container">
    <div class="col-lg-8">
        <?php
        $this->partial('job/sections/job_info');
        if (is_interpreter()):
           $this->partial('job/sections/applicant_action');
           $this->partial('job/sections/messages');
        elseif ($is_my_job):
           $this->partial('job/sections/customer_messages', array('accepted_interpreter_only' => true));
        endif;
        ?>
    </div>

    <div class="col-lg-4">
        <?php
        if ((!is_customer() && !$my_application) || (is_customer() && !$is_my_job)): // Unrelated person
           $customer = Users::load_by_id($job->account_id);
           $customer->profile_box();
           if ($job_status == Jobs::JOB_ACTIVE):
              $this->partial("job/widgets/applied");
           endif;
           $this->partial("job/widgets/related_jobs");
        elseif ($my_application): // Person who has interacted with job
           $customer = Users::load_by_id($job->account_id);
           $customer->profile_box();
           if ($job_status == Jobs::JOB_ACTIVE):
              $this->partial("job/widgets/applied");
           endif;
           $this->partial("job/widgets/related_jobs");
        elseif ($is_my_job): // owner
           $this->partial("job/widgets/my_action");
           if ($job_status == Jobs::JOB_DECIDED):
              //$chosen_interpreter->profile_box();
           endif;
           $this->partial("job/widgets/statistics");
           $this->partial("job/widgets/invited");
        endif;
        ?>
    </div>
</div>

<div class="modal fade" id="dlg-confirm-cancel" tabindex="-1" role="dialog" aria-labelledby="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Confirmation</h4>
            </div>
            <div class="modal-body text-center">
                <p>Do you really want to cancel applying for this job?</p>
            </div>
            <div class="modal-footer">
                <?= $this->tag->form("job/apply/$job_id"); ?>
                <button type="submit" class="btn btn-primary">Yes</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </form>
            </div>
        </div>
    </div>
</div>

<?php
if (is_interpreter() && !isset($my_application)) $this->partial('job/dialogs/apply');?>