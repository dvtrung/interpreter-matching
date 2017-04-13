<?php global $user; ?>
<div class="container">
    <div class="col-lg-8">
        <?php if (!user()->confirmed) { ?>
           <div class="alert alert-warning">Please confirm your email address.
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <a href="#" class="">Resend</a>
           </div>
        <?php } ?>
        <?php $have_job = false; ?>
        <?php
        $my_applications = Applications::get_all_my_applications();
        if (isset($my_applications[Applications::APP_ACCEPTED])) {
           echo "<h2>Upcoming Jobs</h2>";
           Jobs::render_list_from_applications($my_applications[Applications::APP_ACCEPTED]);
           $have_job = true;
        }
        ?>
        <?php
        if (isset($my_applications[Applications::APP_APPLIED])) {
           echo "<h2>Jobs I am Applying</h2>";
           Jobs::render_list_from_applications($my_applications[Applications::APP_APPLIED]);
           $have_job = true;
        }
        ?>

        <?php
        if (isset($my_applications[Applications::APP_INVITED])) {
           echo "<h3>Jobs I am Invited</h3>";
           Jobs::render_list_from_applications($my_applications[Applications::APP_INVITED]);
           $have_job = true;
        }
        ?>
        
        <?php
        if (isset($my_applications[Applications::APP_REJECTED])) {
           echo "<h3>Jobs You got Rejected</h3>";
           Jobs::render_list_from_applications($my_applications[Applications::APP_REJECTED]);
           $have_job = true;
        }
        ?>

        <h2>Suggested Jobs</h2>
        <?php
        $jobs = Jobs::suggested_jobs(user(), 6);
        Jobs::render_list($jobs);
        ?>
        <?php
        if (!$have_job) {
           
        }
        ?>
        <p class="text-right"><a href="<?= get_url("search/job") ?>">See More</a></p>

    </div>
    <div class="col-lg-4">
        <?php $user->profile_box(); ?>
        <?php $display_user = $user; ?>
        {{ partial('profile/interpreter/widgets/references') }}
    </div>
</div>