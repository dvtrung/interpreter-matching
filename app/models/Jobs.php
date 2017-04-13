<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Url;

class Jobs extends Model {

   const JOB_ACTIVE = 'active';
   const JOB_EXPIRED = 'expired';
   const JOB_DECIDED = 'decided';

   public function initialize() {
      $this->hasMany("id", "Applications", "job_id");
   }

   public function beforeCreate() {
      $this->viewcount = 0;
      $this->created_at = date("Y-m-d H:i:s");
      $this->updated_at = date("Y-m-d H:i:s");
      $this->account_id = account_id();
      $this->status = "active";
   }

   public function beforeUpdate() {
      $this->updated_at = date("Y-m-d H:i:s");
   }

   public static function from_application_list($applications) {
      $ret = array();
      foreach ($applications as $application) {
         $ret[] = Jobs::byID($application->job_id);
      }
      return $ret;
   }

   public static function search($loc, $language, $limit) {
      $builder = Phalcon\DI::getDefault()->getShared('modelsManager')->createBuilder();
      $builder->from("Jobs");

      $langs = explode(',', $language);
      foreach ($langs as $lang) {
         $lang_code = Languages::get_language_code($lang);
         //if ($lang_code) $builder->andWhere("");
      }

      //$loc = explode(',', $this->request->getPost('loc'));
      //$loc = $loc[0];
      //$builder->andWhere("INSTR(LOWER(CONCAT(city, ' ', country)), :loc:) > 0", 
      //        array('loc' => $loc));

      if ($limit != null) $builder->limit($limit);
      return $builder->getQuery()->execute();
   }

   public static function suggested_jobs($interpreter, $limit) {
      return Jobs::search(null, null, $limit);
   }

   public static function info_box($job, $vertical = false) {
      $user = Users::load_by_id($job->account_id);
      ?>
      <a href="<?= $job->get_job_url() ?>"><?= get_date($job->date_from) . " - " . get_date($job->date_to) ?></a>
      <p><?= icon("user") ?>By <a href="<?= $user->get_profile_page_url(); ?>"><?= $user->get_display_name() ?></a></p>
      <p><?= icon("globe") ?><?= get_language($job->lang_from) ?> ↔ <?= get_language($job->lang_to) ?></p>

      <p><?= icon("screenshot") ?><?= $job->location ?></p>
      <div class="two-line"><?= icon("info-sign") ?><?= $job->desc ?></div>

      <?php
   }

   public static function small_info_box($job) {
      ?>
      <a href="<?= get_url("job/detail/$job->id") ?>" class="list-group-item box-job">
          <h4><?= get_date($job->date_from) . " - " . get_date($job->date_to) ?></h4>
          <p class="one-line"><?= $job->get_status_text(); ?></p>
          <p class="one-line" id="location"><?= get_icon("screenshot") ?><?= $job->location ?></p>
          <p class="one-line" id="lang"><?= get_icon("globe") ?><?= $job->get_language() ?></p>
          <p id="profile_text" class="two-line"><?= get_icon("info-sign") ?><?= nl2br($job->desc) ?></p>
      </a>
      <?php
   }

   public static function byID($id) {
      return Jobs::findFirst(array(
                      "conditions" => "id = ?1",
                      "bind" => array(1 => $id)));
   }

   public static function by_account_id($account_id, $status = null) {
      if (!$status) return Jobs::find(array(
                         "conditions" => "account_id = ?1",
                         "bind" => array(1 => $account_id)));
      else return Jobs::find(array(
                         "conditions" => "account_id = ?1 AND status = ?2",
                         "bind" => array(1 => $account_id, 2 => $status)));
   }

   private function get_status_html($text, $icon, $status) {
      return get_icon($icon) . "<strong><span class=\"text-$status\">$text</span></strong>";
   }

   public function get_status_text() {
      $applications = $this->getApplications(array("conditions" => "interpreter_id = " . account_id()));
      $application = count($applications) > 0 ? $applications[0] : null;
      if (account_id() == $this->account_id) { // is owner of the job?
         if ($this->status == Jobs::JOB_ACTIVE) return $this->get_status_html("Open for Applications.", "ok", "primary");
         else if ($this->status == Jobs::JOB_DECIDED) return $this->get_status_html("You got an interpreter.", "ok", "success");
         else if ($this->status == Jobs::JOB_EXPIRED) return $this->get_status_html("Expired.", "remove", "danger");
      } else {
         if (!$application) { // If current user have not applied
            if ($this->status == Jobs::JOB_ACTIVE) return $this->get_status_html("Open for Applications.", "ok", "primary");
            else if ($this->status == Jobs::JOB_DECIDED || $this->status == Jobs::JOB_EXPIRED) return $this->get_status_html("Closed.", "remove", "danger");
         } else {
            $status = $application->get_my_status();
            if ($status == Applications::APP_APPLIED) return $this->get_status_html("You applied for this.", "ok", "warning");
            else if ($status == Applications::APP_CANCELED) return $this->get_status_html("You canceled this job.", "remove", "danger");
            else if ($status == Applications::APP_REJECTED) return $this->get_status_html("You got rejected.", "remove", "danger");
            else if ($status = Applications::APP_ACCEPTED) return $this->get_status_html("You got accepted.", "ok", "success");
         }
      }
   }

   public function get_job_url() {
      echo get_url("job/detail/$this->id");
   }

   public function get_language() {
      $langs = explode(",", $this->lang);
      $ret = "";
      global $languages;
      foreach ($langs as $lang) {
         if ($lang == '') continue;
         $ret .= $languages[$lang] . ", ";
      }
      if ($ret == "") return "None";
      return substr($ret, 0, strlen($ret) - 2);
   }

   public function get_date() {
      return get_date($this->date_from) . " - " . get_date($this->date_to);
   }

   public function get_title() {
      return $this->title . ' (' . $this->get_date() . ')';
   }

   public static function render_list_from_applications($applications) {
      Jobs::render_list(Jobs::from_application_list($applications));
   }

   public static function render_list($jobs) {
      echo '<div class="container-fluid">';
      foreach ($jobs as $job) {
         ?>
         <div class="col-sm-6"><?php Jobs::small_info_box($job); ?></div>
         <?php
      }
      echo "</div>";
   }

}
