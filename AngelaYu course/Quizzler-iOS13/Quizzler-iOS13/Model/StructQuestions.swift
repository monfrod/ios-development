//
//  StructQuestions.swift
//  Quizzler-iOS13
//
//  Created by yunus on 20.01.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Questions{
    let text: String
    let answer: String
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
