<?php
global $user;
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Translator Matching</title>
        {{ assets.outputCss() }}
        {{ assets.outputJs() }}
        <script type="text/javascript">
           (function () {
               var s = document.createElement("script");
               s.type = "text/javascript";
               s.async = true;
               s.src = '//api.usersnap.com/load/' +
                       'a28cd672-741b-481d-bb3a-2b17c2ae4807.js';
               var x = document.getElementsByTagName('script')[0];
               x.parentNode.insertBefore(s, x);
           })();
        </script>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="/">
                        <img alt="Brand" width="20" height="20" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAMAAAC7IEhfAAAA81BMVEX///9VPnxWPXxWPXxWPXxWPXxWPXxWPXz///9hSYT6+vuFc6BXPn37+vz8+/z9/f2LeqWMe6aOfqiTg6uXiK5bQ4BZQX9iS4VdRYFdRYJfSINuWI5vWY9xXJF0YJR3Y5Z4ZZd5ZZd6Z5h9apq0qcW1qsW1q8a6sMqpnLyrn76tocCvpMGwpMJoUoprVYxeRoJjS4abjLGilLemmbrDutDFvdLPx9nX0eDa1OLb1uPd1+Td2OXe2eXh3Ofj3+nk4Orl4evp5u7u7PLv7fPx7/T08vb08/f19Pf29Pj39vn6+fuEcZ9YP35aQn/8/P1ZQH5fR4PINAOdAAAAB3RSTlMAIWWOw/P002ipnAAAAPhJREFUeF6NldWOhEAUBRvtRsfdfd3d3e3/v2ZPmGSWZNPDqScqqaSBSy4CGJbtSi2ubRkiwXRkBo6ZdJIApeEwoWMIS1JYwuZCW7hc6ApJkgrr+T/eW1V9uKXS5I5GXAjW2VAV9KFfSfgJpk+w4yXhwoqwl5AIGwp4RPgdK3XNHD2ETYiwe6nUa18f5jYSxle4vulw7/EtoCdzvqkPv3bn7M0eYbc7xFPXzqCrRCgH0Hsm/IjgTSb04W0i7EGjz+xw+wR6oZ1MnJ9TWrtToEx+4QfcZJ5X6tnhw+nhvqebdVhZUJX/oFcKvaTotUcvUnY188ue/n38AunzPPE8yg7bAAAAAElFTkSuQmCC">
                    </a>
                </div>
                <ul class="nav navbar-nav">
                    <?php if (is_interpreter()) { ?>
                       <li class=""><a href="<?= get_url("dashboard") ?>">Dashboard</a></li>
                       <li class=""><a href="<?= get_url("search/job") ?>">Find Job</a></li>
                    <?php } ?>
                </ul>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <?php if (is_customer()) { ?>
                       <form class="navbar-form navbar-left" role="search" method="get" action="<?= get_url("search/interpreter") ?>">
                           <div class="form-group">
                               <div class="input-group">
                                   <span class="input-group-addon" id="basic-addon1"><i class="fa fa-search"></i></span>
                                   <input style="width: 320px;" id="location" name="loc" type="text" class="form-control autocomplete-location" style="width: 100%" placeholder="Where do you want to find an interpreter?">
                               </div>
                           </div>
                       </form>
                    <?php } else { ?>

                    <?php } ?>
                    <ul class="nav navbar-nav navbar-right">
                        <?php if (!is_signed_in()): ?>
                           <li><?= $this->tag->linkTo("signup", $t->_("new-account")); ?></li>
                           <li><a href="#" data-toggle="modal" data-target="#login-modal"><?= $t->_("sign-in") ?></a></li>
                        <?php else: ?>
                           <li class="dropdown" id="menuInbox">
                               <a class="dropdown-toggle" href="#" data-toggle="dropdown" id="navLogin"><?php
                                   $message_text = get_icon("envelope") . "Inbox";
                                   echo ($user->unread_mess_count > 0) ? "$message_text <span class=\"label label-as-badge label-danger\">" . $user->unread_mess_count . "</span>" : "$message_text";
                                   ?>
                               </a>
                               <div class="dropdown-menu" style="padding:17px;" id="popup-message">
                                   <form class="form" id="formLogin"> 
                                       <input name="username" id="username" type="text" placeholder="Username"> 
                                       <input name="password" id="password" type="password" placeholder="Password"><br>
                                       <button type="button" id="btnLogin" class="btn">Login</button>
                                   </form>
                               </div>
                           </li>
                           <li class="dropdown">
                               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                   <img class="img-avatar" width="32px" height="32px"src="<?= $user->get_profile_picture_url() ?>" style="margin: -10px 0px;"/>
                                   <?= $user->family_name ?> <span class="caret"></span>
                               </a>
                               <ul class="dropdown-menu">  
                                   <li><?= $this->tag->linkTo("dashboard", "Dashboard") ?></li>
                                   <li role="separator" class="divider"></li>
                                   <li><?= $this->tag->linkTo("profile", "Profile") ?></li>
                                   <li><?= $this->tag->linkTo("user/profile", "Settings") ?></li>
                                   <li role="separator" class="divider"></li>
                                   <li><?= $this->tag->linkTo("user/signout", "Sign Out") ?></li>
                               </ul>
                           </li>
                        <?php endif; ?>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <?php echo $this->getContent() ?>
        <div class="footer text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-offset-2 col-lg-8">
                        <span class="col-lg-3"><a href="#">About us</a></span>
                        <span class="col-lg-3"><a href="#">Privacy Policy</a></span>
                        <span class="col-lg-3"><a href="#">Terms & Conditions</a></span>
                        <span class="col-lg-3"><a href="#">Fees & Charges</a></span>
                    </div>
                </div>
                <br>
                <div class="btn-group dropup hidden">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Language <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Auto</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">English</a></li>
                        <li><a href="#">Japanese</a></li>
                        <li><a href="#">Vietnamese</a></li>
                    </ul>
                </div>
                <p>© INNOVI 2014</p>
            </div>
        </div>
    </body>
</html>

<?php if (!is_signed_in()) { ?>
   {{ partial('dialogs/login') }}
<?php } ?>
{{ assets.outputJs('footer') }}
<script>
<?php global $languages ?>
   initLocationInput();
   initLanguageInput("<?=get_url("ajax/languages")?>");
</script>