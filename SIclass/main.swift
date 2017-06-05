//
//  main.swift
//  SIclass
//
//  Created by Kordian Ledzion on 28.05.2017.
//  Copyright © 2017 KordianLedzion. All rights reserved.
//

import Foundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

let conv = Converter()

print("START")

conv.run()

print("Buduje strukture")

let structure = try NeuralNet.Structure(nodes: [61188, 500, 20], hiddenActivation: .rectifiedLinear, outputActivation: .softmax)

print("Tworze NN na podstawie struktury")

let nn = try NeuralNet(structure: structure)

print("Tworze dataset")

let dataset = try NeuralNet.Dataset(trainInputs: conv.trainData, trainLabels: conv.trainLabels, validationInputs: conv.testData, validationLabels: conv.testLabels)

print("Start uczenia")

let (epochs, error) = try nn.train(dataset, maxEpochs: 50, errorThreshold: 0.02, errorFunction: .percentage) { (epoch, err) -> Bool in
    
    // Log progress
    let percCorrect = (1 - err) * 100
    let percError = err * 100
    print("\nEpoch \(epoch)")
    print("Accuracy:\t\(percCorrect)%")
    print("Error:\t\t\(percError)%")
    
    // Decay learning rate and momentum
    nn.learningRate *= 0.97
    nn.momentumFactor *= 0.97
    
    // Allow training to continue
    return true
}

print("FINISH")
