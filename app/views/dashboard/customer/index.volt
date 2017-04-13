<?php global $user ?>
<?php

function render_job_list($jobs) {
   echo '<div class="container-fluid">';
   foreach ($jobs as $job) {
      ?>
      <div class="col-sm-6"><?php Jobs::small_info_box($job); ?></div>
      <?php
   }
   echo "</div>";
}
?>
<div class="container">
    <div class="col-lg-8">
        <div class="text-center">
            <p>Hi <?= $user->get_display_name() ?>! Are you planning on a business trip?</p>
            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#new-job-modal"><i class="fa fa-plus"></i> Create New Job</a>
            <a href="<?= get_url("search/interpreter") ?>" class="btn btn-primary"><i class="fa fa-search"></i> Look For An Interpreter</a>
        </div>
        <hr>

        <?php
        $jobs = Jobs::by_account_id(account_id());
        if (count($jobs) > 0) {
           echo '<h3 class="heading-inline">Jobs By Me</h3>';
           foreach ($jobs as $job) {
              render_job_list($jobs);
           }
        }
        ?>
    </div>

    <div class="col-lg-4 hidden-sm hidden-xs">
        <?php $user->profile_box(); ?>
    </div>
</div>

<?php
$this->partial('job/dialogs/create_job', array("edit" => false))
?>