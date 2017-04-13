<?php

use Phalcon\Mvc\Model;

class Threads extends Model
{
    public function beforeCreate()
    {
        $this->created_at = date("Y-m-d H:i:s");
    }
    
    public static function byID($id) {
        return Threads::findFirst(array(
            "conditions" => "id = ?1",
            "bind"       => array(1 => $id)));
    }
    
    public function initialize() {
        $this->hasMany('id', 'Messages', 'thread_id');
    }
    
    public static function by_job_id_and_applicant($job_id, $applicant_id) {
      return Threads::findFirst(array(
          "conditions" => "job_id = ?1 AND ((user1 = ?2 AND user2 = ?3) OR (user1 = ?3 AND user2 = ?2))",
          "bind" => array($job_id, account_id(), $applicant_id)));
    }
}