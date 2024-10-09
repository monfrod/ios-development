import UIKit
import Foundation

//func twoSum(array: [Int], target: Int){
//    for i in 0..<array.count{
//        for j in 0..<array.count{
//            if j == i{
//                continue
//            }
//            if array[i]+array[j] == target{
//                let array1 = [i, j]
//                print(array1)
//                break
//            }
//        }
//    }
//}
//twoSum(array: [2,3,11,3], target: 5)

func groupByLetters(array:[String])->[Character: [String]]{
    var Dictionary: [Character: [String]] = [:]
    var uniFirstLetter: [Character] = []
    var firstLetter: [Character] = []
    var seen = Set<Character>()
    for i in 0..<array.count{
        firstLetter.append(array[i].first!)
    }
    for i in firstLetter{
        if !seen.contains(i){
            seen.insert(i)
            uniFirstLetter.append(i)
        }
    }
//    print(firstLetter)
//    print(uniFirstLetter)
    for i in uniFirstLetter{
        for j in 0..<array.count{
            if array[j].first == i{
                if Dictionary[i] != nil {
                    Dictionary[i]?.append(array[j])
                } else {
                    Dictionary[i] = [array[j]]
                }
            }
        }
    }
    
    return Dictionary
}
let words = ["apple", "banana", "cherry", "avocado", "blueberry"]
print(groupByLetters(array: words))
