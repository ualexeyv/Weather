//
//  SessionSingletone.swift
//  weather
//
//  Created by пользовтель on 02.02.2021.
//

import Foundation

struct SessionSingletone {
    static let shared = SessionSingletone()
    var token: String = ""
    var userId: Int = 0
    private init () {}
}

