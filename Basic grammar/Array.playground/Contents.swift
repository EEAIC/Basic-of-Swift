//: Playground - noun: a place where people can play

import UIKit

var meetingRooms:Array<String> = ["Bansky", "Rivera", "Kahlo", "Picasso", "Cezanne", "Mastisse"]

var groups:[Int] = [10, 8, 14, 9]

meetingRooms += ["Renoir"]

let maxSpeed:Int = 200

var currentSpeed:Int = 110
currentSpeed += 10

var speedHistory:[Int] = []
speedHistory += [currentSpeed]
let gpsSpeed0901 = 114.1
speedHistory.append(Int(gpsSpeed0901))

speedHistory.last

let historyBackup = speedHistory
speedHistory += [150]
historyBackup

