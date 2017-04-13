
<div class="container">
    <div class="col-lg-3">
        <div class="panel panel-default">
            <div class="panel-heading">Job Overview <span class="label label-primary pull-right">Active</span></div>
            <div class="panel-body">
                <p id="location"><?=get_icon("screenshot")?><?=$job->location?></p>
                <p id="lang"><?=get_icon("globe")?><?=$job->get_language()?></p>
                <a href="#">Detail...</a>
            </div>
        </div>
        
    </div>
    <div class="col-lg-9">
<div class="media">
  <div class="media-left bottom">
    <a href="#">
      <img class="media-object img-circle" src="<?=$reciepient->get_profile_picture_url()?>" alt="Profile Picture" height="64px" width="64px">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading"><?=$reciepient->get_profile_page_link()?></h4>
    From <?=$reciepient->city?>
  </div>
</div>
        <hr>
        <div>
<?php echo $this->tag->form(array("message/send/$thread_id")); ?>        
<div class="form-group">
    <?php echo $this->tag->textArea(array("message_body", "placeholder" => "Write a message", "rows" => "5", "class" => "form-control")) ?>
</div>
<button type="submit" class="btn btn-primary">Send</button>
</form>
        </div>
        <hr>
<?php
$have_unread_message = false;
foreach ($messages as $message) { 
    if ($message->is_unread($user->account_id, $thread)) { $message->is_read = 1; $have_unread_message = true; }
    $message->save();
    
    $current_user = ($message->is_reply == 0) ? $user1 : $user2;
    ?>
<div class="media">
  <div class="media-left bottom">
    <a href="#">
      <img class="media-object img-circle" src="<?=$current_user->get_profile_picture_url()?>" alt="Profile Picture" height="64px" width="64px">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading"><?=$current_user->get_profile_page_link()?></h4>
    <?=$message->message_body;?>
    <p><small><?=time_since($message->created_at)?></small></p>
  </div>
</div>
        <hr>
<?php 
}
if ($have_unread_message) { $user->unread_mess_count--; $user->save(); }
?>
    </div>
</div>


<button onclick="location.href = '<?= get_url("message/delete/$thread->id") ?>'" class="close" data-dismiss="modal">&times;</button>