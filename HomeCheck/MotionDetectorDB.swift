//
//  MotionDetectorDB.swift
//  HomeCheck
//
//  Created by Andrei Vataselu on 12/11/18.
//  Copyright © 2018 Andrei Vataselu. All rights reserved.
//

import Foundation
import FirebaseDatabase


class MotionDetectorDB {
    
    private var ref : DatabaseReference

    init() {
        ref = Database.database().reference()
    }
    
    func getDatabase(_ entries: @escaping ([String: [String]]) -> Void) {
        var detections = [String: [String]]()

        ref.child("detections").observeSingleEvent(of: .value) { (snapshot) in
            if let value = snapshot.value as? NSDictionary {
                for (k, v) in value {
                    if let links = v as? NSDictionary {
                        var linkArray = [String]()
                        for (_, link) in links {
                           linkArray.append(link as? String ?? "")
                        }
                         detections[k as? String ?? ""] = linkArray
                    }
                }
                entries(detections)
            }
        }
    }
}
