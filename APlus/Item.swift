//
//  Item.swift
//  APlus
//
//  Created by 范小兵 on 2024/9/27.
//

import Foundation
import SwiftData

@Model
final class Item {
    var id: UUID
    var timestamp: Date
    /// 年级
    var grade: Int
    /// 学期
    var semester: Int
    /// 成绩
    var score: Double
    /// 课程
    var course: String
    /// 教师
    var teacher: String

    init(timestamp: Date, grade: Int, semester: Int, score: Double, course: String, teacher: String) {
        self.id = UUID()
        self.timestamp = timestamp
        self.grade = grade
        self.semester = semester
        self.score = score
        self.course = course
        self.teacher = teacher
    }
}
