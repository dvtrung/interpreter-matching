<?php

use Phalcon\Mvc\Controller;

class DashboardController extends Controller {

  public function initialize() {
    
  }

  public function indexAction() {
    global $user;



    $this->view->pick("dashboard/$user->type/index");
  }

  public function edit_profileAction() {
    
  }

  public function update_profileAction() {
    global $user;
    if ($user->type == "translator") {
      $user->assign($_POST, null, array("first_name", "family_name", "gender", "dob", "country", "city", "prefecture", "zipcode"));
    } else if ($user->type == "customer") {
      $user->assign($_POST, null, array("first_name", "family_name", "company", "country", "gender", "zipcode", "prefecture", "address_1", "address_2", "city"));
    }

    if ($this->request->hasFiles() == true) {
      $file = $this->request->getUploadedFiles()[0];
      $file->moveTo("img/profile/tmp." . $file->getExtension());
      $filename = md5($user->account_id);
      create_profile_picture_thumbnail("img/profile/tmp." . $file->getExtension(), $filename);
    }

    if (!$user->update()) {
      // This record only must be created
      echo "Umh, We can't store robots right now: \n";
      foreach ($user->getMessages() as $message) {
        echo $message, "\n";
      }
      $this->view->disable();
    } else {
      if (is_new_account()) {
        $this->session->set('account_id', $user->account_id);
        $this->session->remove("new_account_id");
        return $this->response->redirect('index');
      } else {
        return $this->response->redirect('dashboard/edit_profile');
      }
    }
  }

  public function update_langAction() {
    if (!is_translator()) {
      return;
    }
    global $user;
    $profile = TranslatorProfile::findFirst(array(
                "conditions" => "translator_id = $user->id and lang = ?1",
                "bind" => array(1 => $_POST["_lang"])));
    $profile->assign($_POST, null, array("profile_text", "level", "lang"));

    if (!$profile->update()) {
      // This record only must be created
      echo "Umh, We can't store robots right now: \n";
      foreach ($profile->getMessages() as $message) {
        echo $message, "\n";
      }
      $this->view->disable();
    } else {
      return $this->response->redirect('dashboard/lang_profile#' . $profile->lang);
    }
  }

  public function lang_profileAction() {
    
  }

  public function jobsAction() {
    $this->view->pick('dashboard/customer/jobs');
  }

}
