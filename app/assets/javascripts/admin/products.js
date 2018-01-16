$(document).ready(function() {
    $('#products').DataTable({
        responsive: true,
        order: [[ 0, "desc" ]]
    });
});