package com.wardbook

import grails.test.mixin.TestFor
import spock.lang.Specification

@TestFor(TeamListController)
class TeamListControllerSpec extends Specification {

    void "test index"() {
        when:
        controller.index()

        then:
        view == '/teamList/index'
    }
}
