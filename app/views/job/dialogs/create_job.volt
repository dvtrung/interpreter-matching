<?php
use_plugin_daterangepicker();
use_plugin_tokenfield_typeahead();
?>
<div class="modal fade" id="new-job-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><?= $edit ? "Edit Job" : "Create New Job" ?></h4>
            </div>
            <form id="frm-edit-job" class="form-horizontal" method="post" action="<?= get_url($edit ? "job/save/" . $job->id : "job/create") ?>">
                <div class="modal-body">
                    <?php
                    global $languages;
                    ?>
                    <div class="form-group">
                        <label for="privacy" class="col-sm-3 control-label">Visibility</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="visibility">
                                <option value="public"<?php if ($edit && $job->visibility == "public") echo " selected"?>>Public</option>
                                <option value="private"<?php if ($edit && $job->visibility == "private") echo " selected"?>>Selected Interpreters</option>
                                <option value="onlyme"<?php if ($edit && $job->visibility == "onlyme") echo " selected"?>>Only Me</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-sm-3 control-label">Title</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="title" value="<?= $edit ? $job->title : '' ?>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="language" class="col-sm-3 control-label">Language</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control language-typeahead-tokenfield" name="lang" value="<?= $edit ? Languages::code_list_to_name_list($job->lang) : 'Vietnamese,Japanese' ?>" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-3 control-label">Location</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control autocomplete-location" id="location" name="location" value="<?= $edit ? $job->location : '' ?>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="date" class="col-sm-3 control-label">Date & Time</label>
                        <div class="col-sm-9">
                            <input type="text" id="date-range" name="date-range" class="form-control" value=""/>
                            <input type="hidden" name="date_from" id="date-from" value="<?=$edit ? $job->date_from : ''?>"/>
                            <input type="hidden" name="date_to" id="date-to" value="<?=$edit ? $job->date_to : ''?>"/>
                        </div>
                        <script type="text/javascript">
                           $('#date-range').daterangepicker({
                               "autoApply": true,
                               "minDate": moment(),
                               "startDate": moment(<?= $edit ? '"' . $job->date_from . '"' : '' ?>),
                               "endDate": moment(<?= $edit ? '"' . $job->date_to . '"' : '' ?>)
                           }, function (start, end, label) {
                               $("#date-from").val(moment(start).format("YYYY-MM-DD"));
                               $("#date-to").val(moment(end).format("YYYY-MM-DD"));
                           });
                        </script>
                    </div>
                    <div class="form-group">
                        <label for="desc" class="col-sm-3 control-label">Description</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" id="desc" name="desc" placeholder="Job description, special requirement, etc." rows="5"><?= $edit ? $job->desc : '' ?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-3 control-label">Preferred Wage</label>
                        <div class="col-sm-6">
                            <div class="input-group">
                                <input type="text" class="form-control" id="location" name="wage" placeholder="ex: 1200 - 1400">
                                <div class="input-group-addon">¥ per hour</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <?php if ($edit) { ?>
                       <a href="#" onclick="$('#frm-edit-job').submit()" class="btn btn-primary">Save Changes</a>
                    <?php } else { ?>
                       <a href="#" onclick="$('#frm-edit-job').submit()" class="btn btn-primary">Create New Job</a>
                    <?php } ?>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>