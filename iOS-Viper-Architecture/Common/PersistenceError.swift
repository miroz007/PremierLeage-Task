//
//  PersistenceError.swift
//  iOS-Viper-Architecture
//
//  Created by Amir Samir on 23/06/21.
//
//

import Foundation

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
