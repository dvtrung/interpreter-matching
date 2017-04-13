<?php

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Regex as RegexValidator;

class SignupController extends ControllerBase {

   public function indexAction() {
      $this->assets->addCss("css/social-buttons.css")
              ->addJs("js/facebook.js")
      ;
      if ($this->request->isPost()) {
         $validator = new Validation();
         //$validator->add('email', new PresenceOf(['field' => "email", 'message' => 'Email is required']));
         $validator->add('email', new Email(['field' => 'email', 'message' => 'Email is not valid']));
         $validator->add('first_name', new PresenceOf(['field' => 'name', 'message' => 'First name is required']));
         $validator->add('family_name', new PresenceOf(['field' => 'name', 'message' => 'Family name is required']));
         $validator->add('password', new Confirmation(array(
                 'message' => 'Password doesn\'t match',
                 'with' => 'confirmPassword'
         )));
         $validator->add('password', new RegexValidator(array(
                 'pattern' => '/.{4,20}/',
                 'message' => 'Password is between 6 - 20 characters'
         )));
         $validator->add('type', new PresenceOf(['field' => 'type', 'message' => 'Account type is required']));

         $validator->validate($_POST);
         $messages = $validator->getMessages();
         if (count($messages)) {
            $this->view->messages = $messages;
         } else {
            if ($this->request->get('type') == 'interpreter') {
               $user = new Interpreters();
            } else if ($this->request->get('type') == 'customer') {
               $user = new Customers();
            } else {
               return;
            }

            $account = new Accounts();
            $account->email = $this->request->get('email', 'email');
            $account->password = sha1($this->request->get('password'));
            $account->type = $this->request->get('type');
            $account->confirmed = 0;
            $account->active = 1;
            $account->user_id = 0;
            $account->create();
            
            $user->account_id = $account->id;
            $user->create($this->request->getPost(), array("first_name", "family_name"));

            $account->user_id = $user->id;
            $user->save(); $account->save();

            echo $this->request->get('type');
         }
      }
   }

   public function userinfo_translatorAction() {
      
   }

   public function userinfo_customerAction() {
      
   }

   public function send_confirm_emailAction() {
      $account = new Account();
      $account->user_id = 0;
      $account->password = "";
      $account->active = 0;
      $account->confirmed = 0;
      $success = $account->create($this->request->getPost(), array('email', 'type'));
      $id = $account->id;

      $key = $account->email . date('mY');
      $key = md5($key);

      $account_confirm = new AccountConfirm();
      $account_confirm->skey = $key;
      $account_confirm->email = $account->email;
      $account_confirm->userid = $id;

      $success = $account_confirm->create();

      if ($success) {
         echo "Thanks for registering! [This will be sent by email]";
         echo "<a href='http://ts.hinona.com/signup/confirm_email/$key'>Click here to confirm your email</a>";
      } else {
         echo "Sorry, the following problems were generated: ";
         foreach ($account_confirm->getMessages() as $message) {
            echo $message->getMessage(), "<br/>";
         }
      }
      $this->view->disable();
   }

   function confirm_emailAction($key) {
      $account_confirm = AccountConfirm::findFirst(array(
                      "conditions" => "skey = ?1",
                      "bind" => array(1 => $key)));
      $account = load_account($account_confirm->userid);
      $account->confirmed = 1;

      if ($account->type == "translator") {
         $translator = Translator::findFirst("account_id = $account->id");
         if (!$translator) {
            $translator = new Translator();
            $translator->account_id = $account->id;
            $translator->create();
            $account->user_id = $translator->id;
         }
         $this->session->set('new_account_id', $account->id);
      } else {
         $customer = new Customer();
         $customer->account_id = $account->id;
         $customer->create();
      }
      $account->update();
      $account_confirm->delete();
      return $this->response->redirect("signup/userinfo");
   }

   function send_confirmation_email($info) {

      //format each email
      $body = format_email($info, 'html');
      $body_plain_txt = format_email($info, 'txt');

      //setup the mailer
      $transport = Swift_MailTransport::newInstance();
      $mailer = Swift_Mailer::newInstance($transport);
      $message = Swift_Message::newInstance();
      $message->setSubject('Welcome to Site Name');
      $message->setFrom(array('noreply@sitename.com' => 'Site Name'));
      $message->setTo(array($info['email'] => $info['username']));

      $message->setBody($body_plain_txt);
      $message->addPart($body, 'text/html');

      $result = $mailer->send($message);

      return $result;
   }

   public function userinfoAction() {
      $id = $this->session->get("new_account_id");
      $account = load_account($id);
      if (!$id) return 0;
      if ($account->type == "translator") {
         $translator = load_user_from_account($account);
         global $user;
         $user = $translator;
         $this->view->form = new TranslatorForm($translator);
         $this->view->pick('signup/t_userinfo');
         //$this->view->disable();
      } else if ($acount->type == "customer") {
         $this->view->pick('dashboard/c_userinfo');
      }
   }

}
