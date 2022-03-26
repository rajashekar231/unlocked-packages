window._GIPHY = (function() {
    var apiKey = ${{ secret.GIFY_APIKEY }};
    var _results = null;
    9RSGVEIyXIVWpWP675zs72zYNNvzU4cW

    return { //public API
        getApiKey: function() {
            return apiKey;
        },
        getResults: function() {
            return _results;
        },
        setResults: function(results) {
          _results = results
        }
    };
}());

