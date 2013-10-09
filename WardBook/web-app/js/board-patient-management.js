$(window).load(function() {
    $('#search').keyup(patientTableSearch);

    $('.patient-location').each(function() {
        updateBeanField(this, this, 'patient', $(this).attr('data-id'), 'location', 'text', $(this).attr('data-value'), '')
    });

    $('.patient-consultant').each(function() {
        updateBeanField(this, this, 'patient', $(this).attr('data-id'), 'consultant', 'select', $(this).attr('data-value'), WEB_APP_ROOT+'helpers/consultants')
    });

    $('.patient-status').each(function() {
        updateBeanField(this, this, 'patient', $(this).attr('data-id'), 'status', 'select', $(this).attr('data-value'), WEB_APP_ROOT+'patient/statuses')
    });

    $('.patient-handover').live('click', function() {
        $.post(WEB_APP_ROOT+'patient/partialUpdate', {
            'id': $(this).attr('data-id'),
            'handover': $(this).is(':checked')
        })
            .done(function(patient) {
                // remove loading image
                console.log('done updating the patient : '+patient.handover)
            })
            .fail(function() {
                alert("ERROR: could not update the patient status");
            })
    });
});
