//: Playground - noun: a place where people can play

import UIKit

let time1 = (9, 0, 48)
let time2:(h:Int, m:Int, s:Int) = (11, 51, 5)

let duration = (time1, time2)

let (start, end) = duration
let endHour = end.h

typealias Time = (h:Int, m:Int, s:Int)
typealias Duration = (start:Time, end:Time)

let today:Duration = ((9,10,23), (17, 8,21))
print("We studied until \(today.end.h) today")
