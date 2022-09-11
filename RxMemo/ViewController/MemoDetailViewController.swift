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
    
    private var contentTableView: UITableView = {
        var tableView = UITableView()
        tableView.register(MemoContentTableViewCell.self, forCellReuseIdentifier: "contentCell")
        tableView.register(MemoDateTableViewCell.self, forCellReuseIdentifier: "dateCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
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
        
        viewModel.contents
            .bind(to: contentTableView.rx.items) { tableView, row, value in
                switch row {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell") as! MemoListTableViewCell
                    cell.fetchData(labelTitle: value)
                    return cell
                case 1:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell") as! MemoDateTableViewCell
                    cell.fetchData(labelTitle: value)
                    return cell
                default:
                    fatalError()
                }
            }
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "메모 보기"
    }

}
