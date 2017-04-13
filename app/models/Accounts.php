<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Uniqueness;

class Accounts extends Model {

   public function beforeCreate() {
      $this->created_at = date("Y-m-d H:i:s");
      $this->updated_at = date("Y-m-d H:i:s");
   }

   public function beforeUpdate() {
      $this->updated_at = date("Y-m-d H:i:s");
   }

   public static function load_by_id($id) {
      return Accounts::findFirst(array(
                      "conditions" => "id = ?1",
                      "bind" => array(1 => $id)));
   }

   public function validation() {
      $this->validate(new Uniqueness(array(
              "field" => "email",
              "message" => "This email has already been registered"
      )));
      if ($this->validationHasFailed() == true) {
         return false;
      }
   }

}
