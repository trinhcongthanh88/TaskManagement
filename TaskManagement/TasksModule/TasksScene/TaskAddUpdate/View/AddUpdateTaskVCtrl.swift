//
//  AddUpdateTaskVCtrl.swift
//  TaskManagement
//
//  Created by ThanhTC on 9/9/24.
//

import UIKit

protocol AddUpdateTasDelegate {
    func updateTaskComplete()
    
}
class AddUpdateTaskVCtrl: UIViewController {
    @IBOutlet weak var txtDes: UITextField!
    @IBOutlet weak var pickerStartDate: UIDatePicker!
    @IBOutlet weak var pickerDueDate: UIDatePicker!
    @IBOutlet weak var btnAddUpdate: UIButton!
    let dateFormatter = DateFormatter()
    var addUpdate:AddUpdateTaskViewModel!
    var addUpdateTaskDelegate:AddUpdateTasDelegate!
    var action:Int = 1 // 1 Update 0 add new
    fileprivate func bindingData() {
        // Do any additional setup after loading the view.
        self.txtDes.text = self.addUpdate.model.des
        self.pickerStartDate.date = dateFormatter.date(from:self.addUpdate.model.startDate) ?? Date()
        self.pickerDueDate.date = dateFormatter.date(from:self.addUpdate.model.dueDate) ?? Date()
        self.btnAddUpdate.setTitle("Update", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Base.navCtrl?.topViewController?.title = action == 1 ? "Update Info task" : "Add task"
        self.btnAddUpdate.setTitle("Add new", for: .normal)
        self.dateFormatter.dateStyle = .short
        self.pickerStartDate.date = Date()
        self.pickerDueDate.date = Date()
        if (action == 1){
            bindingData()
        }
        
    }
    
    @IBAction func btnUpdateTouchup(_ sender: Any) {
        switch self.action {
        case 1:
            let model  = TaskModel()
            model.taskID = self.addUpdate.model.taskID
            model.name = self.addUpdate.model.name
            model.userName = self.addUpdate.model.userName
            model.des = self.txtDes.text ?? ""
            model.startDate = dateFormatter.string(from: self.pickerStartDate.date)
            model.dueDate = dateFormatter.string(from: self.pickerDueDate.date)
            model.hour = "8"
            model.status = self.addUpdate.model.status
            self.addUpdate.callFuncToUpdateTaskData(model: model)
            addUpdateTaskDelegate.updateTaskComplete()
            Base.navCtrl?.popViewController(animated: true)
            break
        case 0:
           
            let model  = TaskModel()
            model.taskID = ""
            model.name = "admin"
            model.userID = "admin"
            model.userName = ""
            model.des = self.txtDes.text ?? ""
            model.startDate = dateFormatter.string(from: self.pickerStartDate.date)
            model.dueDate = dateFormatter.string(from: self.pickerDueDate.date)
            model.hour = "8"
            model.status = "1"
            self.addUpdate.callFuncToAddNewTaskData(model: model)
            addUpdateTaskDelegate.updateTaskComplete()
            Base.navCtrl?.popViewController(animated: true)
            break
        default:
            break
        }
        
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
