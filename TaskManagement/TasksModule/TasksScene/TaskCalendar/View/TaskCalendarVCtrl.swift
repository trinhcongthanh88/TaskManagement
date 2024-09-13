//
//  TaskCalendarVCtrl.swift
//  TaskManagement
//
//  Created by ThanhTC on 9/13/24.
//

import UIKit
import FSCalendar

class TaskCalendarVCtrl: UIViewController,FSCalendarDataSource ,FSCalendarDelegate {

    @IBOutlet weak var calendarView: FSCalendar!
    var lstItem:[TaskModel] = []
    let dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.delegate = self
        calendarView.dataSource = self
        self.dateFormatter.dateStyle = .short        // Do any additional setup after loading the view.
        
    }

    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        
        let taskSelect = lstItem.filter { dateFormatter.date(from: $0.dueDate) == dateFormatter.date(from: dateFormatter.string(from: date)) }.first
        if (taskSelect != nil ){
            return taskSelect?.des
        }
        return ""
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
