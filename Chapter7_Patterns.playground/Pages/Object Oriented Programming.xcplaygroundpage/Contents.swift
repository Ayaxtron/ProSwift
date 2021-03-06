

import Foundation


//OOP models programs in terms of entities that have real world equivalents
//This breaks down the program into small re-usable parts
//However, making big architectural desicions in the eraly stages hinders your flexibility in the future
//Methods are used in classes, which are the same as functions but with an implicit self parameter

class test {
    func work(number: Int) {} //This actually looks like this:
    //func work(self: test, number: Int) {}
}
//Because they use classes, objects are reference types

//ENCAPSULATION
//As classes have functionality and methods, it can be said they encapsulate functionality
//A Doctor class for example can have all the functionality required to work as a doctor
class Doctor {
    private var name = "Shaun Murphy" //Giving default values avoids having to write initializers
    private(set) var currentPatient = "Michael Jackson" //Allows it to be read by everyone but not modified
    //In case the patient has to be replaced and considering the Doctor class has to have all it's own funcitonality (centralized logic)
    func assignToPatient(_ name: String) {
        currentPatient = name
    }
    
    func performSurgery(isEmergency emergency: Bool) {
        if emergency {
            print("Lets do this!")
        } else {
            print("Find a surgeon")
        }
    }
}
//Getters and Setters allows the rest of the app to manipulate the objects
//Acces modifiers types:
//private - Only be used by code in the same class or struct
//fileprivate - Only be sued by code in the same Swift file
//internal - Only be used by code in my module(usualy the app)
//public - Anyone can use it

//INHERITANCE
//This allows you to create a new class based on an existing one, importing all it's properties and methods as it goes
//The classes are then calles subclass ans super class
//When you inherit from another class, you bring all the properties and methods from that class. you then can add your own or override the existing ones
class Surgeon: Doctor {
    override func performSurgery(isEmergency emergency: Bool) {
        if emergency {
            print("Lets do this!")
        } else {
            print("Leave it for later")
        }
    }
    
}

//SUPER METHODS
//Super allows you to call or invoke a parent class method
class Surgeon2: Doctor {
    override func assignToPatient(_ name: String) {
        print(getJuniorDoctorDiagnosis())
        
        super.assignToPatient(name)
    }
    func getJuniorDoctorDiagnosis() -> String {
         return "He's very dead"
     }
}
//When working with init() there are some rules
//We must call super.init() in the child to allow the parent to construct itself
//The subclass must have initialized it's own properties before calling super.init()
//You cant call other methods until you initialize all the properties, including super.init
//Example:

class Doctor2 {
    var name: String
    var currentPatient: String
    
    init (name: String, currentPatient: String) {
        self.name = name
        self.currentPatient = currentPatient
    }
}
//If Surgeon doesnt have new properties, it will use the Doctor's initializer
class Surgeon3: Doctor2 {
    var title: String
    
    init(name: String, title: String, currentPatient: String) {
        self.title = title
        super.init(name: name, currentPatient: currentPatient)
    }
}

//Polimorphism
//An objectcan be used like it's own class or any of the classes it inherits from
var availableDoctor = [Doctor]()
availableDoctor.append(Doctor())
availableDoctor.append(Doctor())
availableDoctor.append(Doctor())
//Because Sugeon inherits from Doctor, its also considered a Doctor
availableDoctor.append(Surgeon())
//Its ok because Surgeon inherits the properties and methods or overrides them
for doctor in availableDoctor {
    doctor.performSurgery(isEmergency: false)
}

//Final Classes
//Using the final keyword in a class wont let any subclasses be created
final class Doctor3 {}
//class Surgeon3 : Doctor3 {}

//Class properties and methods
//There's a difference between a property/method belonging to a class and an object
//A regular property/method belongs to and instance of Doctor however, a class property/method is shared across all doctors
class Doctor4 {
    static func quoteHippocraticOath() { //The oath every physician take after graduating
        print("I will preven desease whenever I can, for prevention is preferable to cure")
    }
}
Doctor4.quoteHippocraticOath()
//The static also makes it final
//If we wanetd to be able to modify it in a subclass we would use class func instead
//Also works with properties

//is-a vs has-a
//In OOP the contrast between inheritance and composition is calles  is-a vs has-a
//A surgeon is a doctor, so it makes sense to inherit surgeon from doctor
//A surgeon has a scapel, which means the surgeon class could have a property called scapel
