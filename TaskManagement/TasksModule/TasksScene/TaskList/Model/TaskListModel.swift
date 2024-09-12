//
//  TaskListModel.swift
//  TaskManagement
//
//  Created by ThanhTC on 9/10/24.
//

import Foundation
import RealmSwift
class TaskListData {
    var data:[TaskModel] = []
    convenience init(data: [TaskModel]) {
        self.init()
        self.data = data
    }
    
}


class TaskModel:Object {
    @objc dynamic var taskID:String = ""
    @objc dynamic var name:String = ""
    @objc dynamic var des:String = ""
    @objc dynamic var userID:String = ""
    @objc dynamic var userName:String = ""
    @objc dynamic var status:String = ""
    @objc dynamic var createDate:String = ""
    @objc dynamic var startDate:String = ""
    @objc dynamic var dueDate:String = ""
    @objc dynamic var hour:String = ""
    convenience init(taskID: String, name: String, des: String, userID: String, userName: String, status: String, createDate: String,startDate: String, dueDate: String, hour: String) {
        self.init()
        self.taskID = taskID
        self.name = name
        self.des = des
        self.userID = userID
        self.userName = userName
        self.status = status
        self.createDate = createDate
        self.startDate = startDate
        self.dueDate = dueDate
        self.hour = hour
    }
    convenience required init() {
        self.init()
    }
    
//    required convenience init() {
//        self.init()
//        //fatalError("init() has not been implemented")
//    }
    //    enum CodingKeys: CodingKey {
//        case id
//        case name
//        case des
//        case userID
//        case userName
//        case status
//        case createDate
//        case dueDate
//        case hour
//    }
////
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.des = try container.decode(String.self, forKey: .des)
//        self.userID = try container.decode(String.self, forKey: .userID)
//        self.userName = try container.decode(String.self, forKey: .userName)
//        self.status = try container.decode(String.self, forKey: .status)
//        self.createDate = try container.decode(String.self, forKey: .createDate)
//        self.dueDate = try container.decode(String.self, forKey: .dueDate)
//        self.hour = try container.decode(String.self, forKey: .hour)
//    }
    
    // Generate a random UUID
//    let randomUUID = UUID()
//
//    // Get UUID as string
//    let uuidString = randomUUID.uuidString
//
//    print("Random UUID: (randomUUID)")
//    print("UUID String: (uuidString)")
}
