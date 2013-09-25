package com.wardbook

class Ward {

    String name
    String speciality
    static hasMany = [patients: Patient]

    static constraints = {
    }

    String toString() { "${name} - ${speciality}" }
}