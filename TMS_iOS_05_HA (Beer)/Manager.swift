import Foundation


class Manager {
    
    private var beerQuantity: UInt = 10
    private var isСurrentDayStarted = false
    private var currentDay = 0
    
    private(set) var remainBottles: UInt
    private(set) var cashToday: Double = 0.0
    
    
    
    static let shared = Manager()
    
    private init() {
        self.remainBottles = beerQuantity
    }
    
    func sellOneBeer() {
        if remainBottles == 0 {
            print("nothing to sell")
            return
        }

        remainBottles -= 1
        let grimberger = Beer.grimberger()

        cashToday += grimberger.price
    }

    func sellBeer(count: UInt) {
        if remainBottles < count {
            print("not enough beer")
            return
        }

        remainBottles -= count
        let grimberger = Beer.grimberger()

        cashToday += grimberger.price * Double(count)
    }
    
    func start() {
        if isСurrentDayStarted {
            print("logic error, workday is started")
            return
        }
        isСurrentDayStarted = true
        cashToday = 0
    }
    
    func close() {
        if !isСurrentDayStarted {
            print("logic error, workday is closed")
            return
        }
        isСurrentDayStarted = false
        currentDay += 1
    }
    
    func isOpen() -> Bool {
        return isСurrentDayStarted
    }
}
