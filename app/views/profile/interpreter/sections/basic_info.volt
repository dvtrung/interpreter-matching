<div class="panel panel-default">
    <div class="panel-body">
        <div class="col-lg-4">
            <?= $display_user->get_profile_picture_img() ?>
        </div>
        <div class="col-lg-8">
            <h2><?= $display_user->get_display_name() ?><?php if ($display_user->verified) echo " <small>Verified</small>"; ?></h2>
            <div>
                <div class="col-lg-12">
                    <p><i class="fa fa-user"></i> <?= $display_user->get_gender() . ' - ' . $display_user->get_age(); ?></p>
                    <p><i class="fa fa-home"></i> Living in <?= $display_user->get_city(); ?></p>
                </div>
            </div>
            <div>
                <p>
                    <?php if (is_customer() || !is_interpreter()) { ?>
                       <a href="<?= get_url("job/ajax_job_list/" . $display_user->account_id) ?>" class="btn btn-primary" data-toggle="modal" data-target="<?= is_signed_in() ? "#job-list-modal" : "#login-modal" ?>"><i class="fa fa-paper-plane"></i> Send Job Offer</a>
                    <?php }
                    ?>
                </p>
            </div>
        </div>
    </div>
</div>