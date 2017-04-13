<div class="modal fade" id="dlg-apply" tabindex="-1" role="dialog" aria-labelledby="">
    <div class="modal-dialog">
        <div class="modal-content">
            <?= $this->tag->form("job/apply/$job_id"); ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Apply</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="message">Introduce yourself</label>
                    <textarea class="form-control" rows="5" id="message" name="message" placeholder="Write a short message"></textarea>
                </div>
                <a href="#">Copy from templates</a>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary center-block">Apply for this job</button>
            </div>
            </form>
        </div>
    </div>
</div>