//
//  CellType.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 21/12/2020.
//

import Foundation

protocol CellType: CaseIterable {

    /// Defines the UITableViewCell or UICollectionViewCell which corresponds to each cell type
    var cellClass: AnyClass { get }

}

/// Defines the behavior and properties for each cell model
protocol CellModel {

    associatedtype TypeOfCell = CellType

    /// Type of cell which conforms to protocol ```CellType```
    var cellType: TypeOfCell { get set }

    /// Data to be used within the cell
    var cellData: Any? { get set }

    /// Height of the cell
    var cellHeight: CGFloat? { get set }

}

// MARK: - Default Implementation -

struct BaseCellModel<T: CellType>: CellModel {

    var cellType: T

    var cellData: Any?

    var cellHeight: CGFloat?

    init(cellType: T, cellData: Any? = nil, cellHeight: CGFloat?) {
        self.cellType = cellType
        self.cellData = cellData
        self.cellHeight = cellHeight
    }

}
