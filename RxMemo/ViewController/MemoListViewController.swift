//
//  ViewController.swift
//  RxMemo
//
//  Created by 신의연 on 2022/08/25.
//

import UIKit

class MemoListViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MemoListViewModel!
    
    func bindViewModel() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MemoList"
        self.view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }

}
