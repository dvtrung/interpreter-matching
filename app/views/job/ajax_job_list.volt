<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title">Choose A Job</h4>
</div>
<div class="modal-body">
    <?php
    foreach ($jobs as $job) {
       ?>
       <a href="<?= get_url("job/detail/$job->id") ?>" class="list-group-item">
           <input type="hidden" id="_lang" value="<?= $profile->lang ?>"/>
           <h4><?= $job->get_title(); ?></h4>
           <p id="location"><?= get_icon("screenshot") ?><?= $job->location ?></p>
           <p id="lang"><?= get_icon("globe") ?><?= $job->get_language() ?></p>
           <?php
           //$application = Applications::load_application($interpreter_id, $job->id);
           ?>
       </a>
    <?php } ?><br>
    <a href="#" onclick="$('#job-list-modal').modal('toggle');" class="btn btn-primary" data-toggle="modal" data-target="#new-job-modal"><i class="fa fa-plus"></i> Create New Job</a>
</div>