//
//  Alert.swift
//  BarCodeScanner
//
//  Created by Ali Tamoor on 11/01/2024.
//

import Foundation
import SwiftUI

struct AlertItem {
    var title: String
    var message: String
    var action: ButtonRole?
}

struct AlertContext {
    
    // MARK: - Network Alerts
    static var invalidData = AlertItem(title: "Server Error",
                                      message: "Data Received from server is not in valid Format.\n Contact Support for more info.")
    
    static var invalidResponse = AlertItem(title: "Server Error",
                                           message: "Invalid response from server. Please try again later or contact support.")
    
    static var invalidURL = AlertItem(title: "Server Error", message: "Issue Connecting with Server. Please try again.")
    
    static var unableToComplete = AlertItem(title: "Server Error",
                                            message: "Unable to complete your request at the time. Please check your network connection.")
    
    
    // MARK: - Account View Alerts
    static var invalidDetails = AlertItem(title: "Invalid Details", message: "Please make sure all the fields are filled")
    static var invalidEmail = AlertItem(title: "Invalid Email", message: "Please enter a valid email")
}
