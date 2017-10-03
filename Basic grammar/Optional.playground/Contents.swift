//: Playground - noun: a place where people can play

import UIKit

var title : String = "Storyboard Prototyping"
var ratings : [Int]? = nil
var supportURL : String! = nil

/*
 Force Unwrapping : !
 : 값의 존재를 확신할 때
*/
supportURL = "gconmaster.github.io"

var bookDescription : String = "\(title)"

if let theRatings = ratings {
    bookDescription += "has \(theRatings.count) ratings"
}
//if let theURL = supportURL {
//    bookDescription += "\r\nsupport web page : \(theURL)"
//}

bookDescription += "\r\nsupport web page : \(supportURL)"

/*
 Optional binding: if let, if var
 : Optional 이 아닌 새로운 상수와 변수 생성
*/


print("\(bookDescription)")


//print ("\(title) has \(ratings?.count) ratings. \r\nsupport web page : \(supportURL)")
