//
//  TableViewSource.swift
//  TaskManagement
//
//  Created by ThanhTC on 9/10/24.


import Foundation
import UIKit

open class TableViewSource<T: UITableViewCell, P: Any>: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var className: String {
        return String(describing: T.self)
    }
    public var cellID: String = ""
    public var delegate: TableViewDelegate?
    public var lstItem: [P] = []
    public var tbv: UITableView!
    public var bundle: Bundle!
    
    public var cellDequeue: T {
        return (tbv.dequeueReusableCell(withIdentifier: cellID) as? T) ?? T()
    }
    
    public init(tbv: UITableView, lstItem: [P] = []) {
        super.init()
        bundle = Bundle(for: T.self)
        cellID = className + "ID"
        tbv.register(UINib(nibName: className, bundle: bundle), forCellReuseIdentifier: cellID)
        tbv.dataSource = self
        tbv.delegate = self
        
        self.tbv = tbv
        self.lstItem = lstItem
    }
    
   open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstItem.count
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellDequeue
    }
    
   open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    open func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    open func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    open func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return []
    }
    
    open func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle != .delete {
//            return
//        }
//
//        delegate?.tbv?(tableView: tableView, didDeleteRowAtIndexpath: indexPath)
    }
    open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight <= 0 ? tableView.rowHeight : tableView.estimatedRowHeight
    }
}

@objc
public protocol TableViewDelegate {
    @objc optional func tbv(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    @objc optional func tbv(tableView: UITableView, didDeleteRowAtIndexpath indexPath: IndexPath)
    @objc optional func tbv(tableView: UITableView, didScroll scv: UIScrollView)
    @objc optional func accessorrySelected(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: IndexPath)
    @objc optional func scrollViewDidEndDragging(scv: UIScrollView, willDecelerate decelerate: Bool)
}
