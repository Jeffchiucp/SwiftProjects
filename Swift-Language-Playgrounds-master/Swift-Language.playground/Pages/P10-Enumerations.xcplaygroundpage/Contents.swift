/*:
 ![Make School Banner](./swift_banner.png)
# Enumerations
 
Sometimes, you want to make a series of categories of things in your program. The actual value of the categories themselves don't matter, just that they're seen as something distinct.
 
Enter `enum`. Here's an example of an `enum`, representing the 4 cardinal directions
*/
enum CardinalDirection {
    case North, East, South, West
}

// example of how you would use this
CardinalDirection.North
CardinalDirection.East
CardinalDirection.South
CardinalDirection.West
/*:
 Given this, you can make yourself a `CardinalDirection` like this:
 */
let direction: CardinalDirection = .North
/*:
 Notice the value `.North` that we gave our `direction` variable. This is actually a shortened form of `CardinalDirection.North` – because we gave Swift the type when we declared our variable, it can assume that we're looking at values in the `CardinalDirection` enum.
 
 `enum`s in Swift work exceedingly well in conjunction with the `switch` statement. For example, say we want to update the x and y coordinates of a player traveling in one of the directions:
 */
var playerPosition: (x: Int, y: Int) = (2, 3) // a tuple!

switch direction {
case .North:
    playerPosition.y += 1
case .South:
    playerPosition.y -= 1
case .East:
    playerPosition.x += 1
case .West:
    playerPosition.x -= 1
}

playerPosition
/*:
 ## Enumerations with Raw Values
 
 In the previous example, the underlying type of `CardinalDirection` didn't matter – because it was an enum, we couldn't convert it to an Int value or similar. But what if we wanted to associate different values to our enums?
 
 You can declare an enum with an _implicitly assigned raw value_:
 */
enum Month: Int {
    case January = 1,
    February,
    March,
    April,
    May,
    June,
    July,
    August,
    September,
    November,
    December
}

enum Color: String {
    case Red = "red"
    case Blue = "blue"
    case Green = "green"

    // let colorList: Color = [.Red, .Blue, .Green]
    
    func getColor() {
        
    }
}
/*:
 You can then access the raw value of an enum by calling its `.rawValue`:
 */

let month = Month.April
month.rawValue

/*:
 Notice that we didn't provide Swift with raw values for any of the months other than `.January`. That's because, for Int values specifically, Swift will automatically assign raw values with increasing numbers by 1. So, `.February` has a `rawValue` of 2, and `.March` has a `rawValue` of 3, etc.
 */
/*:
 ## More Enumeration Techniques
 Enumerations have a ton of features, and are very powerful in Swift.  Far more powerful than in most languages, in fact. To see what else is possible, check out [Apple's documentation on enumerations.](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html) 
 */





/*: 
 
 ### Challenge
 
 The core use of an enumeration is creating named references to values. While you could use: `0, 1, 2, 3` to represent North, East, South, and West. It's much easier to read and write code that uses names like: `North, East, South, and West`.
 
 - callout(Challenge):
    1. Imagine you want to create Tic Tac Toe. This is a game played on a three by three grid. Each grid space can be empty, or contain an `X` or `O`. An enum would be great for this. Write an enum to keep track of grid content for Tic Tac Toe.

    2. You're making a game. You need to keep track of the direction your player can move. Make enum to keep track of directions `Up, Right, Down, and Left`.

    3. Make a two-dimensional array that contains a completed game of Tic Tac Toe, where `X` has won. This means there needs to be three `X`s in a row.

    4. Imagine you are creating an app that will organize todo items. You want to color code them and would rather use an enum rather than the raw color value. Writing `.Orange`, is easier and more descriptive than using something like `#ff4411`! Create an enum containg the colors: `Red, Orange, Blue, and Green`.
 
 */
// Write your challenge code here:


// 1	Imagine you want to create Tic Tac Toe. This is a game played on a three by three grid. Each grid space can be empty, or contain an X or O. An enum would be great for this. Write an enum to keep track of grid content for Tic Tac Toe.


enum GridSquare {
    case Empty, X, O
}

//2

enum Direction {
    case Up, Right, Down, Left

}

//3 Make a two-dimensional array that contains a completed game of Tic Tac Toe, where X has won. This means there needs to be three Xs in a row.
var ticTacToeBoard: [[GridSquare]] = [[.O, .X, .X],
                                      [.O, .X, .O],
                                      [.X, .O, .Empty]]


//4 	4.	Imagine you are creating an app that will organize todo items. You want to color code them and would rather use an enum rather than the raw color value. Writing .Orange, is easier and more descriptive than using something like #ff4411! Create an enum containg the colors: Red, Orange, Blue, and Green.
enum Colors {
    case Red, Orange, Blue, Green
}


/*: 
 ### Answer
 */

/*
// 1
enum GridSquare {
    case Empty, X, O
}



// 2 
enum Direction {
    case Up, Right, Down, Left
}



// 3
var ticTacToeBoard: [[GridSquare]] = [[.O, .X, .X],
                                      [.O, .X, .O],
                                      [.X, .O, .Empty]]

// Notice th board is type [[GridSquare]]. This is says the array contains arrays,
// and these nested arrays contain GridSquares.
 
 
// 4 
enum Colors {
    case Red, Orange, Blue, Green
}

*/
/*:
[Previous](@previous) | [Table of Contents](P00-Table-of-Contents) | [Next](@next)
*/
