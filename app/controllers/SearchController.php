<?php

class SearchController extends ControllerBase {

   public function indexAction() {
      
   }

   public function interpreterAction() {
      
   }

   public function jobAction() {
      
   }

   public function ajax_search_job_resultsAction() {
      $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
      $builder = $this->modelsManager->createBuilder();
      $builder->from("Jobs");

      $langs = explode(',', $this->request->getPost('language'));
      foreach ($langs as $lang) {
         $lang_code = Languages::get_language_code($lang);
         if ($lang_code) $builder->andWhere("lang LIKE '%$lang_code%'", 
                 array('lc' => $lang_code));
      }
      
      $loc = explode(',', $this->request->getPost('loc'));
      $loc = $loc[0];
      if (!empty($loc))
         $builder->andWhere("INSTR(LOWER(location), :loc:) > 0", 
              array('loc' => $loc));
      
      $this->view->jobs = $builder->getQuery()->execute();
   }
   
   public function ajax_search_interpreter_resultsAction() {
      $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
      $builder = $this->modelsManager->createBuilder();
      $builder->from("Interpreters");

      switch ($this->request->getPost('age')) {
         case "18-30":
            $builder->betweenWhere("YEAR(CURDATE()) - YEAR(dob) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(dob, '%m%d'))", 18, 30);
            break;
         case "over30":
            $builder->andWhere("YEAR(CURDATE()) - YEAR(dob) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(dob, '%m%d')) > 30");
            break;
      }

      if ($this->request->getPost('gender') != "both") {
         $builder->andWhere("gender = :gender:", array('gender' => $this->request->getPost('gender')));
      }

      $langs = explode(',', $this->request->getPost('language'));
      foreach ($langs as $lang) {
         $lang_code = Languages::get_language_code($lang);
         if ($lang_code) $builder->andWhere("EXISTS (SELECT * FROM LanguageProfiles WHERE lang = :lc: AND interpreter_id = Interpreters.account_id)", 
                 array('lc' => $lang_code));
      }

      if ($this->request->getPost('name'))
         $builder->andWhere("INSTR(LOWER(CONCAT(first_name, ' ', family_name)), :name:) > 0", array('name' => $this->request->getPost('name')));
      
      $loc = explode(',', $this->request->getPost('loc'));
      $loc = $loc[0];
      
      if (!empty($loc))
         $builder->andWhere("INSTR(LOWER(CONCAT(city, ' ', country)), :loc:) > 0", 
              array('loc' => $loc));

      $this->view->interpreters = $builder->getQuery()->execute();

      //$this->view->disable();
      //echo $builder->getPhql();
   }

}
