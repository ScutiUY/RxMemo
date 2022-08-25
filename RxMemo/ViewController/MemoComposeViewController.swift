//
//  MemoComposeViewController.swift
//  RxMemo
//
//  Created by 신의연 on 2022/08/25.
//

import UIKit

class MemoComposeViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MemoComposeViewModel!
    
    func bindViewModel() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "새 메모"
        // Do any additional setup after loading the view.
    }
    
}
