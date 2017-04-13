<h3><i class="fa fa-user fa-fw"></i> About Me <small><a href="#" id="btn-edit-intro" class="btn-hot-edit" target-id="about-me"><i class="fa fa-pencil"></i> Edit</a></small></h3>
<p id="txt-about-me"><?= str_replace('<br/>', '\n', $display_user->intro) ?></p>
<form id="frm-about-me" class="frm-hot-edit">
    <div class="form-group">
        <textarea id="intro" name="intro" class="form-control" rows="5"></textarea>
    </div>
    <div class="form-group">
        <a id="btn-about-me-save" class="btn btn-primary">Save Change</a>
        <a id="btn-about-me-cancel" class="btn btn-default">Cancel</a>
    </div>
</form>

<script>
   $("#btn-about-me-save").click(function (e) {
       $.post("<?=get_url("profile/post")?>", { name: 'intro', value: $("#intro").val() }, function(e) {
          $("#txt-about-me").html($("#intro").val());
       });
   });
   $("#btn-edit-intro").click(function(e) {
      $("#intro").val($("#txt-about-me").html());
   });
</script>