<?php

function account_id() {
   global $user;
   return $user->account_id;
}

function user() {
   global $user;
   return $user;
}

function create_profile_picture_thumbnail($data) {
   global $user;
   $filename = md5($user->account_id);
   $uri = substr($data, strpos($data, ",") + 1);
   $encodedData = str_replace(' ', '+', $uri);
   $decodedData = base64_decode($encodedData);
   $imageTmp = imagecreatefromstring($decodedData);

   $photoX = ImagesX($imageTmp);
   $photoY = ImagesY($imageTmp);
   $imageFin = ImageCreateTrueColor(200, 200);
   ImageCopyResampled($imageFin, $imageTmp, 0, 0, 0, 0, 201, 201, $photoX, $photoY);
   ImageJPEG($imageFin, "img/profile/$filename.jpeg");
   ImageDestroy($imageTmp);
   ImageDestroy($imageFin);

   return get_static_url("img/profile/$filename.jpeg");
}

function is_interpreter() {
   if (!is_signed_in()) return false;
   global $user;
   return $user->type == "interpreter";
}

function is_customer() {
   if (!is_signed_in()) return false;
   global $user;
   return $user->type == "customer";
}

function is_signed_in() {
   $di = Phalcon\DI::getDefault();
   return ($di->get("session")->get("account_id") != null);
}

function is_new_account() {
   $di = Phalcon\DI::getDefault();
   return $di->get("session")->get("new_account_id");
}

function get_profile_picture_url($user = null) {
   if (!$user) $user = user();
   return $user->get_profile_picture_url();
}

function get_display_name($user = null) {
   if (!$user) $user = user();
   return $user->get_display_name();
}

function get_profile_page_link($user = null) {
   if (!$user) $user = user();
   return $user->get_profile_page_link();
}

function get_profile_page_url($user = null) {
   if (!$user) $user = user();
   return $user->get_profile_page_url();
}