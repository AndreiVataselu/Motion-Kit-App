//
//  ViewController.swift
//  HomeCheck
//
//  Created by Andrei Vataselu on 12/7/18.
//  Copyright © 2018 Andrei Vataselu. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var db : MotionDetectorDB? = nil
    var entries = [String: [String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        db = MotionDetectorDB()
        
        db?.getDatabase({ (inputs) in
            self.entries = inputs
            self.tableView.reloadData()
        })
    }
    
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entries.keys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MotionCell") as! MotionCell
        let keys = Array(entries.keys).sorted()
        cell.configureCell(title: "\(keys[indexPath.row]) - \(entries[keys[indexPath.row]]!.count) detections")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let collectionView = storyboard?.instantiateViewController(withIdentifier: "CollectionView") as? CollectionViewController {
            let keys = Array(entries.keys).sorted()
            if let links = entries[keys[indexPath.row]] {
                collectionView.photoLinks = links
            }
            navigationController?.pushViewController(collectionView, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

