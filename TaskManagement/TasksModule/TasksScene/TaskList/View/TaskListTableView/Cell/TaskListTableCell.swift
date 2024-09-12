//
//  TaskListTableCell.swift
//  TaskManagement
//
//  Created by ThanhTC on 9/10/24.
//

import UIKit
public protocol TaskListTableCellDelegate{
    func updateStatus(status:String)
}
class TaskListTableCell: UITableViewCell,TaskListTableCellDelegate {

    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDes: UILabel!
    @IBOutlet weak var lblCreateDate: UILabel!
    @IBOutlet weak var lblDueDate: UILabel!
    @IBOutlet weak var lblHour: UILabel!
    var delegate:TaskListTableCellDelegate?
    
    @IBOutlet weak var btnUpdateStatus: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(_data:TaskModel ){
        lbName.text = _data.name
        lbDes.text = _data.des
        btnUpdateStatus.isHidden = false
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
            btnUpdateStatus.isHidden = true
            break
        default:
            lblStatus.text = "N/a"
            lblStatus.textColor = UIColor.gray
            imgStatus.image = UIImage(named: "ic_status_")
        }
    }
    
    @IBAction func updateStatus_Touchup(_ sender: UIButton) {
        delegate?.updateStatus(status: "3")
    }
    
}
