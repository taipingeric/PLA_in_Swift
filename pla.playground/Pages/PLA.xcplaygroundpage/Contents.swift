import UIKit

class Perceptron2 {
    
    let learningRate = 0.01
    let iteration = 10
    var history = [Double]()
    var weights: [Double] = [0]
    var bias: Double = 0
    
    func train(X_train: [Double], y_train: [Double]) {
        for i in 0..<X_train.count {
            let x = X_train[i]
            let y = y_train[i]
            let update = (y - predict(x: x)) * self.learningRate
            self.weights = self.weights.map{ $0 + update * x }
            self.bias = self.bias + update
        }
        self.history.append(self.weights[0])
    }
    
    func predict(x: Double) -> Double {
        let y = x * weights[0] + bias
        return y > 0 ? y : 0
    }
}

let inputs: [Double] = (0..<200).map { Double($0) / 100 } // 0~2
let outputs: [Double] = inputs.map { input in input * 5566 + 7788 } // y = 5566x + 7788

class Perceptron {
    
    var weight: Double = 0
    var bias: Double = 0
    var history: [Double] = []
    let learningRate = 0.01
    
    func train(X: [Double], Y: [Double]) {
        for i in 0..<X.count {
            let x = X[i]
            let y = Y[i]
            let update = (y - predict(x: x)) * learningRate
            self.weight += update * x
            self.bias += update
        }
        self.history.append(self.weight)
    }
    func predict(x: Double) -> Double {
        return x * weight + bias
    }
}

let pla = Perceptron()

for i in 0..<20 {
    pla.train(X: inputs, Y: outputs)
    print(i)
}

pla.history.map { $0 }
print(pla.history.last!, pla.bias)
