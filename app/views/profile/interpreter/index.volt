<?php global $user; ?>
<div class="container">
    <div class="col-lg-8">
        {{ partial('profile/interpreter/sections/basic_info') }}
        {{ partial('profile/interpreter/sections/about_me') }}
        {{ partial('profile/interpreter/sections/language_experiences') }}
    </div>
    <div class="col-lg-4">
        {{ partial('profile/interpreter/widgets/references') }}
    </div>
</div>

<?php
if (is_customer()) {
   $this->partial('job/dialogs/job_list');
   $this->partial('job/dialogs/create_job');
}