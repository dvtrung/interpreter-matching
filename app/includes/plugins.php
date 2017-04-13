<?php

function use_plugin_datepicker() {
   getDI()['assets']
           ->addJs("/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js")
           ->addCss("/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css")
   ;
}

function use_plugin_tokenfield_typeahead() {
   getDI()['assets']
           ->addJs('/plugins/typeahead/typeahead.bundle.js', false)
           ->addJs("/plugins/bootstrap-tokenfield/bootstrap-tokenfield.js")
           ->addCss("/plugins/bootstrap-tokenfield/css/tokenfield-typeahead.css")
           ->addCss("/plugins/bootstrap-tokenfield/css/bootstrap-tokenfield.css")
   ;
}

function use_plugin_daterangepicker() {
   getDI()['assets']
           ->addJs("//cdn.jsdelivr.net/momentjs/latest/moment.min.js")
           ->addJs("/plugins/bootstrap-daterangepicker/daterangepicker.js")
           ->addCss("/plugins/bootstrap-daterangepicker/daterangepicker.css")
   ;
}
