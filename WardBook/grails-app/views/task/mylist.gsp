<%@ page import="com.wardbook.User; com.wardbook.Patient; com.wardbook.Ward" %>
<g:applyLayout name="bootstrap">

    <div>

        <div class="col-md-7">
            <g:if test="${flash.message}">
                <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
            </g:if>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Location</th>
                        <th>Patient</th>
                        <th>Task</th>
                        <th>Time due</th>
                        <th>Comments</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <g:each in="${tasks}" var="task">
                    <tr onclick="showTaskSummary(this, ${task.id})">
                        <td>${task.patient.location}</td>
                        <td>${task.patient}</td>
                        <td>${task.name}</td>
                        <td><g:formatDate format="dd-MM-yyyy HH:mm" date="${task.timeDue}"/></td>
                        <td>${task.comments.size}</td>
                        <td class="task-status" data-status="${task.status}"><img /></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="col-md-5" style="height: 100%">
            <iframe src="" style="
            border: 0px;
            width: 100%;
            height: 100%;
            max-height: 100%;
            ">
            </iframe>
        </div>

    </div>

    <script>
        function showTaskSummary(element, taskId) {
            $('iframe').attr('src', WEB_APP_ROOT+'task/summary/'+taskId);
            $('tr').removeClass('selected-row');
            $(element).addClass('selected-row')
        }

        $(window).load(function() {
            $('.task-status').each(function() {
                $(this).children('img').attr('src', taskStatusToImage($(this).attr('data-status')));
            });
        });
    </script>

</g:applyLayout>
