//
//  UITableView+Extension.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 21/12/2020.
//

import UIKit

extension UITableView {
    
    public func reloadOnMainQueue() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }

    /// Will create Nib from given cell class and then will register on table view.
    ///
    /// - Parameter cell: cell name
    public func register(_ cell: AnyClass) {
        let cellClassName = String(describing: cell)
        let tableViewCell = UINib(nibName: cellClassName, bundle: nil)
        self.register(tableViewCell, forCellReuseIdentifier: cellClassName)
    }

    /// Newer version of function to deque cell. Namely, It uses generics,
    /// takes as an argument a class of a cell, an indexPath and a configure closure
    /// to which a cell of desired type (i.e. of CellClass.Type) is passed. No more guard usage :)
    ///
    /// - Returns: return dequed table view cell
    public func dequeueReusableCell<CellClass: UITableViewCell>(of class: CellClass.Type, for indexPath: IndexPath, configure: ((CellClass) -> Void) = { _ in }) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: CellClass.identifier, for: indexPath)

        if let typedCell = cell as? CellClass {
            configure(typedCell)
        }

        return cell
    }
    
}
