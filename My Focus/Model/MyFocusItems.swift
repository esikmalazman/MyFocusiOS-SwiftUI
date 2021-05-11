//
//  MyFocusItems.swift
//  My Focus
//
//  Created by Ikmal Azman on 11/05/2021.
//

import Foundation

//Identifiable, allow to identify each object created uniquely
struct MyFocusItem: Identifiable
{
    let id = UUID()
    let list : String
//    var image : String 
}

// Class that store collection/array of MyFocusItem
// ObservableObject, allow class/model to keep track of the state
class MyFocus: ObservableObject
{
    //@Published, allow to identify any changes to this data
    @Published var items = [MyFocusItem]()

}
