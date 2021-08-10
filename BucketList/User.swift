//
//  User.swift
//  BucketList
//
//  Created by Antonio Vega on 8/10/21.
//

import Foundation

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}
