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
        self.taskList.bindTaskLisViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func getData() {
        // Do any additional setup after loading the view.
        taskList.callFuncToGetTaskListData()
        lstItem = taskList.taskListData.data
        DispatchQueue.main.async {
            self.tblTaskList.reloadData()
        }
    }
    
    fileprivate func updateDataSource() {
        taskListSource =  TaskListTableSource(tbv: tblTaskList, lstItem: lstItem)
        taskListSource.delegate = self
        getData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Base.navCtrl?.navigationBar.topItem?.title = "List Task"
        self.callToViewModelForUIUpdate()
    }


    @IBAction func btnViewDetail(_ sender: Any) {
        
//        Base.navCtrl?.pushViewController(TaskDetailVCtrl(), animated: true)
        addUpdate.callFuncToDeleteTaskData()
        getData()
        taskListSource.lstItem = lstItem
        tblTaskList.reloadData()
    }
    @IBAction func btnAddnew(_ sender: UIButton) {
//        Base.navCtrl?.pushViewController(AddUpdateTaskVCtrl(), animated: true)
        addUpdate.callFuncToAddUpdateTaskData()
        getData()
        taskListSource.lstItem = lstItem
        tblTaskList.reloadData()
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
extension TaskListVCtrl:TableViewDelegate{
    func tbv(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        let data = lstItem[indexPath.row]
        addUpdate.model = data
//        showTaskDetail(task: data)
    }

    func showTaskDetail(task:TaskModel? = nil){
        let vctrl = TaskDetailVCtrl()//ConstructorDetailVCtrl(data:data)
        Base.navCtrl?.pushViewController(vctrl, animated: true)
    }
}
