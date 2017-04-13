<?php

use Phalcon\Mvc\Model;

class Languages extends Model {

   public static $language_level = array(
           "No proficiency",
           "Elementary proficiency",
           "Limited working proficiency",
           "Professional working proficiency",
           "Full professional proficiency",
           "Native or bilingual proficiency");

   public static function get_language_code($str) {
      $lang = Languages::findFirst(array(
                      "conditions" => "name=:name:",
                      "bind" => array('name' => $str)
      ));
      if ($lang) return $lang->code;
      else return null;
   }

   public static function get_language($code) {
      $lang = Languages::findFirst(array(
                      "conditions" => "code=:code:",
                      "bind" => array('code' => $code)
      ));
      if ($lang) return $lang->name;
      else return null;
   }

   public static function code_list_to_name_list($str) {
      $codes = explode(',', $str);
      $langs = array();
      foreach ($codes as $code) {
         if ($code != '') $langs[] = Languages::get_language($code);
      }
      return implode(',', $langs);
   }

   public static function name_list_to_code_list($str) {
      $langs = explode(',', $str);
      $ret = ',';
      foreach ($langs as $lang) {
         $ret .= Languages::get_language_code(trim($lang)) . ',';
      }
      return $ret;
   }

}
