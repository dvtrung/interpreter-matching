<?php

use Phalcon\Mvc\Controller;
use Phalcon\Translate\Adapter\NativeArray;
use Phalcon\Mvc\Router;

class ControllerBase extends Controller {

   protected function getTranslation() {
      // Ask browser what is the best language
      $language = $this->request->getBestLanguage();

      if (file_exists("../app/messages/" . $language . ".php")) {
         require "../app/messages/" . $language . ".php";
      } else {
         require "../app/messages/en.php";
      }
      return new NativeArray(array("content" => $messages));
   }

   public function initialize() {
      $this->view->t = $this->getTranslation();
      if ($this->request->isAjax()) {
         $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
      }
   }
   
   public function error($message) {
      $this->response->redirect("error");
   }

   public function redirect_back() {
      return $this->response->redirect($_SERVER['HTTP_REFERER']);
   }

   protected function checkAjaxRequired() {
      if (!$this->request->isAjax()) {
         $this->response->setStatusCode(404, "Not Found");
         $this->dispatcher->forward(array(
                 'controller' => 'error',
                 'action' => '404',
         ));
         return false;
      }
      return true;
   }

}
