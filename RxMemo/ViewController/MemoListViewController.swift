//
//  ViewController.swift
//  RxMemo
//
//  Created by 신의연 on 2022/08/25.
//

import UIKit
import RxSwift
import RxCocoa

class MemoListViewController: UIViewController, ViewModelBindableType {
    
    private let bag = DisposeBag()
    
    var viewModel: MemoListViewModel!
    
    private var memoListTableView: UITableView = {
        var tableView = UITableView()
        tableView.register(MemoListTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var addMemoButton: UIBarButtonItem = {
        var button = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        return button
    }()
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: bag)
        
        viewModel.memoList
            .bind(
                to: memoListTableView.rx.items(
                    cellIdentifier: "cell",
                    cellType: MemoListTableViewCell.self)
            ) { row, memo, cell in
                cell.fetchData(labelTitle: memo.content)
            }
            .disposed(by: bag)
        
        addMemoButton.rx.action = viewModel.makeCreateAction()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        self.navigationItem.rightBarButtonItem = addMemoButton
        self.view.backgroundColor = .systemBackground
        view.addSubview(memoListTableView)
        
        NSLayoutConstraint.activate([
            memoListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            memoListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            memoListTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            memoListTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    

}
