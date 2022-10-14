//
//  ViewControllerCoreData.swift
//  SeguraeApp
//
//  Created by Vinicius on 18/09/22.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    
    var context: NSManagedObjectContext {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
