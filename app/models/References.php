<?php

use Phalcon\Mvc\Model;

class References extends Model
{
    public function beforeCreate()
    {
        $this->created_at = date("Y-m-d H:i:s");
        $this->updated_at = date("Y-m-d H:i:s");
    }

    public function beforeUpdate()
    {
        $this->updated_at = date("Y-m-d H:i:s");
    }
    
    public static function load_by_id($id) {
        return References::findFirst(array(
            "conditions" => "id = ?1",
            "bind"       => array(1 => $id)));
    }
}

