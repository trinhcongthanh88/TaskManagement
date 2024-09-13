//
//  TaskListVCtrl.swift
//  TaskManagement
//
//  Created by ThanhTC on 9/9/24.
//

import UIKit

class TaskListVCtrl: UIViewController {
    
    @IBOutlet weak var tblTaskList: UITableView!
    var lstItem:[TaskModel] = []
    var taskListSource:TaskListTableSource!
    var taskList:TaskListViewModel!
    var addUpdate:AddUpdateTaskViewModel!
    
    func callToViewModelForUIUpdate(){
        self.taskList =  TaskListViewModel()
        self.updateDataSource()
    }
    
    func getData() {
        // Do any additional setup after loading the view.
        taskList.callFuncToGetTaskListData()
        lstItem = taskList.taskListData.data
        taskListSource.lstItem = lstItem
        UIView.transition(with: tblTaskList,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.tblTaskList.reloadData() })
            
    }
    
    fileprivate func updateDataSource() {
        taskListSource =  TaskListTableSource(tbv: tblTaskList, lstItem: lstItem)
        taskListSource.delegate = self
        taskListSource.delegateCell = self
        getData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Base.navCtrl?.navigationBar.topItem?.title = "List Task"
        addUpdate = AddUpdateTaskViewModel()
        self.callToViewModelForUIUpdate()
    }


    @IBAction func btnViewDetail(_ sender: Any) {
        let detailVCtrl:AddUpdateTaskVCtrl = AddUpdateTaskVCtrl()
        detailVCtrl.addUpdate = self.addUpdate
        detailVCtrl.action = 1
        detailVCtrl.addUpdateTaskDelegate = self
        Base.navCtrl?.pushViewController(detailVCtrl, animated: true)
       
        
    }
    @IBAction func viewCalendarTouchup(_ sender: UIButton) {
        let calendarVCtrl:TaskCalendarVCtrl = TaskCalendarVCtrl()
        calendarVCtrl.lstItem = self.lstItem
        Base.navCtrl?.pushViewController(calendarVCtrl, animated: true)
    }
    @IBAction func btnAddnew(_ sender: UIButton) {
//        Base.navCtrl?.pushViewController(AddUpdateTaskVCtrl(), animated: true)
//        addUpdate.callFuncToAddTaskData()
        let detailVCtrl:AddUpdateTaskVCtrl = AddUpdateTaskVCtrl()
        detailVCtrl.addUpdate = self.addUpdate
        detailVCtrl.action = 0
        detailVCtrl.addUpdateTaskDelegate = self
        Base.navCtrl?.pushViewController(detailVCtrl, animated: true)
//        reloadStaskData()
    }
    @IBAction func btnDeleta(_ sender: UIButton) {
//        Base.navCtrl?.pushViewController(AddUpdateTaskVCtrl(), animated: true)
        addUpdate.callFuncToDeleteTaskData()
        reloadStaskData()
    }
    /*
    // MARK: - Navigation
     
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func reloadStaskData() {
        getData()
        taskListSource.lstItem = lstItem
        UIView.transition(with: tblTaskList,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.tblTaskList.reloadData() })
    }

}
extension TaskListVCtrl:TaskListTableCellDelegate{
    
    
    func updateStatusCell(taskId: String, status: String) {
        addUpdate = AddUpdateTaskViewModel()
        addUpdate.callFuncToUpdateStatusTaskData(taskId: taskId, status: status)
        reloadStaskData()
    }
    
}
extension TaskListVCtrl:TableViewDelegate{
    func tbv(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        let data = lstItem[indexPath.row]
//        modelSelect = data
//        addUpdate = AddUpdateTaskViewModel()
        addUpdate.model = data
//        showTaskDetail(task: data)
    }

    func showTaskDetail(task:TaskModel? = nil){
        let vctrl = TaskDetailVCtrl()//ConstructorDetailVCtrl(data:data)
        Base.navCtrl?.pushViewController(vctrl, animated: true)
    }
}
extension TaskListVCtrl:AddUpdateTasDelegate{
    func updateTaskComplete() {
        reloadStaskData()
    }
    
    
}
