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
    var model:TaskModel = TaskModel( taskID: "01", name: "Task 1",des: "",userID: "",userName:"", status: "", createDate: "", startDate: "", dueDate: "", hour: "16")
//    private var apiService : APIService
    private(set) var taskModel : TaskModel! {
        didSet {
            self.bindAddUpdateTaskViewModelToController()
        }
    }
    
    var bindAddUpdateTaskViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        
//        self.apiService =  APIService()
//        callFuncToAddUpdateTaskData()
    }
    
    func callFuncToAddUpdateTaskData() {
       model = TaskModel()
        taskModel = model
        self.saveData(model: self.taskModel)
    }
    func callFuncToDeleteTaskData() {
        taskModel = model
        self.deleteData(model: self.taskModel)
    }

    
    private func saveData(model:TaskModel) {
        let randomUUID = UUID()
        let randomInt = Int.random(in: 1..<4)
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
        data.des = "Thuc hien  1 du an ve quan ly Task"
        data.status = String(randomInt)
        data.createDate = dateFormatter.string(from: today)
        data.startDate = dateFormatter.string(from: today)
        data.dueDate = dateFormatter.string(from: today)
        data.hour = "16"
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
    private func updateObject(model:TaskModel) {
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

}
