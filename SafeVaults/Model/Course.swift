//
//  Course.swift
//  SafeVaults
//
//  Created by Ramiro Gonzalez on 10/10/2020.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var color: Color
}


var courses = [
    Course(
        title: "Curso 1",
        subtitle: "Este es el subtitulo",
        image: "Illustration 1",
        color: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    ),
    Course(
        title: "Curso 1",
        subtitle: "Este es el subtitulo",
        image: "Illustration 1",
        color: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    ),
]
