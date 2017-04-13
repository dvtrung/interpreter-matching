<?php

class Interpreters extends Users
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
    
    var $type = "interpreter";
    
    public function initialize() {
        $this->skipAttributesOnCreate(array('family_name', "first_name", "country", "native_lang", "zipcode", "prefecture", "city", "phone_number", "dob", "intro", "gender"));
        $this->hasMany("account_id", "LanguageProfiles", "interpreter_id");
    }
    
    public static function load_by_id($id) {
        $user = Interpreters::findFirst(array(
            "conditions" => "id = ?1",
            "bind"       => array(1 => $id)));
        return $user;
    }
    
    public function references_box() {
        $references = References::find(array(
            "conditions" => "user2 = ?1",
            "bind" => array(1 => $this->account_id)
        ));
        foreach ($references as $reference) {
            $customer = Users::load_by_id($reference->user1);
            ?>

<blockquote><p><?=$reference->content?></p>
    <footer><?=$customer->get_profile_page_link()?></footer>
</blockquote>
<?php
        }
        if (count($references) == 0) echo "There is no reference.";
    }
}