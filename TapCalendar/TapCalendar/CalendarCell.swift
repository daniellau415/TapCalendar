//
//  CalendarCell.swift
//  TapCalendar
//
//  Created by Daniel Lau on 11/11/18.
//  Copyright © 2018 Daniel. All rights reserved.
//

import UIKit

protocol CalendarCellDelegate: class {
    func changeTappedCell(cell: CalendarCell)
}

class CalendarCell: UICollectionViewCell {
    
    @IBOutlet var cellView: UIView!
    @IBOutlet var cellButton: UIButton!
    
    var day : Day? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate : CalendarCellDelegate?
    var isComplete : Bool? 
    
    @IBAction func cellTapped(_ sender: Any) {
        delegate?.changeTappedCell(cell: self)
    }
    
    func updateViews() {
        if isComplete == true {
            cellView.backgroundColor = .yellow
        } else {
            cellView.backgroundColor = .lightGray
        }
    }
    
    override func awakeFromNib() {
        cellView.backgroundColor = UIColor.lightGray
    }
}
