//
//  CallHistoryViewController.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 19/12/2020.
//

import UIKit

class CallHistoryViewController: BaseViewController {
    
    // MARK: - Outlets -
    
    @IBOutlet var tableView: UITableView! {
        didSet { self.setupTableView() }
    }
    
    // MARK: - Properties -
    
    fileprivate var viewModel: CallHistoryViewModel = DefaultHistoryViewModel()
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.screenTitle = self.viewModel.screenTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.loadItems()
    }

}

// MARK: - Util -

fileprivate extension CallHistoryViewController {
    func setupTableView() {
        _ = CallHistoryCellTypes.allCases.map({ self.tableView.register($0.cellClass) })
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

// MARK: - Table View Delegate -

extension CallHistoryViewController: UITableViewDelegate {
    
}

// MARK: - Call History Delegate -

extension CallHistoryViewController: CallHistoryDelegate {
    func dataUpdated() {
        self.tableView.reloadOnMainQueue()
    }
}

// MARK: - Table View Data Source -

extension CallHistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel.calls[indexPath.row].cellHeight ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.calls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.viewModel.calls[indexPath.row]
        return tableView.dequeueReusableCell(of: PhoneCallTableViewCell.self, for: indexPath, configure: { configurableCell in
            if let cellModel = model.cellData as? CallHistoryItem {
                configurableCell.initCell(with: cellModel)
            }
        })
    }

}
