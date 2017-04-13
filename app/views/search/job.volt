<?php use_plugin_tokenfield_typeahead() ?>
<div class="container">
    <div class="col-lg-3">
        <h3 class="text-center">Search Filters</h3>
        <form class="form-horizontal" id="frm-search">
            <div class="form-group">
                <label for="name" class="control-label">Title</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="" autocomplete="on" value="<?= $this->request->getQuery("name") ?>">  
            </div>
            <div class="form-group">
                <label for="location" class="control-label">Location</label>
                <input type="text" class="form-control autocomplete-location" id="location" name="loc" autocomplete="on" value="<?=$this->request->getQuery('loc')?>" placeholder="">    
            </div>
            <div class="form-group">
                <label for="language" class="control-label">Language</label>
                <input type="text" class="form-control language-typeahead-tokenfield" id="language" name="language" value="<?= $this->request->getQuery("language") ?>">
            </div>
            <div class="form-group text-center">
                <a href="#" id="btn-search" class="btn btn-primary load-result"><i class="fa fa-search"></i> Search</a>
            </div>
        </form>
    </div>
    <div class="col-lg-9" id="results">

    </div>
</div>

<script>
  function loadResult() {
      $("#results").html("");
      $("#results").html('<div class="refresh-container"><i class="fa fa-spinner fa-spin fa-5x fa-fw"></i></div>');
      $.post("<?= get_url("search/ajax_search_job_results") ?>", $("#frm-search").serialize(), function (data) {
          $("#results").html(data);
      });
  }
  loadResult();
  $("#btn-search").click(loadResult);
  $("input[type='text']").change(loadResult);
  $("#location").keypress(function (e) {
     if (e.keyCode == 13) loadResult();
  })

</script>