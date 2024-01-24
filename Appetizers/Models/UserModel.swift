//
//  UserModel.swift
//  Appetizers
//
//  Created by Ali Tamoor on 24/01/2024.
//

import Foundation

struct UserModel: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var date = Date()
    var extraNapkins = false
    var frequestRefills = false
    var isAlertShowing = false
}
