# SparkMVVM
### Swift MVVM project


## About the application
The app contains a list of questions. Below the questions you can see your choice (You will see "N/A" if you have have not selected any option yet). Just tap on the cell to see the options from which you can choose the answer to  question. Your choice for a question will reflect when you come back.

## Usage
Xcode : 9.4
SDK: iOS 11.4

## Assumptions / Candidates for improvements
1. First question in a set is always single choice with multiple options.
2. In case of conditional questions the nested question is always of type range.
3. In case of condition the predicate will be of type excact equals.

## TODO's
1. Include questions in JSON with varying type. Go for condtional encoding and decoding with codable. where an array may contain a different data type.
https://stackoverflow.com/questions/48314724/swift-codable-parse-json-array-which-can-contain-different-data-type
Having different Class / Struct construct in comparison to the JSON structure sent in the response.
https://www.raywenderlich.com/382-encoding-decoding-and-serialization-in-swift-4


