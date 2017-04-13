<h3><i class="fa fa-globe fa-fw"></i> My Language Experience <small><a href="#" data-toggle="modal" data-target="#lang-profile-model"><i class="fa fa-plus"></i> Add</a></small></h3>
<?php
foreach ($display_user->languageProfiles as $profile) {
   ?>
   <h4><?= $profile->languages->name ?> <small><a href="#" data-toggle="" data-target="#lang-profile-model"><i class="fa fa-pencil"></i> Edit</a><br><?= Languages::$language_level[$profile->level] ?></small></h4>
   <?= nl2p($profile->profile_text) ?>
<?php }
?>

{{ partial("profile/interpreter/dialogs/lang_profile") }}