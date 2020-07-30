//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Rohit sahu on 24/07/20.

 struct K {
     static let appName = "⚡️Let's Chat"
     static let cellIdentifier = "ReusableCell"
     static let cellNibName = "MessageCell"
     static let registerSegue = "RegisterToChat"
     static let loginSegue = "LoginToChat"
    
     
     struct BrandColors {
         static let purple = "BrandPurple"
         static let lightPurple = "BrandLightPurple"
         static let blue = "BrandBlue"
         static let lighBlue = "BrandLightBlue"
     }
     
     struct FStore {
         static let collectionName = "messages"
         static let senderField = "sender"
         static let bodyField = "body"
         static let dateField = "date"
     }
 }
