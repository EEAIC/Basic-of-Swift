//: Playground - noun: a pl//: Playground - noun: a place where people can play

import UIKit

struct Task {
    var title:String
    var time:Int?
    
    var owner:Employee
    var participant:Employee?
    
    var type:TaskType
    
    enum TaskType {
        case Call
        case Report
        case Meet
        case Support
        
        var typeTitle:String {
            get {
                let titleString:String
                switch self{
                case .Call:
                    titleString = "Call"
                case .Report:
                    titleString = "Report"
                case .Meet:
                    titleString = "Meet"
                case .Support:
                    titleString = "Support"
                }
                return titleString
            }
        }
    }
    
    init (type:TaskType, owner:Employee){
        self.type = type
        self.title = type.typeTitle
        self.owner = owner
        self.time = nil
        self.participant = nil
    }
}

class Employee {
    var name:String?
    var phoneNumber:String?
    var boss:Employee?
    
    init (name:String){
        self.name = name
    }
    convenience init (name:String, phone:String){
        self.init(name:name)
        self.phoneNumber = phone
    }
    
    func report(){
        if let myBoss = boss{
            print("\(String(describing: self.name)) reported to \(String(describing: myBoss.name))")
        } else {
            print("\(String(describing: name)) dont't have boss")
        }
    }
    func callTasktoBoss() -> Task? {
        if let myBoss = boss, let _ = myBoss.phoneNumber{
            let callTask = Task(type: .Call, owner: self)
            return callTask
        }
        return nil
    }
}
    

var todayTask:[Task] = []

let me:Employee = Employee(name:"Alex", phone: "010-1234-5678")
//me.name = "Alex"
//me.phoneNumber = "010-1234-5678"


let toby = Employee(name:"Toby")
toby.name = "Toby"
toby.phoneNumber = "011-5678-1234"

me.boss = toby
me.report()
var reportTask = Task(type: .Report, owner: me)
todayTask += [reportTask]
if let callTask = me.callTasktoBoss(){
    todayTask += [callTask]
}
print("\(toby.phoneNumber!)")

//var callTask = Task(title: "Call to Toby", time: 10 * 60, owner: me, participant: toby, type:.Call)
var callTask = Task(type: .Call, owner: me)
//callTask.time = 10*60
//var reportTask = Task(title: "Report to Boss", time: nil, owner: me, participant: nil, type:Task.TaskType.Report)




callTask.participant?.phoneNumber = "010-5678-1234"
print("\(toby.phoneNumber!)")



todayTask[1].time = 15 * 60
//callTask.title = "Call to Toby"
print("today task = \(todayTask), callTask =\(callTask)")



