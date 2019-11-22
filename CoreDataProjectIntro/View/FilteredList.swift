//
//  FilteredList.swift
//  CoreDataProjectIntro
//
//  Created by Luc Derosne on 21/11/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

import SwiftUI
import CoreData

enum Predicate: String {
    case beginsWith =  "BEGINSWITH"
    
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(predicate: Predicate, filterKey: String, filterValue: String, sortKey: String, sortAsc: Bool, @ViewBuilder content: @escaping (T) -> Content) {
    fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [
    NSSortDescriptor(key: sortKey, ascending: sortAsc)
    ], predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
    self.content = content
    }
}

//struct FilteredList<T: NSManagedObject, Content: View>: View {
//    var fetchRequest: FetchRequest<T>
//    var singers: FetchedResults<T> { fetchRequest.wrappedValue }
//
//    // this is our content closure; we'll call this once for each item in the list
//    let content: (T) -> Content
//
//    var body: some View {
//        List(fetchRequest.wrappedValue, id: \.self) { singer in
//            self.content(singer)
//        }
//    }
//
//    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
//        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
//        self.content = content
//    }
//}
//struct FilteredList: View {
//    var fetchRequest: FetchRequest<Singer>
//    init(filter: String) {
//        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//    }
//    var body: some View {
//        List(fetchRequest.wrappedValue, id: \.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
//    }
//
//}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
