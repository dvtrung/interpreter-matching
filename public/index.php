
<?php

error_reporting(E_ALL | E_STRICT);
ini_set('display_errors', 1);
define('APP_PATH', realpath('..'));

try {

   /**
    * Read the configuration
    */
   $config = include APP_PATH . "/app/config/config.php";

   /**
    * Read auto-loader
    */
   include APP_PATH . "/app/config/loader.php";

   /**
    * Read services
    */
   include APP_PATH . "/app/config/services.php";

   foreach (glob(APP_PATH . "/app/includes/*.php") as $filename) include $filename;

   global $user;
   if ($di->get("session")->get("account_id")) {
      $user = Users::load_by_id($di->get("session")->get("account_id"));
   } else if ($di->get("session")->get("new_account_id")) {
      $user = Users::load_by_id($di->get("session")->get("new_account_id"));
   } else {
      $user = new stdClass();
      $user->account_id = 0;
   }


   $di->set('assets', function () {
      return new Phalcon\Assets\Manager();
   }, true);

   // Assets
   $di['assets']
           ->addJs('https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js', false)
           ->addJs('http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js', false)
           ->addJs("http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false", false)
           ->addCss('css/bootstrap-nav-wizard.css')
           ->addCss('http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css', false)
           ->addCss('css/custom.css')
           ->addCss('http://fonts.googleapis.com/css?family=Open+Sans', false)
           ->addCss('https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css')
   ;

   $di['assets']->collection("footer")->addJs("js/autocomplete.js")
   ;

   /**
    * Handle the request
    */
   $application = new \Phalcon\Mvc\Application($di);

   echo $application->handle()->getContent();

   \Phalcon\Mvc\Model::setup(array(
           'notNullValidations' => false
   ));
} catch (\Exception $e) {
   echo $e->getMessage();
}