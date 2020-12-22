//
//  model.swift
//  JunbMemo
//
//  Created by USER on 2020/12/22.
//  Copyright © 2020 junb. All rights reserved.
//

import Foundation

class Memo {
    var content: String
    var insertDate: Date
    
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    
    // dummy data
    static var dummyMemoList = [
        Memo(content: "Hello kk"),
        Memo(content: "emoji 😇😇😇")
    ]
}
