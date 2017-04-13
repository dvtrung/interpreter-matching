<?php global $user; ?>
<div class="container">
    <div class="col-lg-8">
        <div class="panel panel-default">
        <div class="panel-body">
        <div class="col-lg-4">
        <img src="<?=$display_user->get_profile_picture_url()?>" class="img-rounded img-responsive"/>
        </div>
            <div class="col-lg-8">
                <h3><?=$display_user->get_display_name()?></h3>
                <div>
                <div class="col-lg-6">
                <p><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <?=ucfirst($display_user->gender)?> - Age <?=date_diff(date_create($display_user->dob), date_create('today'))->y?></p>
                <p><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Living in <?=$display_user->city?></p>
                </div>
                <div class="col-lg-6">
                    <p>Native Language</p>
                    <p>Can Speak</p>
                </div>
                </div>
                <div>
                <p>
<?php 
if ($user->account_id == $display_user->account_id) {
    echo $this->tag->linkTo(array("dashboard/edit_profile", "<span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span> Edit Profile", "class" => "btn btn-primary"));
}
?>
                </p>
                </div>
                </div>
        </div>
    </div>
    </div>
    <div class="col-lg-4">
        <div class="panel panel-default">
            <div class="panel-heading">Experiences</div>
            <div class="panel-body"></div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">References</div>
            <div class="panel-body"></div>
        </div>
    </div>
</div>