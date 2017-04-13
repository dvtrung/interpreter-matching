
<div class="widget-heading">People Who Got Invited</div>
<div class="panel-body">
    <?php
    $applications = $job->getApplications(array("conditions" => "status = 'invited'"));
    Users::render_small_item_list(Applications::get_user_list($applications), 12);
    ?>
    <p><a href="<?= get_url("search/interpreter") ?>"><i class="fa fa-search"></i> Search For Interpreter</a></p>
</div>