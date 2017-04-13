function initialize() {
    var options = {
        types: ['(cities)'],
    };

    $(".autocomplete-location").each(function () {
        var autocomplete = new google.maps.places.Autocomplete(this, options);
    })
}

function initLanguageInput(ajax) {
    $.getJSON(ajax, function (data) {
        var items = [];
        $.each(data, function (key, val) {
            items.push(val);
        });
        var langs = new Bloodhound({
            datumTokenizer: function (d) {
                return Bloodhound.tokenizers.whitespace(d.value);
            },
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            local: items
        });

        langs.initialize();

        $("input.language-typeahead-tokenfield").tokenfield({
            typeahead: [null, {source: langs.ttAdapter()}],
            showAutocompleteOnFocus: true
        });
        $("input.language-typeahead").typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        });
    });
}

function initLocationInput() {
    google.maps.event.addDomListener(window, 'load', initialize);
}