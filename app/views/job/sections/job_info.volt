<div>
    <h2 class="heading-inline"><?= $job->get_title() ?></h2>
    <div class="pull-right">

    </div>
    <p><?= $job->get_status_text() ?></p>
</div>
<hr>
<p id="location"><?= get_icon("screenshot") ?><?= $job->location ?></p>
<p id="lang"><?= get_icon("globe") ?><?= $job->get_language() ?></p>
<hr>
<h3>Job description</h3>
<p><?= $job->desc ?></p>