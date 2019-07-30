import Foundation

// Swift 5.0 updates

// TODO: create your own repo to highlight Swift 5.0 updates
// Prerequiste is Xcode 10.2 +
// Xcode 11 will be shipped with Swift 5.1


//==========================================================================
// Raw Strings
//==========================================================================
// Extended String Delimiters - https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html
// "hello"

print("\"hello\"")

// prints raw string as "hello"
let message = #""hello""#

let programmingLanguage = "iOS"

// handling string interpolation by adding an extra # delimeter embedding in \#()
let pursuitMessage = #""Welcome to Pursuit's \#(programmingLanguage) 6.0 cohort""#

print(message)


print(pursuitMessage)


//==========================================================================
// Character Properties
//==========================================================================

// present emoji keyboard - control, command + space bar
let sentence = "1$🔥&4?ap*"
for char in sentence {
  if char.isLetter {
    print("letter: \(char)")
  }
  if char.isCurrencySymbol {
    print("currency symbol: \(char)")
  }
  if char.isSymbol {
    print("symbol: \(char)")
  }
  if char.isPunctuation {
    print("punctuation: \(char)")
  }
}


//==========================================================================
// Review map, filter, flatmap
//==========================================================================

let tweets = [ "starting the fall cycle at #pursuit",
               "#darnclosures are killing me",
               "dreams of an #ios #developer",
               "#swiftui is dope, #iosdeveloper #mindblown"
]

// use map, filter and flatmap to return an array of hashtags
// output: ["#pursuit", "#darnclosures", "#ios", "#developer", "#swiftui", "#iosdeveloper", "#mindblown"]


// Hint: start out by writing a function to return an array of hashtags from a given String


func getHashtags(input: String) -> [String] {
  let newArray = input.components(separatedBy: " ")
  return newArray.filter{$0.starts(with: "#")}
}

let tags = tweets.map{getHashtags(input: $0)}.flatMap{$0}
print(tags)



//==========================================================================
// Review compactMap
//==========================================================================

// use compactMap to return only valid numbers from numStrings
// output: [1, 9, 54]
let numStrings = ["1","a","&","9", "54", "🎉"]

var validNumber = numStrings.compactMap{Int($0)}
print(validNumber)



//==========================================================================
// Review mapValues
//==========================================================================

// given dictionaryOfNums square each value
// output: [2: 4, 3: 9, 4: 16, 5: 25]

let dictionaryOfNums = [2: 2, 3: 3, 4: 4, 5: 5]

var doubles = dictionaryOfNums.mapValues{$0 * $0}

print(doubles)



//==========================================================================
// New in Swift 5.0: compactMapValues
//==========================================================================

let cities = ["Stockholm": true,
              "Tokyo": nil,
              "Boston": true,
              "San Francisco" : true,
              "London": nil]

// perform compactMapValues on cites to return non-nil elements
// output ["Stockholm": true, "Boston": true, "San Francisco" : true]
let validCities = cities.compactMapValues{$0}
print(validCities)
