
<div class="container">
    <div class="col-lg-4">
        <div class="list-group">
            <?php
            if (count($applications) == 0) {
               echo "You don't have any message here :(";
            }
            foreach ($applications as $application) {
               if (is_interpreter()) $reciepient = Users::load_by_id($application->jobs->account_id);
               else $reciepient = user();
               $job = $application->jobs;
               $messages = $application->getMessages(array('order' => 'created_at DESC', 'limit' => 1));
               if (count($messages) > 0) $last_message = $messages[0]->message_body;
               else $last_message = $application->intro;
               ?>
               <a href="#" class="list-group-item message-item" threadid="<?= $application->id ?>">
                   <div class='media'>
                       <div class="media-left">
                           <img src="<?= $reciepient->get_profile_picture_url() ?>" class="media-object img-circle" alt="Profile Picture" height="48" width="48">
                       </div>
                       <div class="media-body">
                           <h4 class="media-heading"><?= $reciepient->get_display_name() ?></h4>
                           <p><?= $job->get_status_text() ?></p>
                           <p class="list-group-item-text one-line"><?= $last_message ?></p>
                       </div>
                   </div>
               </a>
            <?php }
            ?>
        </div>
    </div>
    <div class="col-lg-8">
        <h3 id="recipient"></h3>
        <h4 id="job-title"></h4>
        <p id="job-status"></p>
        <hr>
        <div id="messages">

        </div>
    </div>
</div>

<script>
   $(".message-item").click(function (e) {
       id = $(this).attr("threadid");
       $.post("<?= get_url("message/ajax_message") ?>", {id: id}, function (data) {
           $("#recipient").text(data.recipient.display_name2);
           $("#job-title").text(data.job_title);
           $("#job-status").html(data.job_status);
           $("#messages").html('');
           data.messages.forEach(function (mess) {
               $("#messages").append(
                       '<div class="media">' +
                       '<div class="media-left"><a href="' + (mess.reply ? data.profile1 : data.profile2) + '">' +
                       '<img class="media-object avatar-small img-circle" src="' + (mess.reply ? data.avatar1 : data.avatar2) + '" alt="">' +
                       '</a>' +
                       '</div>' +
                       '<div class="media-body">' +
                       '<p><strong><a href="' + (mess.reply ? data.profile1 : data.profile2) + '">' + (mess.reply ? data.display_name1 : data.display_name2) + '</a></strong></p>' +
                       '<p>' + mess.content + '</p></div></div>');
           });

       }, 'json');
   });
</script>