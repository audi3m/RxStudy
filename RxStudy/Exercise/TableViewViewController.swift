//
//  TableViewViewController.swift
//  RxStudy
//
//  Created by J Oh on 7/30/24.
//

import UIKit
import RxSwift
//import RxCocoa
import SnapKit

final class TableViewViewController: UIViewController {
    
    private let tableView = UITableView()
    private let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "TableView"
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        let items = Observable.just((0..<20).map { "Item\($0)" })
        
        items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { row, element, cell in
                cell.textLabel?.text = "\(element) at row \(row)"
            }
            .disposed(by: dispose)
        
        tableView.rx
            .modelSelected(String.self)
            .subscribe { value in
                let alert = UIAlertController(title: "셀 \(value) 누름", message: nil, preferredStyle: .alert)
                let confirm = UIAlertAction(title: "확인", style: .default)
                alert.addAction(confirm)
                self.present(alert, animated: true)
            }
            .disposed(by: dispose)
    }
}
