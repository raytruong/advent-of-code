import Foundation

public class CampCleanup {
    public var file: String = "12.4.22"
    
    public func part1(_ input: String) -> Int {
        let allPairs: [String] = input.split(separator: "\n").compactMap { String($0) }
        var completeOverlapCounter = 0
        // 1. loop through each pair
        for pair in allPairs {
            let split = pair.split(separator: ",")
            let elfA = split.first!.split(separator: "-").compactMap { Int($0) }
            let elfB = split.last!.split(separator: "-").compactMap { Int($0) }
            let rangeA = Set(elfA[0]...elfA[1])
            let rangeB = Set(elfB[0]...elfB[1])
            let commonElements = rangeA.intersection(rangeB)
            if commonElements.count == rangeA.count || commonElements.count == rangeB.count {
                completeOverlapCounter += 1
            }
        }
        return completeOverlapCounter
    }
    
    public func part2(_ input: String) -> Int {
        let allPairs: [String] = input.split(separator: "\n").compactMap { String($0) }
        var completeOverlapCounter = 0
        // 1. loop through each pair
        for pair in allPairs {
            let split = pair.split(separator: ",")
            let elfA = split.first!.split(separator: "-").compactMap { Int($0) }
            let elfB = split.last!.split(separator: "-").compactMap { Int($0) }
            let rangeA = Set(elfA[0]...elfA[1])
            let rangeB = Set(elfB[0]...elfB[1])
            let commonElements = rangeA.intersection(rangeB)
            if !commonElements.isEmpty {
                completeOverlapCounter += 1
            }
        }
        return completeOverlapCounter
    }
    
    public init() { }
    
    public func getInput() -> String {
        let filePath = Bundle.main.path(forResource: self.file, ofType: "txt")
        let contentData = FileManager.default.contents(atPath: filePath!)
        return String(data:contentData!, encoding:String.Encoding.utf8)!
    }
}

