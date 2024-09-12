//
//  TaskListTableSource.swift
//  TaskManagement
//
//  Created by ThanhTC on 9/10/24.
//

import UIKit

class TaskListTableSource: TableViewSource<TaskListTableCell,TaskModel> {
    var delegateCell:TaskListTableCellDelegate?
    override init(tbv: UITableView, lstItem: [TaskModel]) {
        super.init(tbv: tbv,lstItem: lstItem)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  lstItem.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellDequeue
        let data = lstItem[indexPath.row]
        cell.updateCell(_data: data)
        cell.delegate = delegateCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.tbv!(tableView: tbv, didSelectRowAtIndexPath: indexPath)
    }

}
