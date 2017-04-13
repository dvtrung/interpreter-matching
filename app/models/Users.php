<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Url;

class Users extends Model {

   public static function load_by_id($account_id) {
      $account = Accounts::load_by_id($account_id);
      return Users::load_from_account($account);
   }

   public static function load_from_account($account) {
      if ($account->type == "interpreter") {
         $user = Interpreters::load_by_id($account->user_id);
      } else if ($account->type == "customer") {
         $user = Customers::load_by_id($account->user_id);
      }
      $user->email = $account->email;
      $user->confirmed = $account->confirmed;
      return $user;
   }

   public function get_profile_picture_url() {
      $url = new Url();
      $url->getBaseUri();
      $filename = $url->getStatic("img/profile/" . md5($this->account_id) . ".jpeg");
      if (file_exists("img/profile/" . md5($this->account_id) . ".jpeg")) return $filename;
      else return $url->getStatic("img/profile/default_m.png");
   }

   public function get_small_circle_profile_picture() {
      ?>
      <a href="<?= $this->get_profile_page_url() ?>">
          <img src="<?= $this->get_profile_picture_url() ?>" alt="Profile Picture" class="img-circle" height="48px" width="48px"/>
      </a>
      <?php
   }

   public function get_profile_picture_img() {
      return "<img src=\"" . $this->get_profile_picture_url() . "\" class=\"img-rounded img-responsive img-thumbnail\"/>";
   }

   public function get_small_profile_picture() {
      return "<img src=\"" . $this->get_profile_picture_url() . "\" height=\"32px\" width=\"32px\"/>";
   }

   public function get_display_name() {
      return $this->first_name . " " . $this->family_name;
   }

   function get_profile_page_url() {
      return get_url("profile/display/$this->account_id");
   }

   function get_profile_page_link() {
      return "<a href=\"" . $this->get_profile_page_url() . "\">" . $this->get_display_name() . "</a>";
   }

   public function profile_box($vertical = false) {
      ?>
      <div class="panel panel-default">
            <div class="panel-body">
                <div class="col-lg-4" style="padding: 0px">
                    <a href="<?= get_url("user/profile/$this->account_id") ?>">
                        <?= $this->get_profile_picture_img() ?>
                    </a>
                </div>
                <div class="col-lg-8">
                    <p><h4><?= $this->get_profile_page_link() ?></h4></p>
                    <p><i class="fa fa-male"></i> <?= $this->get_gender() ?> - <?= $this->get_age() ?></p>
                    <p><i class="fa fa-map-marker"></i> From <?= $this->get_city() ?></p>
                </div>
            </div>
        </div>
      <?php
   }

   public function profile_overview_content() {
      $url = new Url();
      $url->getBaseUri();
      ?>
      <img src="<?= $this->get_profile_picture_url() ?>" class="img-responsive" width="100%"/>
      <div class="caption">
          <p class="one-line"><h4><?= $this->get_display_name() ?></h4></p>
      <p class="one-line"><i class="fa fa-male"></i> <?= $this->get_gender() ?> - <?= $this->get_age() ?></p>
      <p class="one-line"><i class="fa fa-map-marker"></i> From <?= $this->get_city() ?></p>
      </div>            
      <?php
   }

   public function get_age() {
      if (!$this->dob) return "Age [?]";
      else return "Age " . date_diff(date_create($this->dob), date_create('today'))->y;
   }

   public function get_gender() {
      if (!$this->gender) return "Gender [?]";
      else if ($this->gender == 'male') return 'Male';
      else return 'Female';
   }

   public function get_city() {
      global $countries;
      if (!$this->country || !isset($countries[strtoupper($this->country)])) return "[?]";
      else if (!$this->city) return $countries[strtoupper($this->country)];
      else return $this->city . ", " . $countries[strtoupper($this->country)];
   }

   public static function render_small_item_list($users, $width = 4) { ?>
      <div class="list-group">
      <?php foreach ($users as $user) {
         ?>
          <a href="<?=get_profile_page_url($user)?>" class="list-group-item">
                 <div class="media-left">
                         <img class="media-object avatar-small img-circle" src="<?= $user->get_profile_picture_url() ?>" alt="...">
                 </div>
                 <div class="media-body" style="vertical-align: middle">
                         <strong><?=$user->get_display_name() ?></strong>
                 </div>
         </a>
         <?php
      } ?>
      </div>
          <?php
   }

   public static function render_big_item_list($users) {
      foreach ($users as $user) {
         ?>
         <div class="col-sm-12 col-md-4">
             <div class="thumbnail">
                 <a href="<?= $user->get_profile_page_url() ?>">
                     <?php $user->profile_overview_content() ?>
                 </a>
             </div>
         </div>
         <?php
      }
   }

}
