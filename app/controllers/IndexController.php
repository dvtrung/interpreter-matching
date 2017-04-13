<?php

class IndexController extends ControllerBase {

  public function indexAction() {
    $this->view->t = $this->getTranslation();
    if (is_signed_in()) {
      $this->response->redirect('dashboard');
    }
  }
  
  public function languageAction($lang) {
    $this->session->set("lang", $lang);
    $this->redirect_back();
  }
}
