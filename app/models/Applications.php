<?php

use Phalcon\Mvc\Model;

class Applications extends Model {

   const APP_ACCEPTED = 'accepted';
   const APP_REJECTED = 'rejected';
   const APP_INVITED = 'invited';
   const APP_CANCELED = 'canceled';
   const APP_APPLIED = 'applied';

   public function initialize() {
      $this->hasMany("id", "Messages", "application_id");
      $this->belongsTo("job_id", "Jobs", "id");
   }

   public function beforeCreate() {
      $this->created_at = date("Y-m-d H:i:s");
      $this->updated_at = date("Y-m-d H:i:s");
   }

   public function beforeUpdate() {
      $this->updated_at = date("Y-m-d H:i:s");
   }

   public static function load_application($interpreter_id, $job_id) {
      $application = Applications::findFirst(array(
                      "conditions" => "interpreter_id = ?1 AND job_id = ?2",
                      "bind" => array(1 => $interpreter_id, 2 => $job_id)
      ));
      return $application;
   }

   public static function by_interpreter_id($interpreter_id) {
      $application = Applications::find(array(
                      "conditions" => "interpreter_id = ?1",
                      "bind" => array(1 => $interpreter_id)
      ));
      return $application;
   }

   public static function by_id($application_id) {
      return Applications::findFirst(array(
                      "conditions" => "id = ?1",
                      "bind" => array(1 => $application_id)
      ));
   }

   public static function get_user_list($applications) {
      $users = array();
      foreach ($applications as $application) $users[] = Users::load_by_id($application->interpreter_id);
      return $users;
   }

   public function get_time() {
      return time_since($this->created_at);
   }

   public function get_my_status() {
      $job = $this->jobs;
      if ($job->status == Jobs::JOB_DECIDED) {
         if ($this->status == Applications::APP_ACCEPTED) return Applications::APP_ACCEPTED;
         else return Applications::APP_REJECTED;
      } else {
         return $this->status;
      }
   }

   public static function get_my_jobs($status) {
      return Applications::find(array(
                      "conditions" => "interpreter_id = ?1 AND status = '$status'",
                      "bind" => array(1 => account_id()),
                      "order" => "created_at DESC"
      ));
   }

   public static function get_all_my_applications() {
      $all_applications = Applications::find(array(
                      "conditions" => "interpreter_id = ?1",
                      "bind" => array(1 => account_id()),
                      "order" => "created_at DESC"
      ));
      $applications = array();
      foreach ($all_applications as $application) {
         $applications[$application->get_my_status()][] = $application;
      }
      return $applications;
   }

}
