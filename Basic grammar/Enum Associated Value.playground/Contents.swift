//: Playground - noun: a pl//: Playground - noun: a place where people can play

import UIKit

struct Task {
    var title:String
    var time:Int?
    
    var owner:Employee
    //var participant:Employee?
    
    var type:TaskType
    
    enum TaskType {
        case Call(number:String)
        case Report(to:Employee, when:String)
        case Meet(with:Employee, location:String)
        case Support(who:Employee, duration:Int)
        
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
        //self.participant = nil
    }
    
    func doBasicTask() -> String{
        let taskDescription:String
        switch type {
        case.Call(let number):
            taskDescription = "\(String(describing: owner.name)) make a call to \(number)"
        
        case .Report(let receiver, let time):
            taskDescription = "\(String(describing: owner.name)) report to \(String(describing: receiver.name)) at \(time)"
        case .Meet(let participant, let location):
            taskDescription = "\(String(describing: owner.name)) meet \(String(describing: participant.name)) at \(location)"
        case .Support(let taskOwner, let duration):
            taskDescription = "\(String(describing: owner.name)) support \(String(describing: taskOwner.name)) for \(duration) days"
        }
        return taskDescription
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
        if let myBoss = boss, let callTo = myBoss.phoneNumber{
            let callTask = Task(type: .Call(number: callTo), owner: self)
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
var reportTask = Task(type: .Report(to:toby ,when:"Afternoon"), owner: me)
todayTask += [reportTask]
if let callTask = me.callTasktoBoss(){
    todayTask += [callTask]
    callTask.doBasicTask()
}
reportTask.doBasicTask()
print("\(toby.phoneNumber!)")

