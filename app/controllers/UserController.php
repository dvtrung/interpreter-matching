<?php
use Phalcon\Mvc\Url;

class UserController extends ControllerBase
{
    public function initialize() {
        
    }

    public function indexAction($id)
    {
    }
    
    public function loginAction() {
        
    }

    private function _registerSession($account)
    {
        $this->session->set('account_id', $account->id);
    }

    /**
     * This action authenticate and logs a user into the application
     *
     */
    public function startAction()
    {
        if ($this->request->isPost()) {

            $email      = $this->request->getPost('email');
            $password   = $this->request->getPost('password');

            $account = Accounts::findFirst(array(
                "(email = :email: AND password = :password:)",
                'bind' => array('email' => $email, 'password' => sha1($password))
            ));
            
            if ($account != false) {
                $this->_registerSession($account);
                //$this->flash->success('Welcome ' . $account->name);
                
                return $this->response->redirect('index');
            }

            $this->flash->error('Wrong email/password');
        }
        return $this->response->redirect('index');
    }
    
    public function signoutAction() {
        $this->session->remove("account_id");
        return $this->response->redirect('index');
    }
    
    public function editAction() {
        if ($this->view->type == "customer") {
            return $this->response->redirect('user/cedit');
        } else {
            return $this->response->redirect('user/tedit');
        }   
    }
    
    public function searchAction() {
        $this->view->translators = Translator::find(array("limit" => 5));
    }
}

