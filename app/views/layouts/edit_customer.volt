<?php
$nav_items = array(
    "jobs" => "Jobs By Me",
    "basic_profile" => "Basic Profile",
)
?>

<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
              <?php foreach ($nav_items as $key => $item) { 
                  if ($this->getView()->getActionName() == $key) { 
                      $title = $item; ?>
                      <li class="active"><?=Phalcon\Tag::linkTo("dashboard/".$key, $item."<span class=\"sr-only\">(current)</span>")?></li>
                  <?php } else { ?>
                      <li><?=Phalcon\Tag::linkTo("dashboard/".$key, $item)?></a></li>
                  <?php }
              }
?>
          </ul>
        </div>
      
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<div class="page-header"><h2><?=$title?></h2></div>
<?php echo $this->getContent() ?>
</div>
</div>