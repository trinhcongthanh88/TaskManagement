//
//  TaskListTableCell.swift
//  TaskManagement
//
//  Created by ThanhTC on 9/10/24.
//

import UIKit
public protocol TaskListTableCellDelegate{
    func updateStatusCell(taskId:String ,status:String)
}
class TaskListTableCell: UITableViewCell {

    @IBOutlet weak var vContent: UIView!
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
//        delegate = self
        // Initialization code
        vContent.layer.cornerRadius = 10
        vContent.layer.borderWidth = 1
        vContent.layer.borderColor = UIColor .green.cgColor
        btnUpdateStatus.layer.cornerRadius = 5
        btnUpdateStatus.layer.borderWidth = 1
        btnUpdateStatus.layer.borderColor = UIColor.gray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(_data:TaskModel ){
        lbName.text = _data.name
        lbDes.text = _data.des
        btnUpdateStatus.isHidden = false
        btnUpdateStatus.accessibilityValue = _data.taskID
        btnUpdateStatus.accessibilityLabel = _data.status
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
            btnUpdateStatus.setTitle("Make In process", for: .normal)
            btnUpdateStatus.backgroundColor = UIColor.orange
            break
        case "2":
            lblStatus.text = "In process"
            lblStatus.textColor = UIColor.orange
            imgStatus.image = UIImage(named: "ic_status_inprocess")
            btnUpdateStatus.setTitle("Make Done", for: .normal)
            btnUpdateStatus.backgroundColor = UIColor.green
            break
        case "3":
            lblStatus.text = "Done"
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
        delegate?.updateStatusCell(taskId: sender.accessibilityValue!, status: sender.accessibilityLabel! == "1" ? "2" : "3")
    }
    
}
