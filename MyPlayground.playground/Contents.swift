import UIKit

var greeting = "Hello, playground"
print(greeting)

var name = "Carolyn"
var number = 1

let food = "sushi" //food cannot be changed bc its constant

let nums = [1, 2, 3, 4, 5]

for num in nums {
    print(num)
}

func sum(a: Int, b:Int) -> Int {
    return a + b
}

var summation = sum(a: 2, b: 4)
print(summation)

func over(a: Int) -> Bool {
    if a > 10 {
        return true
    } else {
        return false
    }
}

var OVER = over(a: 11)
print(OVER)

func facebookLogin(name: String, age: Int, westCoast: Bool) {
    if age > 13 || westCoast {
        print("Welcome to Facebook, \(name)")
    } else {
        print("Too young for Facebook")
    }
}

facebookLogin(name: "Caro", age: 2, westCoast: false)
