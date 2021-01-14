//import Foundation
//
//class Job1: Operation {
//    override func main() {
//        for index in 1...5 {
//            print("\(index)...👻")
//        }
//    }
//}
//
//class Job2: Operation {
//    override func main() {
//        for index in 1...5 {
//            print("\(index)...🔥")
//        }
//    }
//}
//
//let a = OperationQueue()
//a.maxConcurrentOperationCount = 2
//
//a.addOperation {
//    for index in 1...5 {
//        print("\(index)...👻")
//    }
//}
//
//a.addOperation {
//    for index in 1...5 {
//        print("\(index)...🤬")
//    }
//}
//
//let job1 = Job1()
//let job2 = Job2()
//job2.addDependency(job1)
//a.qualityOfService = .background
//
//a.addOperation(job1)
//a.addOperation(job2)
//
//Thread.sleep(forTimeInterval: 10)
