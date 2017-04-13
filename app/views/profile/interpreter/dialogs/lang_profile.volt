<div id="lang-profile-model" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Edit Language Experience</h4>
            </div>
            <form class="form-horizontal" method="post" action="<?=get_url("profile/edit_language_profile")?>">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="lang" class="col-sm-offset-1 col-sm-1 control-label">Language </label>
                        <div class="col-sm-4">
                            <input type="text" name="lang" class="form-control language-typeahead" data-provide="typeahead">
                        </div>
                        <label for="level" class="col-sm-1 control-label">Level </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="level" name="level">
                                <?php for ($i = 1; $i < count(Languages::$language_level); $i++) echo "<option value='$i'>".Languages::$language_level[$i]."</option>"; ?>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="certificate" class="col-sm-offset-1 col-sm-1 control-label">Certificate </label>
                        <div class="col-sm-4">
                            <input type="text" name="certificate" class="form-control" data-provide="typeahead">
                        </div>
                        <label for="level" class="col-sm-1 control-label"></label>
                        <div class="col-sm-4">
                            
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="profile_text" class="col-sm-2 control-label">Experience </label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="profile-text" rows="5" id="comment"></textarea>
                        </div>
                    </div>
                    <input type="hidden" name="_lang" value=""/>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>