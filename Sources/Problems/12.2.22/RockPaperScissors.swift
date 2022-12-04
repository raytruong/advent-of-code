import Foundation

public class RockPaperScissors {
    public var file: String = "12.2.22"
    
    public func part1(_ input: String) -> Int {
        let rounds: [String] = input.split(separator: "\n").map(String.init)
        
        var signPoints = 0
        var victoryPoints = 0
        
        for round in rounds {
            switch (round.last) {
            case "X":
                victoryPoints += 0
            case "Y":
                victoryPoints += 3
            case "Z":
                victoryPoints += 6
            default:
                victoryPoints += 0
            }
            
            signPoints += calculateSignPoints(player1: round.first!, player2: round.last!)
        }
        
        return signPoints + victoryPoints
    }
    
    public func part2(_ input: String) -> Int {
        let rounds: [String] = input.split(separator: "\n").map(String.init)
        
        var signPoints = 0
        var victoryPoints = 0
        
        for round in rounds {
            signPoints += Sign.fromCharacter(round.last!).rawValue
            victoryPoints += calculateVictoryPoints(player1: round.first!, player2: round.last!)
        }
        
        return signPoints + victoryPoints
    }
    
    public init() { }
    
    public func getInput() -> String {
        let filePath = Bundle.main.path(forResource: self.file, ofType: "txt")
        let contentData = FileManager.default.contents(atPath: filePath!)
        return String(data:contentData!, encoding:String.Encoding.utf8)!
    }
}

extension RockPaperScissors {
    public enum Sign: Int {
        case rock = 1
        case paper = 2
        case scissors = 3
        
        static func fromCharacter(_ char: Character) -> Sign {
            switch char {
            case "A", "X":
                return .rock
            case "B", "Y":
                return .paper
            case "C", "Z":
                return .scissors
            default:
                return .rock
            }
        }
    }
    
    public func calculateVictoryPoints(player1: Character, player2: Character) -> Int {
        let sign1 = Sign.fromCharacter(player1)
        let sign2 = Sign.fromCharacter(player2)
        switch (sign1, sign2) {
        case (.rock, .scissors),
            (.paper, .rock),
            (.scissors, .paper):
            return 0
        case (.rock, .rock),
            (.paper, .paper),
            (.scissors, .scissors):
            return 3
        case (.rock, .paper),
            (.paper, .scissors),
            (.scissors, .rock):
            return 6
        }
    }
    
    public func calculateSignPoints(player1: Character, player2: Character) -> Int {
        let sign1 = Sign.fromCharacter(player1)
        let roundOutcome = player2
        switch (sign1, roundOutcome) {
        case (.rock, "Y"),
            (.paper, "X"),
            (.scissors, "Z"):
            return Sign.rock.rawValue
        case (.rock, "Z"),
            (.paper, "Y"),
            (.scissors, "X"):
            return Sign.paper.rawValue
        case (.rock, "X"),
            (.paper, "Z"),
            (.scissors, "Y"):
            return Sign.scissors.rawValue
        default:
            return 0
        }
    }
}
