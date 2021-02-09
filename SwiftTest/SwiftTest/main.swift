import Foundation

func measureTime(_ processBlock: () -> Void) {
    let startTime = Date()
    processBlock()
    let intervalTime = Date().timeIntervalSince(startTime)
    print("running time: \(intervalTime)")
}

DispatchQueue.global().async {
    measureTime {
        var a = 0.1
        for _ in 1...50000000 {
            a *= 0.1
        }
    }
}

DispatchQueue.global().async {
    measureTime {
        var a = 0
        for _ in 1...50000000 {
            a += 1
        }
    }
}

Thread.sleep(forTimeInterval: 1)
Thread.sleep(forTimeInterval: 2)
