<%@ page import="com.wardbook.User" %>
<table id="task-${category}-${patient.id}" class="inner-table">
    <tr>
        <td>
            <span class="glyphicon glyphicon-plus mbm-icon-blue"></span>
        </td>
        <td>
            <input type="text" placeholder="Type to add" data-patient_id="${patient.id}" data-category="${category}" class="add-task-input mbm-input-blue" />
        </td>
        <td></td>
        <td></td>
    </tr>
    <g:each var="task" in="${patient.tasks}">
        <g:if test="${task.category == category}">
            <tr>
                <td class="delete-task">
                    <button type="button" class="btn btn-danger btn-xs hidden">
                        <span class="glyphicon glyphicon-remove"></span>
                    </button>
                </td>
                <td>
                    <div data-type="task"
                         data-task-id="${task.id}"
                         data-name="${task.name}"
                         data-status="${task.status}"
                         data-priority="${task.priority}"
                         data-category="${task.category}"
                         data-assignee="${task.assignee}"
                         data-time-due="${task.timeDue ?: ''}"
                         data-pid="${patient.id}"
                         data-popover-placement="${popoverPlacement}"
                         class="editable editable-click task">
                        ${task.name}
                        &nbsp;
                        <g:if test="${task.comments.size > 0}">
                            <span class="glyphicon glyphicon-comment task-comment-notification">
                                <p class="task-comment-number">${task.comments.size}</p>
                            </span>
                        </g:if>
                    </div>
                </td>
                <td class="edit-task">
                    <a data-toggle="modal" href="${createLink(controller: 'task', action: 'partialEdit', id: task.id)}" data-target="#task-edit-modal" class="btn btn-warning btn-xs" style="position: relative; left: 45%;">
                        <span class="glyphicon glyphicon-edit"></span>
                    </a>
                </td>
                <td class="update-task-status">
                    <img/>
                </td>
            </tr>
        </g:if>
    </g:each>
</table>