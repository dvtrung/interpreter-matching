<h3><i class="fa fa-globe fa-fw"></i> Language Experience</h3>
<?php
foreach ($display_user->languageProfiles as $profile) {
   ?>
   <h4><?= $profile->languages->name ?> <br><small><?= Languages::$language_level[$profile->level] ?></small></h4>
   <?= nl2p($profile->profile_text) ?>
<?php }
?>
