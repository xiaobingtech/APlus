//
//  Person.swift
//  APlus
//
//  Created by 范小兵 on 2024/9/27.
//

import Foundation
import SwiftData

@Model
final class Person {
    var id: UUID
    var timestamp: Date
    var avatar: String
    var name: String
    var age: Int

    init(timestamp: Date, avatar: String, name: String, age: Int) {
        self.id = UUID()
        self.timestamp = timestamp
        self.avatar = avatar
        self.name = name
        self.age = age
    }
}
