// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
// require jquery
// require jquery_ujs
// require bootstrap-sprockets
// require_tree .

$(document).ready(function () {

    $('.btn-form-submit').each(function () {
        $(this).data('save-text', '保存中...');
        $(this).click(function () {
            $(this).button('save');
            $(this).attr("disabled", true);
            this.form.submit();
        })
    });

    $('.datetimepicker').each(function () {
        $(this).datetimepicker({
            pickTime: true,
            useStrict: true
        }).bind('keydown', function (e) {
            if (e.keyCode == 9) {
                return true;
            } else {
                return false;
            }
        });
    });

    $(".clickAll").click(function () {
        if ($(".clickAll").prop("checked")) {
            $("input[name='ids[]']").each(function () {
                $(this).prop("checked", true);
            });
        }
        else {
            $("input[name='ids[]']").each(function () {
                $(this).prop("checked", false);
            });
        }
    });

    $('.typeahead-input').typeahead({
        minLength: 3,
        items: 10,
        autoSelect: false,
        delay: 250,
        source: function (query, process) {
            if (query.split(',')[query.split(',').length - 1].length > 2) {
                return $.get('/selects/user?q=' + query, function (data) {
                    return process(data);
                });
            }
        },
        updater: function (item) {
            return this.$element.val().replace(/[^,]*$/, '') + item + ',';
        },
        matcher: function (item) {
            var tquery = extractor(this.query);
            if (!tquery) return false;
            return ~item.toLowerCase().indexOf(tquery.toLowerCase())
        },
        highlighter: function (item) {
            var query = extractor(this.query).replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
            return item.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                return '<strong>' + match + '</strong>'
            })
        }
    });

    $('.typeahead-input').keydown(function (evt) {
        var keycode = evt.which;
        if (keycode == 188) { //Enter key's keycode
            return false;
        }
    });

})
