<g:applyLayout name="bootstrap-mobile">

    <div class="list-group">
        <g:each in="${com.wardbook.Patient.list()}" var="patient">
            <a href="#" class="list-group-item">
                ${patient}
                <div class="pull-right">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
            </a>
        </g:each>
    </div>

    <script>
        $(window).load(function() {
            $('[data-toggle=offcanvas-left]').click();
        });
    </script>

</g:applyLayout>