//
//  MotionCell.swift
//  HomeCheck
//
//  Created by Andrei Vataselu on 12/11/18.
//  Copyright © 2018 Andrei Vataselu. All rights reserved.
//

import UIKit

class MotionCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!

    func configureCell(title: String){
        self.title.text = title
    }
}
