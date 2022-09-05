//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by 신의연 on 2022/08/25.
//

import UIKit
import RxSwift
import RxCocoa

class MemoDetailViewController: UIViewController, ViewModelBindableType {
    
    private let disposeBag = DisposeBag()
    
    var viewModel: MemoDetailViewModel!
    
    private var memoListTableView: UITableView = {
        var tableView = UITableView()
        tableView.register(MemoListTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var bottomToolbar: UIToolbar = {
        var toolBar = UIToolbar()
        return toolBar
    }()
    
    private var deleteButton: UIBarButtonItem = {
        var deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: nil, action: nil)
        return deleteButton
    }()
    
    private var composeButton: UIBarButtonItem = {
        var composeButton = UIBarButtonItem(barButtonSystemItem: .compose, target: nil, action: nil)
        return composeButton
    }()
    
    private var shareButton: UIBarButtonItem = {
        var shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
        return shareButton
    }()
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: disposeBag)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "메모 보기"
        // Do any additional setup after loading the view.
    }

}
