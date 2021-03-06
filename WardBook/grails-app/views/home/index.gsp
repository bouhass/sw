<%@ page import="com.wardbook.TeamList; com.wardbook.Ward" %>
<g:applyLayout name="bootstrap-navbar">

    <div class="col-xs-10 col-sm-6 col-md-4 col-xs-offset-1 col-sm-offset-3 col-md-offset-4 box-middle">
        <div class="row">
            <h4>Select a ward</h4>
        </div>
        <div class="row">
            <div class="form-group">
                <select onchange="switchWard($(this).find('option:selected').attr('value'))" class="form-control">
                    <option value="">All wards</option>
                    <g:each in="${Ward.list()}" var="ward">
                        <option value="${ward.id}" ${ward.id == request.user.ward?.id ? 'selected' : ''}>${ward}</option>
                    </g:each>
                </select>
            </div>
        </div>

        <div class="row">
            <h4>Or select a list</h4>
        </div>
        <div class="row">
            <div class="form-group">
                <select onchange="switchList($(this).find('option:selected').attr('value'))" class="form-control">
                    <option value="">All lists</option>
                    <g:each in="${TeamList.list()}" var="teamList">
                        <option value="${teamList.id}" ${teamList.id == request.user.teamList?.id ? 'selected' : ''}>${teamList}</option>
                    </g:each>
                </select>
            </div>
        </div>

        <div class="row pull-right">
            <g:link controller="patient" class="btn btn-primary">View patients ></g:link>
        </div>
    </div>

</g:applyLayout>