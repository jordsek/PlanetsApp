//
//  CoreDataError.swift
//  PlanetsApp
//
//  Created by Jor . on 19/04/2023.
//

import Foundation
enum CoreDataError:Error{
    case savingError
    case gettingError
}
extension CoreDataError: LocalizedError{
    
    var errorDescription :String?{
        switch self{
        case .savingError:
            return NSLocalizedString("Error while saving into DB", comment: "Save error")
        case .gettingError:
            return NSLocalizedString("Error while getting data into DB", comment: "get error")
        }
    }
}

