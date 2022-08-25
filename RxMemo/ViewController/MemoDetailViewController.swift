//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by 신의연 on 2022/08/25.
//

import UIKit

class MemoDetailViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MemoDetailViewModel!
    
    func bindViewModel() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "메모 보기"
        // Do any additional setup after loading the view.
    }

}
