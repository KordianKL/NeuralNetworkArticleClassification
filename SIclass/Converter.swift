//
//  Converter.swift
//  SIclass
//
//  Created by Kordian Ledzion on 29.05.2017.
//  Copyright © 2017 KordianLedzion. All rights reserved.
//

import Foundation

public class Converter {
    
    var pathTrainingData : String
    var pathTrainingLabels : String
    var pathValidationData : String
    var pathValidationLabels : String
    
    public init(pathTrainingData : String, pathTrainingLabels : String, pathValidationData : String, pathValidationLabels : String){
        self.pathTrainingData = pathTrainingData
        self.pathTrainingLabels = pathTrainingLabels
        self.pathValidationData = pathValidationData
        self.pathValidationLabels = pathValidationLabels
    }
    
}
