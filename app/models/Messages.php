<?php

use Phalcon\Mvc\Model;

class Messages extends Model {

   public function beforeCreate() {
      $this->created_at = date("Y-m-d H:i:s");
   }

   public static function count_unread_messages($userid) {
      $count = 0;
      $threads = Threads::find(array(
                      "conditions" => "user1 = ?1 OR user2 = ?1",
                      "bind" => array(1 => $userid)
      ));
      foreach ($threads as $thread) {
         $last_message = Messages::findFirst(array(
                         "conditions" => "thread_id = ?1",
                         "bind" => array(1 => $thread->id),
                         "order" => "created_at DESC"
         ));
         if ($last_message->is_read == 0) $count++;
      }
      return $count;
   }

   public function is_unread($userid, $thread) {
      return (!$this->is_read &&
              (($this->is_reply && $userid == $thread->user1) ||
              (!$this->is_reply && $userid == $thread->user2)));
   }

   public function get_time() {
      return time_since($this->created_at);
   }

   public static function add_message_to_thread($job_id, $recipient_id, $message_body) {
      $thread = Threads::findFirst(array(
                      "conditions" => "job_id = ?1 AND ((user1 = ?2 AND user2 = ?3) OR (user2 = ?2 AND user1 = ?3))",
                      "bind" => array(1 => $job_id, 2 => $recipient_id, 3 => account_id())
      ));
      if (!$thread) {
         $thread = new Threads();
         $thread->create();
      }
      $thread->save(array(
              'job_id' => $job_id,
              'user1' => $recipient_id,
              'user2' => account_id()));
      $message = new Messages();
      $message->create(array(
              'thread_id' => $thread->id,
              'is_reply' => 1,
              'message_body' => $message_body,
              'is_read' => 0));
      return $thread->id;
   }

   public static function render_single_message($message, $interpreter, $customer) {
      $sender = $message->is_reply == 1 ? $customer : $interpreter;
      ?>
      <div class="media">
          <div class="media-left">
              <a href="<?= $sender->get_profile_page_url() ?>">
                  <img src="<?= $sender->get_profile_picture_url() ?>" alt="Profile Picture" class="img-circle media-object" height="48px" width="48px"/>
              </a>
          </div>
          <div class="media-body">
              <h4 class="media-heading"><?= $sender->get_profile_page_link(); ?></h4>
              <p><?= $message->message_body ?><br><span class="small text-muted"><?= $message->get_time() ?></span></p>
          </div>
      </div>
      <?php
   }

   public static function render_messages($application) {
      $interpreter = Users::load_by_id($application->interpreter_id);
      $customer = Users::load_by_id($application->Jobs->account_id);

      $messages = $application->messages;
      ?>
      <div class="media">
          <div class="media-left">
              <a href="<?= get_profile_page_url($interpreter) ?>">
                  <img src="<?= get_profile_picture_url($interpreter) ?>" alt="Profile Picture" class="img-circle media-object" height="48px" width="48px"/>
              </a>
          </div>
          <div class="media-body">
              <h4 class="media-heading"><?= $interpreter->get_profile_page_link() ?> 
                  <small><?= $interpreter->get_gender() . ' - ' . $interpreter->get_age() ?></small><br><small>From <?= $interpreter->get_city() ?></small>
              </h4>
              <p><?= $application->intro ?><br><span class="small text-muted"><?= $application->get_time() ?></span></p>
              <?php foreach ($messages as $message) Messages::render_single_message($message, $interpreter, $customer); ?>
              <p><a href="#mess-<?=$application->id?>" data-toggle="collapse"><i class="fa fa-reply"></i> Reply</a></p>
              <form method="post" action="<?=get_url("message/send")?>" id="mess-<?=$application->id?>" class="collapse">
                  <input type="hidden" name="id" value="<?=$application->id?>"/>
                  <div class="form-group">
                      <textarea name="message_body" class="form-control" rows="8"></textarea>
                  </div>
                  <div class="form-group text-right">
                      <button type="submit" class="btn btn-default">Send</button>
                      <a href="#mess-<?=$application->id?>" data-toggle="collapse" class="btn btn-primary">Cancel</a>
                  </div>
              </form>
          </div>
      </div>
      <?php
   }
}
