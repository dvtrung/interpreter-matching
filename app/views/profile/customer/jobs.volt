<?php global $user; ?>
<form>
Showing:
<label class="radio-inline"><input type="radio" name="showing-option" id="showing-option">All Jobs</label>
<label class="radio-inline"><input type="radio" name="showing-option" id="showing-option">Active Jobs Only</label>
</form>
<p>
<button class="btn btn-default btn_edit_lang" data-toggle="modal" data-target="#dlg-edit"><?=icon("plus")?>New Job</button> 
</p>
<?php
$jobs = jobs_by($user->account_id);
foreach ($jobs as $job) { ?>
<div class="panel panel-default">
    <div class="panel-body">
            <div class="col-lg-8">
                
<input type="hidden" id="_lang" value="<?=$profile->lang?>"/>
<h4>Status</h4>
<p>Open for Applications</p>
<h4>Location</h4>
<p id="location"><?=$job->location?></p>
<h4>Language</h4>
<p id="lang">From <strong><?=get_language($job->lang_from)?></strong> to <strong><?=get_language($job->lang_to)?></strong></p>
<h4>Description</h4>
<p id="profile_text"><?=nl2br($job->desc)?></p>
<div>
    <button class="btn btn-primary btn_edit_lang" data-toggle="modal" data-target="#dlg-edit"><?=icon("edit")?>Edit</button> 
    <button id="btn_remove_lang" class="btn btn-danger"><?=icon("trash")?>Remove</button>
</div>
</div>
          
<div class="col-lg-4">
<h4>Public comments</h4>
No comment.
<h4>Invited Translators</h4>
<p>No one.</p>
<button class="btn btn-default btn_edit_lang" data-toggle="modal" data-target="#dlg-edit"><?=icon("user")?>Find More People</button> 
<h4>Applicants</h4>
<p>No one.</p>
<button class="btn btn-default btn_edit_lang" data-toggle="modal" data-target="#dlg-edit"><?=icon("user")?>Select One Person</button> 
</div>
</div>
            
    </div>
</div>
<?php }