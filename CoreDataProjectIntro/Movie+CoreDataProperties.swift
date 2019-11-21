//
//  Movie+CoreDataProperties.swift
//  CoreDataProjectIntro
//
//  Created by Luc Derosne on 21/11/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {


    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }
    // on ne veut pas d'option
    @NSManaged public var year: Int16
    @NSManaged public var director: String
    @NSManaged public var title: String? // on remet ? et on ajoute wrappedTitle
    
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }

//    @NSManaged public var year: Int16
//    @NSManaged public var director: String?
//    @NSManaged public var title: String?

}
