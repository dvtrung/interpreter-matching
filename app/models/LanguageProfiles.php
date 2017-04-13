<?php

use Phalcon\Mvc\Model;

class LanguageProfiles extends Model {

   public function initialize() {
      $this->hasOne("lang", "Languages", "code");
   }

   public function beforeCreate() {
      $this->created_at = date("Y-m-d H:i:s");
      $this->updated_at = date("Y-m-d H:i:s");
   }

   public function beforeUpdate() {
      $this->updated_at = date("Y-m-d H:i:s");
   }

   public static function load($userid) {
      return LanguageProfile::find(array(
                      "conditions" => "translator_id = ?1",
                      "bind" => array(1 => $userid)));
   }

}
