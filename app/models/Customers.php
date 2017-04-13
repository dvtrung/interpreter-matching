<?php

class Customers extends Users {

   public function initialize() {
      $this->hasMany("account_id", "Jobs", "account_id");
   }

   public function beforeCreate() {
      $this->created_at = date("Y-m-d H:i:s");
      $this->updated_at = date("Y-m-d H:i:s");
   }

   public function beforeUpdate() {
      $this->updated_at = date("Y-m-d H:i:s");
   }

   public static function load_by_id($id) {
      $user = Customers::findFirst(array(
                      "conditions" => "id = ?1",
                      "bind" => array(1 => $id)));
      return $user;
   }

   var $type = "customer";

}
