import Foundation

public class CalorieCounting {
    public var file: String = "12.1.22"

    public func part1(_ input: String) -> Int {
        let splitIntoElves = input.split(separator: "\n\n")
        
        var highestCalories: Int = 0
        
        for elf in splitIntoElves {
            let caloriesForElf = String(elf)
            let foodItemsForElf = caloriesForElf.split(separator: "\n").compactMap { Int($0) }
            let totalCaloriesForElf = foodItemsForElf.reduce(into: 0) { accumulator, foodItemCalories in
                accumulator += foodItemCalories
            }
            highestCalories = max(highestCalories, totalCaloriesForElf)
        }
        return highestCalories
    }
    
    public func part2(_ input: String) -> Int {
        let splitIntoElves = input.split(separator: "\n\n")
        
        var caloriesCarriedByEachElf: [Int] = []
        
        for elf in splitIntoElves {
            let caloriesForElf = String(elf)
            let foodItemsForElf = caloriesForElf.split(separator: "\n").compactMap { Int($0) }
            let totalCaloriesForElf = foodItemsForElf.reduce(into: 0) { accumulator, foodItemCalories in
                accumulator += foodItemCalories
            }
            caloriesCarriedByEachElf.append(totalCaloriesForElf)
        }
        
        // Sorting approach, could also use heap
        caloriesCarriedByEachElf.sort(by: { $0 > $1 })
        
        let topThreeElves = caloriesCarriedByEachElf.prefix(3)
        
        return topThreeElves.reduce(into: 0) { accumulator, calories in
            accumulator += calories
        }
    }
        
    public init() { }
    
    public func getInput() -> String {
        let filePath = Bundle.main.path(forResource: self.file, ofType: "txt")
        let contentData = FileManager.default.contents(atPath: filePath!)
        return String(data:contentData!, encoding:String.Encoding.utf8)!
    }
}
