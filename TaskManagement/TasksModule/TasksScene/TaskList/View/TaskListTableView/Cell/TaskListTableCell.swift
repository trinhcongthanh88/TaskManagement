//
//  TaskListTableCell.swift
//  TaskManagement
//
//  Created by ThanhTC on 9/10/24.
//

import UIKit

class TaskListTableCell: UITableViewCell {

    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lblCreateDate: UILabel!
    @IBOutlet weak var lblDueDate: UILabel!
    @IBOutlet weak var lblHour: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(_data:TaskModel ){
        lbName.text = _data.name
        updateStatus(status: _data.status)
        lblCreateDate.text = _data.startDate
        lblDueDate.text = _data.dueDate
        lblHour.text = _data.hour
        
    }
    func updateStatus(status:String){
        switch status {
        case "1":
            lblStatus.text = "New"
            lblStatus.textColor = UIColor.red
            imgStatus.image = UIImage(named: "ic_status_new")
            break
        case "2":
            lblStatus.text = "in process"
            lblStatus.textColor = UIColor.orange
            imgStatus.image = UIImage(named: "ic_status_inprocess")
            break
        case "3":
            lblStatus.text = "done"
            lblStatus.textColor = UIColor.green
            imgStatus.image = UIImage(named: "ic_status_done")
            break
        default:
            lblStatus.text = "N/a"
            lblStatus.textColor = UIColor.gray
            imgStatus.image = UIImage(named: "ic_status_")
        }
    }
    
    
}
