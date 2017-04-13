<?php

class JobController extends ControllerBase {

   public function indexAction() {
      
   }

   public function detailAction($job_id) {
      $this->view->job_id = $job_id;
      $this->view->job = Jobs::byID($job_id);
      $this->view->applications = $this->view->job->getApplications(array("conditions" => "status = 'applied'"));
      $this->view->owner = Users::load_by_id($this->view->job->account_id);
      $this->view->is_my_job = ($this->view->job->account_id == account_id());
      $this->view->job_status = $this->view->job->status;

      $this->view->my_application = null;
      if (is_interpreter()) {
         $my_applications = $this->view->job->getApplications(array(
                 "conditions" => "interpreter_id = " . account_id()));
         if (count($my_applications) > 0) {
            $this->view->my_application = $my_applications[0];
            $this->view->app_status = $this->view->my_application->get_my_status();
         }
      }

      if ($this->view->is_my_job) {
         if ($this->view->job_status == Jobs::JOB_DECIDED) {
            $this->view->chosen_application = $this->view->job->getApplications(array("conditions" => "status = 'accepted'"));
            $this->view->chosen_interpreter = Users::load_by_id($this->view->chosen_application->interpreter_id);
         }
      } else {
         $this->view->job->viewcount++;
         $this->view->job->save();
      }
   }

   public function createAction() {
      $job = new Jobs();
      $job->lang = Languages::name_list_to_code_list($this->request->getPost('lang'));
      
      $job->save($_POST, array('visibility', 'date_from', 'date_to', 'title', 'location', 'desc'));
      $this->redirect_back();
   }
   
   public function saveAction($id) {
      $job = Jobs::byID($id);
      if ($job->account_id == account_id()) {
         $job->lang = Languages::name_list_to_code_list($this->request->getPost('lang'));
         $job->save($_POST, array('visibility', 'date_from', 'date_to', 'title', 'location', 'desc'));
         $this->redirect_back();
      }
   }

   // Toggle
   public function applyAction($job_id) {
      if (!is_interpreter()) return;
      $application = Applications::findFirst(array(
                      "conditions" => "job_id = ?1 AND interpreter_id = ?2",
                      "bind" => array(1 => $job_id, 2 => account_id())
      ));
      if (!$application) { // if have not applied
         $job = Jobs::byID($job_id);
         $application = new Applications();
         $application->create(array(
                 "job_id" => $job_id,
                 "interpreter_id" => account_id(),
                 "status" => Applications::APP_APPLIED,
                 'intro' => $this->request->getPost('message'),
         ));
      } else {
         if ($application->status == Applications::APP_INVITED) {
            $application->save(array(
                    "status" => Applications::APP_APPLIED,
                    'intro' => $this->request->getPost('message'),
            ));
         } else {
            $application->status = 'canceled';
            $application->save();
         }
      }
      return $this->redirect_back();
   }

   public function apply_againAction($app_id) {
      $application = Applications::by_id($app_id);
      $application->status = Applications::APP_APPLIED;
      $application->save();
      return $this->redirect_back();
   }

   public function ajax_job_listAction($interpreter_id) {
      $this->view->jobs = Jobs::by_account_id(account_id(), Jobs::JOB_ACTIVE);
      $this->view->interpreter_id = $interpreter_id;
   }

   public function inviteAction($job_id, $applicant_id) {
      $job = Jobs::byID($job_id);
      if ($job->account_id == account_id()) {
         $application = Applications::findFirst(array(
                         "conditions" => "job_id = ?1 AND interpreter_id = ?2",
                         "bind" => array(1 => $job_id, 2 => $applicant_id)
         ));
         if (!$application) { // if have not applied
            $job = Jobs::byID($job_id);
            $application = new Applications();
            $application->create(array(
                    "job_id" => $job_id,
                    "interpreter_id" => account_id(),
                    "status" => 'invited',
                    'intro' => '',
            ));
         }
      }
   }

}
