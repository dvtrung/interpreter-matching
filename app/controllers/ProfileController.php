<?php

class ProfileController extends ControllerBase {

   public function indexAction() {
      global $user;
      $type = $user->type;
      $this->view->display_user = $user;
      $this->view->pick("profile/$type/myprofile");
      $this->assets
              ->addCss('//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css', false)
              ->addJs('//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js', false)
              ->addJs('/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js')
              ->addJs('/plugins/combodate/combodate.js')
              ->addJs('/js/moment.js')
      ;
   }

   public function displayAction($id) {
      $this->view->display_user = Users::load_by_id($id);
      $this->view->pick("profile/" . $this->view->display_user->type . "/index");
      if ($id == account_id()) {
         $this->response->redirect("profile");
      }
   }

   public function postAction() {
      $this->view->disable();
      global $user;

      if ($this->request->getPost("image")) {
         $data = $this->request->getPost("image");
         echo create_profile_picture_thumbnail($data);
         return;
      }
      //if (!($this->request->isPost() && $this->request->isAjax())) return;
      $name = $this->request->getPost('name');
      $value = $this->request->getPost('value');
      if ($name == "intro") {
         $value = str_replace('\r\n', '<br/>', $this->request->getPost('value'));
      } else if ($name == "gender" && $value == "") {
         $value = null;
      }

      $user->save([$name => $value], ['family_name', 'first_name', 'gender', 'dob', 'intro']);

      if (is_customer()) {
         
      } else if (is_interpreter()) {
         
      }
   }
   
   public function edit_language_profileAction() {
      $lp = new LanguageProfiles();
      $lp->interpreter_id = account_id();
      $lp->lang = Languages::get_language_code($this->request->getPost("lang"));
      $lp->certificate = $this->request->getPost("certificate");
      $lp->level = $this->request->getPost("level");
      $lp->profile_text = $this->request->getPost("profile-text");
      $lp->save();
      $this->redirect_back();
   }

}
