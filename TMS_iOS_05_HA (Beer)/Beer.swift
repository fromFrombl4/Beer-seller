import Foundation

class Beer {
       
    let name: String
    let price: Double
    let country: String

    init(name: String,
         price: Double,
         country: String) {
        self.name = name
        self.price = price
        self.country = country
    }

    static func grimberger() -> Beer {
        return Beer(name: "Grimberger", price: 2.05, country: "Belgium")
    }

    static func alivaria() -> Beer {
        return Beer(name: "Alivaria", price: 1.5, country: "Belarus")
    }
}

