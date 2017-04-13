<div class="widget-body text-center">
    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#new-job-modal"><i class="fa fa-pencil"></i> Edit</a>
</div>
<?php
$this->partial("job/dialogs/create_job", array(
        'edit' => true
));