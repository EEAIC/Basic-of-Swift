//: Playground - noun: a place where people can play

import UIKit

struct Task {
    var title:String
    var time:Int?
}

var callTask = Task(title: "Call to Randy", time: 10 * 60)
var reportTask = Task(title: "Report to Boss", time: nil)
var todayTask:[Task] = []

todayTask += [callTask, reportTask]
todayTask[1].time = 15 * 60
callTask.title = "Call to Toby"
print("today task = \(todayTask), callTask =\(callTask)")
