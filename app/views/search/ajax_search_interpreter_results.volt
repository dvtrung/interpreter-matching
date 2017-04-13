<?php
if (count($interpreters) == 0) {
   echo "<h2>No profile matches your search</h2>";
} else if (count($interpreters) == 1) {
   echo "<h2>1 profile matches your search</h2>";
} else {
   echo "<h2>" . count($interpreters) . " profiles match your search</h2>";
}
?>
<?php
Users::render_big_item_list($interpreters);
?>