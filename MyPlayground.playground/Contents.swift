import UIKit

var str = "Hello, playground"

print("Hello, world")

//Simple Values
//variable
var myVariable = 42
//re assign value to variable
myVariable = 50
//Constnant
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//Casting
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

//Casting inside of String text
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"
//
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
//Arrray and Dictionary
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottol of water"
shoppingList
var occupation = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",]

occupation["Jayne"] = "Public Relations"
occupation

var sample = 1.0

sample = 1
//Array Automatically grow when added
shoppingList.append("blue paint")
print(shoppingList)

//Empty Array or Dictionary
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//if type information can be inferred, you can write an empty array as [] and an empty dictionary as [:]- for example, when you set a new value for a variable
//      shoppingList = []
//      occupations =[:]

//Control Flow
let individualScore = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScore {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore)

// Optional Value
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)" // Avoid nil


//Switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwuch.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicty \(x)?")
default:
    print("Everything tastes good in soup.")
}

//Map type
let interestingNumbers = [
    "prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
//prints largest 25

var n = 2
while n < 100 {
    n *= 2
}
print(n)
//prints 128

//Ranage of indexes
var total = 0
for i in 0..<4 { // ... include last value
    total += i
}
print(total)
//Prints "6"

//Function and Closer
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

func calculateStatistics(scores: [Int]) -> (min:Int, max: Int, sum: Int ) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
//Prints "120"
print(statistics.2)
// Prints "120"

//Nested Function
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//Function are first-class type.
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// A Function Can take another function as one of its arguments.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//numbers.map({ (number: Int) -> in
//    let result = 3 * numbers
//    return result
//})

let mappedNumbers = numbers.map({ number in 3 * number})
print(mappedNumbers)
//Prints "[60, 57, 21, 36]"

let sortedNumbers = numbers.sorted { $0 > $1}
print(sortedNumbers)
//Prints "[20, 19, 12, 7]'

//Objects and Classes
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()


class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

//Class Inharitance
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


//In addition to simple properties that are stored, properties can have a getter and a setter.

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var primeter: Double {
        get {
            return 3.0 * sideLength
        }
        
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.primeter)
//Prints "9.3"
triangle.primeter = 9.9
print(triangle.sideLength)
//Prints "3.300000000"

//In the setter for perimeter, the new value has the implicit name newValue. You can provide an explicit name in parentheses after set.
//
//    Notice that the initializer for the EquilateralTriangle class has three different steps:
//
//Setting the value of properties that the subclass declares.
//Calling the superclass’s initializer.
//Changing the value of properties defined by the superclass. Any additional setup work that uses methods, getters, or setters can also be done at this point.
//If you don’t need to compute the property but still need to provide code that is run before and after setting a new value, use willSet and didSet. The code you provide is run any time the value changes outside of an initializer. For example, the class below ensures that the side length of its triangle is always the same as the side length of its square.

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}



var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
//Prints "10.0"
print(triangleAndSquare.triangle.sideLength)
//Prints "10.0"
triangleAndSquare.square = Square(sideLength: 50, name: "large square")
print(triangleAndSquare.triangle.sideLength)
//Prints "50.0"


let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

//Enumerations and Structures
