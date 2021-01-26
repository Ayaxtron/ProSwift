import UIKit

protocol Payable {
    func calculateWages() -> Int
}

extension Payable {
    func calculateWages() -> Int {
        return 10000
    }
}

protocol ProvidesTreatment {
    func treat(name: String)
}

extension ProvidesTreatment {
    func treat(name: String) {
        print("I have trated \(name)")
    }
}

protocol ProvideDiagnosis {
    func diagnose() -> String
}

extension ProvideDiagnosis {
    func diagnose() -> String {
        return "He's very dead"
    }
}

protocol ConductSurgery {
    func performSurgery()
}

extension ConductSurgery {
    func performSurgery() {
        print("Surgery was a success")
    }
}

protocol HasRestTime {
    func takeBreak()
}

extension HasRestTime {
    func takeBreak() {
        print("Time to listen some music")
    }
}

protocol NeedsTraining {
    func study()
}

extension NeedsTraining {
    func study() {
        print("Writing some new code")
    }
}

struct Recepcionist {
    
}

struct Nurse {
    
}

struct Doctor {
    
}

struct Surgeon {
    
}

protocol Employee: Payable, HasRestTime, NeedsTraining {}

extension Employee where Self: ProvidesTreatment{
    func checkInsurance() {
        print("Everything in order")
    }
}

extension Recepcionist: Employee {}

extension Nurse: Employee, ProvidesTreatment {}

extension Doctor: Employee, ProvidesTreatment, ProvideDiagnosis {}

extension Surgeon: Employee, ProvideDiagnosis, ConductSurgery {}

extension Collection where Iterator.Element: BinaryInteger {
    func countOddEven() -> (odd: Int, even: Int) {
        var even = 0
        var odd = 0
        
        for val in self {
            if val % 2 == 0 {
                even += 1
            } else {
                odd += 1
            }
        }
        return (odd: odd, even: even)
    }
}
