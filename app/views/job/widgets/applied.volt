
    <div class="widget-heading">People Who Applied</div>
    <div class="widget-body"><?php
        $interpreters = array();
        foreach ($applications as $application) {
           $interpreters[] = Users::load_by_id($application->interpreter_id);
        }
        Users::render_small_item_list($interpreters, 12);
        ?>
    </div>
