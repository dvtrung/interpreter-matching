<?php

use Phalcon\Mvc\Url;

function getDI() {
   return Phalcon\DI::getDefault();
}

function nl2p($string) {
   $paragraphs = '';

   foreach (explode("\n", $string) as $line) {
      if (trim($line)) {
         $paragraphs .= '<p>' . $line . '</p>';
      }
   }

   return $paragraphs;
}

function icon($res) {
   ?>
   <span class="glyphicon glyphicon-<?= $res ?>" aria-hidden="true"></span>
<?php
}

function get_icon($res) {
   return "<span class=\"glyphicon glyphicon-$res\" aria-hidden=\"true\"></span> ";
}

function get_url($s) {
   $url = new Url();
   return $url->get($s);
}

function get_static_url($s) {
   $url = new Url();
   return $url->getStatic($s);
}

function get_date($str) {
   $date = date_create($str);
   if (date("Y") != date_format($date, "Y")) return date_format($date, 'M d, Y');
   else return date_format($date, 'M d');
}

function time_since($t) {
   $time = strtotime($t);

   $time = time() - $time; // to get the time since that moment
   if ($time > 432000) return get_date($t);
   $time = ($time < 1) ? 1 : $time;
   $tokens = array(
           31536000 => 'year',
           2592000 => 'month',
           604800 => 'week',
           86400 => 'day',
           3600 => 'hour',
           60 => 'minute',
           1 => 'second'
   );

   foreach ($tokens as $unit => $text) {
      if ($time < $unit) continue;
      $numberOfUnits = floor($time / $unit);
      return $numberOfUnits . ' ' . $text . (($numberOfUnits > 1) ? 's' : '') . " ago";
   }
}