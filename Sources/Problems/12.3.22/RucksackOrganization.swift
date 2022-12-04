import Foundation

public class RucksackOrganization {
    public var file: String = "12.2.22"
    
    public func part1(_ input: String) -> Int {
        let allRucksacks: [String] = input.split(separator: "\n").compactMap { String($0) }
        var duplicateItems = [Character]()
        // 1. divide each rucksacks into two parts (each is guaranteed to be an even number of characters)
        for rucksack in allRucksacks {
            let oneBasedMiddle = Int(Double(rucksack.count) / Double(2.0))
            let firstCompartment = Set(rucksack.prefix(oneBasedMiddle))
            let secondCompartment = Set(rucksack.dropFirst(oneBasedMiddle))
            // 2. find the intersection between both parts
            let commonElements = firstCompartment.intersection(secondCompartment)
            duplicateItems += commonElements
        }
        // 3. map those to a number and sum them
        return duplicateItems.reduce(into: 0) { accumulator, item in
            if item.isLowercase {
                if let itemValue = item.asciiValue {
                    accumulator += (Int(itemValue) - 96)
                }
            }
            else {
                if let itemValue = item.asciiValue {
                    accumulator += (Int(itemValue) - 38)
                }
            }
        }
    }
    
    func part2(_ input: String) -> Int {
        let allRucksacks: [String] = input.split(separator: "\n").compactMap { String($0) }
        var duplicateItems = [Character]()
        // 1. divide each rucksacks into two parts (each is guaranteed to be an even number of characters)
        for rucksack in allRucksacks {
            let oneBasedMiddle = Int(Double(rucksack.count) / Double(2.0))
            let firstCompartment = Set(rucksack.prefix(oneBasedMiddle))
            let secondCompartment = Set(rucksack.dropFirst(oneBasedMiddle))
            // 2. find the intersection between both parts
            let commonElements = firstCompartment.intersection(secondCompartment)
            duplicateItems += commonElements
        }
        // 3. map those to a number and sum them
        return duplicateItems.reduce(into: 0) { accumulator, item in
            if item.isLowercase {
                if let itemValue = item.asciiValue {
                    accumulator += (Int(itemValue) - 96)
                }
            }
            else {
                if let itemValue = item.asciiValue {
                    accumulator += (Int(itemValue) - 38)
                }
            }
        }
    }
    
    public init() { }
    
    public func getInput() -> String {
        let filePath = Bundle.main.path(forResource: self.file, ofType: "txt")
        let contentData = FileManager.default.contents(atPath: filePath!)
        return String(data:contentData!, encoding:String.Encoding.utf8)!
    }
}
