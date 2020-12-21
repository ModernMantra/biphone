//
//  CallHistoryViewModel.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 19/12/2020.
//

import Foundation

protocol CallHistoryDelegate {
    func dataUpdated()
}

public enum CallHistoryCellTypes: CellType {
    case main

    var cellClass: AnyClass {
        switch self {
        case .main:
            return PhoneCallTableViewCell.self
        }
    }
}

protocol CallHistoryViewModelInput {
    func loadItems()
}

protocol CallHistoryViewModelOutput {
    var screenTitle: String { get }
    var calls: [BaseCellModel<CallHistoryCellTypes>] { get }
    var delegate: CallHistoryDelegate? { get set }
}

typealias CallHistoryViewModel = CallHistoryViewModelInput & CallHistoryViewModelOutput

// MARK: - Default Implementation -

final class DefaultHistoryViewModel: CallHistoryViewModel {
    
    var calls: [BaseCellModel<CallHistoryCellTypes>] = [BaseCellModel<CallHistoryCellTypes>]()
    var screenTitle: String = "RECENT CALLS"
    var delegate: CallHistoryDelegate?
    
    init() {
        self.calls.removeAll()
    }
    
    func loadItems() {
        if let items = RealmDAO<CallHistoryItem>().load(), items.isEmpty == false {
            self.calls.removeAll()
            for item in items.sorted(by: { $0.date.timeIntervalSinceNow > $1.date.timeIntervalSinceNow }) {
                self.calls.append(BaseCellModel<CallHistoryCellTypes>(cellType: .main, cellData: item, cellHeight: 80))
            }
        }
        self.delegate?.dataUpdated()
    }
    
}
