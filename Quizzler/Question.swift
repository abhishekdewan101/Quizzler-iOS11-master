//
//  Question.swift
//  Quizzler
//
//  Created by Abhishek Dewan on 3/3/18.
//  Copyright © 2018 Abhishek Dewan. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    //Constructor for swift language.
    init(text:String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
