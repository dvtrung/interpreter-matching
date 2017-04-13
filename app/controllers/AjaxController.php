<?php

class AjaxController extends ControllerBase {

   public function initialize() {
      parent::initialize();
   }

   

   public function languagesAction() {
      $status = 200;
      $description = 'OK';
      $headers = array();
      $contentType = 'application/json';
      $langs = array();
      global $languages;
      foreach ($languages as $key => $lang) {
         $langs[] = array('code' => $key, 'value' => $lang);
      }
      $content = json_encode($langs);

      $response = new \Phalcon\Http\Response();

      $response->setStatusCode($status, $description);
      $response->setContentType($contentType, 'UTF-8');
      $response->setContent($content);

      foreach ($headers as $key => $value) {
         $response->setHeader($key, $value);
      }

      $this->view->disable();

      return $response;
   }
}
