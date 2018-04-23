$(document).ready(function() {
    var body = $('body');

    $('#products').DataTable({
        responsive: true,
        order: [[ 0, "desc" ]]
    });

    body.on('change', '#product_prototype_id', function () {
        var select_id = $(this).val();
        var property_ids = [];
        $.ajax({
            url: window.location.origin + '/admin/prototypes/' + select_id + '/get_property_names',
            dataType: 'json',
            success: function (data) {
                console.log('get_property_names', data);
                property_ids = data

                $.each(property_ids, function (index, value) {
                    console.log(value)
                    $('.add_fields').click();
                    $('select[name*=product]').last().val(value);
                })
            },
            error: function (xhr, status, err) {
                console.error(err);
            }
        });

    });

    $('.select2').select2();

    var editor = new Simditor({
        textarea: $('#editor')
        //optional options
    });

});