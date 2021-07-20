import Foundation

class MyList {
    var coffeeList = [Int]()
}

class A1 {
    let myList = MyList()
    
    func insert() {
        myList.coffeeList.append(1)
        myList.coffeeList.append(2)
        myList.coffeeList.append(3)
    }
}

let a = A1()
a.insert()
print(a.myList.coffeeList)

class B1 {
    func update(_ list: MyList) {
        list.coffeeList.append(4)
        list.coffeeList.append(5)
        list.coffeeList = []
    }
}

let b = B1()
b.update(a.myList)
print(a.myList.coffeeList)
