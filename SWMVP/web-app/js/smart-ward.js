
function taskStatusToImage(status) {
    if      (status == 'STARTED')    return WEB_APP_ROOT+'images/half-square.png';
    else if (status == 'COMPLETED')  return WEB_APP_ROOT+'images/full-square.png';
    else /* (status == 'PENDING') */ return WEB_APP_ROOT+'images/empty-square.png';
}

function addTask(name, patient_id, category) {

    $.post(WEB_APP_ROOT+'task/saveOrUpdate', {
        'name': name,
        'category': category,
        'patient.id': patient_id
    })
        .done(function(task) {
            var id = new Date().getTime();
            $('#task-'+category+'-'+patient_id).append('<tr><td id="'+id+'" data-type="task" data-tid="'+task.id+'" class="editable editable-click"></td></tr>');
            $('#'+id).editable({
                type: 'text',
                pk: patient_id,
                url: WEB_APP_ROOT+'task/saveOrUpdate',
                value: {
                    name: name
                },
                params: function(params) {
                    return {
                        'id': $(this).attr('data-tid'),
                        'name': params.value.name,
                        'status': params.value.status,
                        'priority': params.value.priority,
                        'comment': params.value.comment,
                        'category': category,
                        'patient.id': patient_id
                    }
                },
                success: function(task, newValue) {
                    $(this).attr('data-tid', task.id);
                }
            });
        })
        .fail(function() {
            alert("ERROR: could not add the task");
        })
}
