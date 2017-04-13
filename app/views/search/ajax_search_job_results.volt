<?php
if (count($jobs) == 0) {
   echo "<h2>No job matches your search</h2>";
} else if (count($jobs) == 1) {
   echo "<h2>1 job matches your search</h2>";
} else {
   echo "<h2>" . count($jobs) . " profiles match your search</h2>";
}
?>
<?php
Jobs::render_list($jobs);
?>