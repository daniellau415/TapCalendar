//
//  CalendarViewController.swift
//  TapCalendar
//
//  Created by Daniel Lau on 11/10/18.
//  Copyright © 2018 Daniel. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    @IBOutlet var calCollectionView: UICollectionView!
    @IBOutlet var segView: PinterestSegment!
    
    let cellID = "dayCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        calCollectionView.dataSource = self
        calCollectionView.delegate = self
        
        segView.titles =  CalendarController.shared.months
        
        let cellnib = UINib(nibName: "DayCell", bundle: nil)
        calCollectionView.register(cellnib, forCellWithReuseIdentifier: cellID)
    }
    
    @IBAction func segView(_ sender: PinterestSegment) {
        
//        sender.selectIndex
        CalendarController.shared.daysPerMonth(index: sender.selectIndex)
        let day = Day(isCompleted: false)
        CalendarController.shared.addDays(day: day)
        calCollectionView.reloadData()
    }
    
}

extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        if segView.selectIndex == 0 {
//            return CalendarController.shared.days.count
//        }
//
//        if segView.selectIndex == 1 {
//            return CalendarController.shared.days.count
//        }
//
//        if segView.selectIndex == 2 {
//            return 31
//        }
//
//        if segView.selectIndex == 3 {
//            return 30
//        }
//
//        if segView.selectIndex == 4 {
//            return 31
//        }
//
//        if segView.selectIndex == 5 {
//            return 30
//        }
//
//        if segView.selectIndex == 6 {
//            return 31
//        }
//
//        if segView.selectIndex == 7 {
//            return 31
//        }
//
//        if segView.selectIndex == 8 {
//            return 30
//        }
//
//        if segView.selectIndex == 9 {
//            return 31
//        }
//
//        if segView.selectIndex == 10 {
//            return 30
//        }
//
//        if segView.selectIndex == 11 {
//            return 31
//        }
        
        return CalendarController.shared.days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = calCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CalendarCell
        cell.delegate = self
        
        cell.cellView.backgroundColor = UIColor.lightGray
        return cell
    }
    
}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 50) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insets:CGFloat = 5
        return UIEdgeInsets(top: 0, left: insets, bottom: insets, right: insets)
    }
}

extension CalendarViewController: CalendarCellDelegate {
    
    func changeTappedCell(cell: CalendarCell) {
        guard let indexPath = calCollectionView.indexPath(for: cell) else { return }
        let day = CalendarController.shared.days[indexPath.row]
        CalendarController.shared.toggleOnOff(day: day)
        print(day.isCompleted)
    }
}
