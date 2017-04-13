<?php
global $user;
use_plugin_tokenfield_typeahead();
?>
<div class="container">
    <div class="col-lg-8">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="col-lg-4 text-center">
                    <img id="avatar" src="<?= $display_user->get_profile_picture_url() ?>" class="img-avatar img-rounded img-responsive img-thumbnail" style="margin-bottom: 5px;"/>
                    <p><a href="#" id="btn-change-profile-picture"><i class="fa fa-pencil"></i> Change Profile Picture</a></p>
                    <div class="collapse"><input id="choose-avatar" type="file" style="visibility:hidden" accept="image/*"/></div>
                </div>
                <div class="col-lg-8">
                    <h3><?= $display_user->get_display_name() ?></h3>
                    <div>
                        <span class="col-lg-3"><i class="fa fa-user"></i> Gender </span>
                        <span class="col-lg-9"><a href="#" class="editable" id="gender" data-type="select"></span></a>
                    </div>
                    <div>
                        <span class="col-lg-3"><i class="fa fa-calendar"></i> Birthday </span>
                        <span class="col-lg-9"><a href="#" id="dob" data-type="combodate" data-value="<?= $display_user->dob ?>"></a></span>
                    </div>
                    <div>
                        <span class="col-lg-3"><i class="fa fa-map-marker"></i> Address </span>
                        <span class="col-lg-9"><?= $display_user->city ?></span>
                    </div>
                </div>
            </div>
        </div>

        {{ partial('profile/interpreter/sections/editable_about_me') }}
        {{ partial('profile/interpreter/sections/editable_language_experiences') }}
    </div>
    <div class="col-lg-4">
        {{ partial('profile/interpreter/widgets/references') }}
    </div>
</div>

<script>
   var reader;
   $(document).ready(function () {
       $(".editable").attr('data-url', '<?= get_url("profile/post") ?>');
       $(".editable").attr('data-pk', '0');

       $.fn.editable.defaults.mode = 'inline';
       $('#gender').editable({
           value: '<?= $user->gender ?>',
           source: [
               {value: 'male', text: 'Male'},
               {value: 'female', text: 'Female'}
           ],
           prepend: 'Not Specified'
       });
       $('#dob').editable({
           format: 'YYYY-MM-DD',
           viewformat: 'DD.MM.YYYY',
           template: 'D / MMMM / YYYY',
           combodate: {
               minYear: 1900,
               maxYear: 2015,
               minuteStep: 1
           }
       });

       reader = new FileReader();
       $("#btn-change-profile-picture").click(function (e) {
           $('#choose-avatar').click();
           reader.onload = (function (e) {
               var result = e.target.result;
               var fileName = document.getElementById('choose-avatar').files[0].name; //Should be 'picture.jpg'
               $("#avatar").css("visibility", "hidden");
               $.post('<?= get_url("profile/post") ?>', {image: result}, function (data) {
                   d = new Date();
                   $(".img-avatar").attr("src", data + "?" + d.getTime());
                   $("#avatar").css("visibility", "visible");
               });
           });
           $('#choose-avatar').change(function () {
               var file = document.getElementById('choose-avatar').files[0];
               reader.readAsDataURL(file);
           });
       });

       $(".frm-hot-edit").addClass("collapse");
       $(".btn-hot-edit").click(function (e) {
           var id = $(this).attr("target-id");
           $("#frm-" + id).removeClass("collapse");
           $("#txt-" + id).addClass("collapse");
           e.preventDefault();
       });
       function hotEdit(id) {
           $("#btn-" + id + "-save, " + "#btn-" + id + "-cancel").click(function () {
               $("#frm-" + id).addClass("collapse");
               $("#txt-" + id).removeClass("collapse");
           });
       }
       hotEdit("about-me");
   });
</script>
