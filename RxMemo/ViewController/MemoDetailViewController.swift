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
    
    var disposeBag = DisposeBag()
    
    var viewModel: MemoDetailViewModel!
    
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
