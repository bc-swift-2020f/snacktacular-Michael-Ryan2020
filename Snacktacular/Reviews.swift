//
//  Reviews.swift
//  Snacktacular
//
//  Created by Michael Ryan on 11/5/20.
//  Copyright © 2020 Michael Ryan. All rights reserved.
//

import Foundation
import Firebase

class Reviews {
    var reviewArray: [Review] = []
    
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
}
