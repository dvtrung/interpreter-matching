<?php

class MessageController extends ControllerBase {

   public function indexAction() {
      $this->view->applications = Applications::by_interpreter_id(account_id());
   }

   public function threadAction($thread_id) {
      $this->view->application = Applications::by_id($thread_id);
   }

   public function ajax_messageAction() {
      $ret = array();
      $application = Applications::by_id($this->request->getPost('id'));
      $job = $application->jobs;
      $messages = $application->messages;
      if (is_interpreter()) $recipient = Users::load_by_id($application->jobs->account_id);
      else if (is_customer()) $recipient = Users::load_by_id($application->interpreter_id);

      $ret['messages'][] = array(
              'id' => 0,
              'content' => $application->intro,
              'time' => $application->created_at,
              'reply' => true
      );
      foreach ($messages as $message) {
         $ret['messages'][] = array(
                 'id' => $message->id,
                 'content' => $message->message_body,
                 'time' => $message->created_at,
                 'reply' => ($message->is_reply == 1)
         );
      }

      $ret['job_title'] = $job->title . " (" . $job->get_date() . ")";
      $ret['job_status'] = $job->get_status_text();
      $ret['avatar1'] = user()->get_profile_picture_url();
      $ret['avatar2'] = $recipient->get_profile_picture_url();
      $ret['profile1'] = user()->get_profile_page_url();
      $ret['profile2'] = $recipient->get_profile_page_url();
      $ret['display_name1'] = user()->get_display_name();
      $ret['display_name2'] = $recipient->get_display_name();

      $ret['recipient']['id'] = $recipient->account_id;
      echo json_encode($ret);
      $this->view->disable();
      $this->response->setContentType('application/json', 'UTF-8');
   }

   public function sendAction() {
      $message = new Messages();
      $message->application_id = $this->request->getPost('id');
      $message->is_reply = is_customer();
      $message->message_body = $this->request->getPost("message_body");
      $message->is_read = false;

      //$recipient = load_user($thread->user1 == $user->account_id ? $thread->user2 : $thread->user1);
      //$recipient->unread_mess_count = Messages::count_unread_messages($recipient->account_id);
      //$recipient->save();

      $message->create();

      return $this->redirect_back();
   }

   public function newthreadAction($job_id) {
      $job = Job::byID($job_id);
      $id = Messages::add_message_to_thread($job_id, $job->account_id, $this->request->getPost('message'));
      $this->redirect("message/thread/$id");
   }

   public function deleteAction($thread_id) {
      $thread = Threads::byID($thread_id);
      $thread->delete();
   }

}
