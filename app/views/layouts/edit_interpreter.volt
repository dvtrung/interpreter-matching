<?php
$nav_items = array(
    "basic_profile" => get_icon("edit")."Basic Profile",
    "lang_profile" => get_icon("education")."Language Experience",
)
?>
<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
              <?php foreach ($nav_items as $key => $item) { 
                  if ($this->getView()->page == $key) { ?>
                      <li class="active"><?=Phalcon\Tag::linkTo("profile/edit/".$key, $item."<span class=\"sr-only\">(current)</span>")?></li>
                  <?php } else { ?>
                      <li><?=Phalcon\Tag::linkTo("profile/edit/".$key, $item)?></a></li>
                  <?php }
              }
?>
          </ul>
        </div>
      
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<?php echo $this->getContent() ?>
</div>
</div>