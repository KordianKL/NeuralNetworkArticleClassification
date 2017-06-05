//
//  Converter.swift
//  SIclass
//
//  Created by Kordian Ledzion on 29.05.2017.
//  Copyright © 2017 KordianLedzion. All rights reserved.
//

import Foundation

public class Converter {
    
    public var trainData = [[Float]]()
    public var trainLabels = [[Float]]()
    public var testData = [[Float]]()
    public var testLabels = [[Float]]()
    
    public func run(){
        
        print("trainDATA START")
        
        //Wrapping trainDATA
        
        var placeholderArray = [[Float]](repeating: [Float](repeating: 0.0, count: 61188), count: 11269)
        var placeholder = ""
        var path = URL(string: "file:////Users/kordianledzion/Desktop/Kordian/Swift/SIclass/SIclass/trainDATA.txt")! // Your path here
        do {
            placeholder = try String(contentsOf: path, encoding: String.Encoding.utf8)
        }
        catch {print("ERROR reading file")}
        placeholder.enumerateLines { (line, _) in
            let split = line.components(separatedBy: " ")
            placeholderArray[Int(split[0])!-1][Int(split[1])!-1] = Float(split[2])! / 100.0
        }
        
        print("trainDATA DONE")
        
        trainData = placeholderArray
        
        
        
        
        
        print("trainLABEL START")
        var index = 0
        
        //Wrapping trainLABEL
        
        placeholderArray = [[Float]](repeating: [Float](repeating: 0.0, count: 20), count: 11269)
        path = URL(string: "file:////Users/kordianledzion/Desktop/Kordian/Swift/SIclass/SIclass/trainLABEL.txt")!
        do {
            placeholder = try String(contentsOf: path, encoding: String.Encoding.utf8)
        }
        catch {print("ERROR reading file")}
        placeholder.enumerateLines { (line, _) in
            placeholderArray[index][Int(line)!-1] = 1.0
            index = index+1
        }
        
        trainLabels = placeholderArray
        index = 0
        
        print("trainLABEL DONE")
        
        
        
        
        
        print("testDATA START")
        
        //Wrapping testDATA
        
        placeholderArray = [[Float]](repeating: [Float](repeating: 0, count: 61188), count: 7505)
        path = URL(string: "file:////Users/kordianledzion/Desktop/Kordian/Swift/SIclass/SIclass/testDATA.txt")!
        do {
            placeholder = try String(contentsOf: path, encoding: String.Encoding.utf8)
        }
        catch {print("ERROR reading file")}
        placeholder.enumerateLines { (line, _) in
            let split = line.components(separatedBy: " ")
            placeholderArray[Int(split[0])!-1][Int(split[1])!-1] = Float(split[2])! / 100.0
        }
        
        testData = placeholderArray
        
        print("testDATA DONE")
        
        
        
        
        
        print("testLABEL START")
        
        //Wrapping testLABEL
        
        placeholderArray = [[Float]](repeating: [Float](repeating: 0, count: 20), count: 7505)
        path = URL(string: "file:////Users/kordianledzion/Desktop/Kordian/Swift/SIclass/SIclass/testLABEL.txt")!
        do {
            placeholder = try String(contentsOf: path, encoding: String.Encoding.utf8)
        }
        catch {print("ERROR reading file")}
        placeholder.enumerateLines { (line, _) in
            placeholderArray[index][Int(line)!-1] = 1.0
            index = index+1
        }
        
        testLabels = placeholderArray
        
        print("testLABEL DONE")
    }
    
}
