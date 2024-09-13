//
//  AddUpdateTaskViewModel.swift
//  TaskManagement
//
//  Created by ThanhTC on 9/11/24.
//

import Foundation
import RealmSwift
class AddUpdateTaskViewModel : NSObject {
    let realm = try! Realm()
    var model:TaskModel!
//    private var apiService : APIService
//    private(set) var taskModel : TaskModel! {
//        didSet {
//            self.bindAddUpdateTaskViewModelToController()
//        }
//    }
    
    var bindAddUpdateTaskViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        
//        self.apiService =  APIService()
//        callFuncToAddUpdateTaskData()
    }
    
    func callFuncToAddTaskData() {
       model = TaskModel()
//        taskModel = model
        self.saveData(model: self.model)
    }
    func callFuncToDeleteTaskData() {
//        taskModel = model
        self.deleteData(model: self.model)
    }
    func callFuncToUpdateStatusTaskData(taskId:String ,status:String) {
        self.updateTaskStats(taskId: taskId, status: status)
    }
    
    func callFuncToUpdateTaskData(model:TaskModel) {
        self.updateData(model: model)
    }
    func callFuncToAddNewTaskData(model:TaskModel) {
        self.saveData(model: model)
    }
    
    private func saveData(model:TaskModel) {
        let randomUUID = UUID()
        let randomInt = Int.random(in: 1..<5)
        // Get UUID as string
        let uuidString = randomUUID.uuidString
//        let today = Date.now
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        var data = TaskModel()
        data = model
        data.taskID = uuidString
        data.name = data.taskID
//        data.des = "Thuc hien  1 du an ve quan ly Task"
//        data.status = String(randomInt)
//        data.createDate = dateFormatter.string(from: today)
//        data.startDate = dateFormatter.string(from: today)
//        data.dueDate = dateFormatter.string(from: today)
//        data.hour = "16"
            try! realm.write {
                realm.add(data)
            }
        }
    
    private func deleteData(model:TaskModel) {
//        "taskID = %@ AND name = %@ "
        let dataFilters = realm.objects(TaskModel.self).filter("taskID = %@", model.taskID)
            try! realm.write {
                realm.delete(dataFilters)
            }
        }
    
    private func updateData(model:TaskModel) {
            let dataFilter =  realm.objects(TaskModel.self).filter("taskID = %@", model.taskID, model.name).toArray(ofType: TaskModel.self).first
            if let dataFilter = dataFilter {
                try! realm.write {
                    dataFilter.name =  model.name
                    dataFilter.des =  model.des
                    dataFilter.status =  model.status
                    dataFilter.startDate =  model.startDate
                    dataFilter.dueDate =  model.dueDate
                    dataFilter.hour =  model.hour
                }
            }
        }
    private func updateTaskStats(taskId:String ,status:String) {
            let dataFilter =  realm.objects(TaskModel.self).filter("taskID = %@", taskId).toArray(ofType: TaskModel.self).first
            if let dataFilter = dataFilter {
                try! realm.write {
                    dataFilter.status =  status
                }
            }
        }

}
