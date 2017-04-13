<?php
echo '<hr>';
if (isset($accepted_interpreter_only)) {
   $applications = $job::getApplications(array("conditions" => "status = ?1", "bind" => array(1 => Applications::APP_ACCEPTED)));
   if (count($applications) == 1) {
      Messages::render_messages($applications[0]);
   }
} else {
   if (count($applications) == 0) {
      ?>
      <h3>No people applied.</h3>
      Get start by <a href="<?= get_url("search/interpreter") ?>"><i class="fa fa-search"></i> Search For An Interpreter</a>
   <?php
   } else echo "<h3>" . count($applications) . " people applied</h3>";
   foreach ($applications as $application) {
      Messages::render_messages($application);
   }
}