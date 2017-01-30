/*:
 ![Make School Banner](./swift_banner.png)
# Challenge!
To cap things off, here's a challenge that will require you to use many of the concepts you've learned so far. You're going to be creating a simple card game, in which you (the player) draw a card against the computer. The highest card wins! What an exciting game!
*/
/*:
## Card Class
To start we'll make a simple card class. In fact, instead of a class, it might be even better to create a card `struct`. A `struct` is a little bit better for a couple reasons:
 
1. We don't expect to inherit from the card class, so `struct`s lack of inheritance is okay
2. A `struct` will be a little bit more performant, because of the small amount of memory our card will occupy.
 
 If all that seems a little vague or weird, that's okay! Choosing a `struct` instead of a `class` or vice-versa won't actually matter too much in any case.
 
 Our card class will have two properties: `rank` and `suit`. There are 13 ranks: Ace, King, Queen, Jack and Ten through Two. And, of course, the 4 suits are Spades, Clubs, Diamonds and Hearts.
 
 There's a couple of ways we could represent this information. For example, we could use an `Int` to represent the rank, Two would be `2`, Ten would be `10`, Jack would be `11`, etc. Or maybe we could use strings, like: `"Ace"`, `"Queen"`, `"Diamonds"`. But we shouldn't do either of those things - there's a better way! Can you think of what it is?
 */
/*:
Hopefully the answer you came up with is *enumerations*. Go ahead and use the following code to create your enumerations:
 
    enum Rank {
        case Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
     
        static func allValues() -> [Rank] {
            return [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
        }
    }
     
    enum Suit {
        case Spades, Hearts, Diamonds, Clubs
     
        static func allValues() -> [Suit] {
            return [Spades, Hearts, Diamonds, Clubs]
        }
    }
 
Both enumerations come with an `allValues()` function, which returns an array containing each of the enumeration values. This function will be helpful later, when you create your `Deck` class.

 
So now, using the above `enum` code (you'll have to type it out below), create a Card `struct` with `suit` and `rank` properties, and an initializer that accepts `suit` and `rank` parameters.
*/
/* Place your code here! */
//enum Rank: Int{
//    case Ace = 14, Two = 2, Three = 3, Four = 4, Five = 5, Six = 6, Seven = 7, Eight = 8, Nine = 9, Ten = 10, Jack = 11, Queen = 12, King = 13
//    
//    static func allValues() -> [Rank] {
//        return [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
//    }
//}
//
//
//
//enum Suit {
//    case Spades, Hearts, Diamonds, Clubs
//    
//    static func allValues() -> [Suit] {
//        return [Spades, Hearts, Diamonds, Clubs]
//    }
//}



/*:
## Deck Class
 
Now that you've created your card class, it's time to create a `Deck` to hold them. A standard 52 card deck has one card of each rank and suit pair. The cards in a deck must also be ordered: can you think of a data structure to hold them?
 
To start, your deck should have an empty initializer. Inside the initializer, create all 52 cards, and place them in the ordered data structure.
*/
/* Place your code here! */

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    static let ranks = [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    
        static let suits = [Spades, Hearts, Diamonds, Clubs]
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}


struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    func createDeck() -> [Card] {
        let suits = [Suit.Spades, Suit.Hearts, Suit.Clubs, Suit.Diamonds]
        var deck = [Card]()
        
        for theSuit in suits {
            for theRank in Rank.Ace.rawValue...Rank.King.rawValue {
                deck.append(Card(rank: Rank(rawValue: theRank)!, suit: theSuit))
            }
        }
        
        return deck
    }
}

//First we define the possible ranks and suits, using the respective Rank and Suit enums defined previously. Next we have the function iterate over each rank within each suit, creating a card for each, and finally returning an array of the cards.
//let aceOfHearts = Card(rank: .Ace, suit: .Hearts)
//let deck = aceOfHearts.createDeck()
//
//for card in deck {
//    print("\(card.rank) of \(card.suit)")
//}

class Deck{
    // var cardsArray = [Card]()
    var cardsArray: [Card] = []
    init() {
        for rank in Rank.ranks {
            for suit in Suit.suits{
                let newCard = Card(rank: rank, suit: suit)
                cardsArray.append(newCard)
            }
        }
    }
    
}

let myDeck = Deck()
print (myDeck.cardsArray.count)
//
//
//func compareCards(playerCard: Card, computerCard: Card) ->Winner{
//    if playerCard.rank.rawValue < computerCard.rank.rawValue{
//        return .Computer
//    }else if playerCard.rank.rawValue == computerCard.rank.rawValue{
//        if playerCard.suit.hashValue < computerCard.suit.hashValue{
//            return .Player
//        }else{
//            return .Computer
//        }
//    }else{
//        return .Player
//    }
//}
//

/*:
Now that you have a `Deck` it's time to add some functionality. Create a a function in your `Deck` class above called `drawOne()`. `drawOne()` should return a random card from the deck. Don't forget to remove that card from your internal deck data structure! 
 
 To help draw a random card, you'll probably want to use the built-in `arc4random_uniform()` function. `arc4random_unform(upperBound)` will generate a number from 0 up to but less than `upperBound`. One caveat is that `arc4random_uniform()` only likes to work with unsigned 32-bit integers (`UInt32`). So you'll need to do some casting between `UInt32` and `Int` to make it work. To access `arc4random_uniform()` you'll first need to `import Foundation`.
 
Once you've implemented `drawOne()`, uncomment the following code to test it out! You can show the debug area (⇧⌘Y) to see what's printed.
*/

import Foundation

// arc4random_unform(upperBound)

//func printCard(card: Card?) {
//    if let card = card {
//        print("The random card is the \(card.rank) of \(card.suit)")
//    } else {
//        print("That's not a card!")
//    }
//}
//
//let testDeck = Deck()
//
//for _ in 1...55 {
//    let card = testDeck.drawOne()
//    printCard(card)
//}
/*:
- important:
 Does the test code above create an error?  If so, it's likely because you forgot to account for the case where there's no cards left in the deck to draw! Change your `drawOne()` method so that it returns `nil` if there's no cards left to draw.
 */
/*:
## A Simple Game
 Now it's time to make a simple game. Create a deck, and draw one card for you (the player) and one card for the computer. The highest card wins! In this game, a Two is the lowest card and Ace is the highest card. If both players draw the same rank card, then suit is used to determine the winner. Spades is the best suit, followed by Hearts, Diamonds, then Clubs.
 
 You should print out the result of the game like this:
    
>The (_player_ or _computer_) won with the _rank_ of _suit_!
 
 So, an example of the output might be:
 
    The player won with the King of Clubs!
 
 
 Here's some hints:
 
 It's best to make your code reusable. One way to do that is to place it into functions. I suggest you create a function to compare two cards to determine which one is the winner. It would also be good to have a function that prints the result of the game!
 
 You can make comparing the cards easier if you assign _raw values_ to the enumerations. Check out the [enumerations playground](P10-Enumerations) for a refresher on how to do that.
 */
/* Place your code here! */

//func printCard(card: Card?) {
//    if let card = card {
//        print("The random card is the \(card.rank) of \(card.suit)")
//    } else {
//        print("That's not a card!")
//    }
//}
//
//let testDeck = Deck()
//
//for _ in 1...55 {
//    let card = testDeck.drawOne()
//    printCard(card)
//}


//
//@property NSMutableArray *newDeck;
//
//-(void)viewDidLoad {
//    [super viewDidLoad];
//    self.newDeck = [[NSMutableArray alloc]init];
//}
//
//-(void)shuffleDeck:(NSMutableArray *)deckOfCards {
//    int numOfCards = (signed)deckOfCards.count;
//    for (int i = numOfCards; i > 0; i--) {
//        int randomIndex = arc4random_uniform(deckOfCards.count-1);
//        NSString *card = [deckOfCards objectAtIndex:randomIndex];
//        [self.newDeck addObject:card];
//        [deckOfCards removeObjectAtIndex:randomIndex];
//    }
//}
//
//


/*:
 - important:
 Once you're done, have your instructor check your code!
 */
/*:
[Previous](@previous) | [Table of Contents](P00-Table-of-Contents) | [Advanced Topics](@next)
 */
