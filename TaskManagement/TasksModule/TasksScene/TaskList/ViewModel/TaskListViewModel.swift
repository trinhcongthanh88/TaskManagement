//
//  TaskListViewModel.swift
//  TaskManagement
//
//  Created by ThanhTC on 9/10/24.
//

import Foundation
import RealmSwift
class TaskListViewModel : NSObject {
    
    var model:TaskModel = TaskModel( taskID: "01", name: "Task 1",des: "",userID: "",userName:"", status: "", createDate: "", startDate: "", dueDate: "", hour: "16")
//    private var apiService : APIService!
    private(set) var taskListData : TaskListData! {
        didSet {
            self.bindTaskLisViewModelToController()
        }
    }
    
    var bindTaskLisViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
//        self.apiService =  APIService()
//        callFuncToGetTaskListData()
    }
    
    func callFuncToGetTaskListData() {
        let realm = try! Realm()
        let list = realm.objects(TaskModel.self).toArray(ofType: TaskModel.self)
//        let lstItem:[TaskModel] = [model,model,model,model,model]
//        let listData:TaskListData = TaskListData(data: lstItem)
//        for item in lstItem {
//            listData.data.append(item)
//        }
        self.taskListData = TaskListData(data: list)
//        self.apiService.apiToGetEmployeeData { (empData) in
//            self.empData = empData
//        }
    }
}

