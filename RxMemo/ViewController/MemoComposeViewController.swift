//
//  MemoComposeViewController.swift
//  RxMemo
//
//  Created by 신의연 on 2022/08/25.
//

import UIKit
import RxSwift
import RxCocoa
import Action

class MemoComposeViewController: UIViewController, ViewModelBindableType {
    
    let disposeBag = DisposeBag()
    
    var viewModel: MemoComposeViewModel!
    
    private var cancelButton: UIBarButtonItem = {
        var button = UIBarButtonItem(barButtonSystemItem: .cancel, target: MemoComposeViewController.self, action: nil)
        return button
    }()
    
    private var saveButton: UIBarButtonItem = {
        var button = UIBarButtonItem(barButtonSystemItem: .save, target: MemoComposeViewController.self, action: nil)
        return button
    }()

    private var memoTextView: UITextView = {
        var textView = UITextView()
        
        return textView
    }()
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        viewModel.initialText
            .drive(memoTextView.rx.text)
            .disposed(by: disposeBag)
        
        cancelButton.rx.action = viewModel.cancelAction
        
        saveButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .withLatestFrom(memoTextView.rx.text.orEmpty)
            .bind(to: viewModel.saveAction.inputs)
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memoTextView.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if memoTextView.isFirstResponder {
            memoTextView.resignFirstResponder()
        }
    }
    
    private func setLayout() {
        
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = saveButton
        
        memoTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(memoTextView)
        
        NSLayoutConstraint.activate([
            memoTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            memoTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            memoTextView.widthAnchor.constraint(equalTo: view.widthAnchor),
            memoTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
