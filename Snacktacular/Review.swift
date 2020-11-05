//
//  Review.swift
//  Snacktacular
//
//  Created by Michael Ryan on 11/5/20.
//  Copyright © 2020 Michael Ryan. All rights reserved.
//

import Foundation
import Firebase

class Review {
    var title: String
    var text: String
    var rating: Int
    var reviewUserID: String
    var date: Date
    var documentID: String
    
    var dictionary: [String: Any] {
        let timeIntervalDate = date.timeIntervalSince1970
        return ["title": title, "text": text, "rating": rating, "reviewUserID": reviewUserID, "date": timeIntervalDate]
    }
    
    init(title: String, text: String, rating: Int, reviewUserID: String, date: Date, documentID: String) {
        self.title = title
        self.text = text
        self.rating = rating
        self.reviewUserID = reviewUserID
        self.date = date
        self.documentID = documentID
    }
    
    convenience init() {
        let reviewUserID = Auth.auth().currentUser?.uid ?? ""
        self.init(title: "", text: "", rating: 0, reviewUserID: reviewUserID, date: Date(), documentID: "")
    }
    
    func saveData(spot: Spot, completion: @escaping (Bool) -> ()) {
        let db = Firestore.firestore()
        
        let dataToSave: [String: Any] = self.dictionary
        if self.documentID == "" {
            var ref: DocumentReference? = nil
            ref = db.collection("spots").document(spot.documentID).collection("reviews").addDocument(data: dataToSave){ (error) in
                guard error == nil else {
                    return completion(false)
                    print("ERROR: Adding document \(error!.localizedDescription)")
                }
                self.documentID = ref!.documentID
                print("Added document \(self.documentID) to spot \(spot.documentID)")
                completion(true)
            }
        } else {
            let ref = db.collection("spots").document(spot.documentID).collection("reviews").document(self.documentID)
            ref.setData(dataToSave) { (error) in
                guard error == nil else {
                    return completion(false)
                    print("ERROR: Updating document \(error!.localizedDescription) in spot: \(spot.documentID)")
                }
                print("Updated document \(self.documentID)")
                completion(true)
            }
        }

    }
    
}