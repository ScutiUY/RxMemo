//
//  Scene.swift
//  RxMemo
//
//  Created by 신의연 on 2022/08/25.
//

import UIKit

enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

extension Scene {
    func instatiate() -> UIViewController {
        switch self {
        case .list(let memoListViewModel):
            var listVC = MemoListViewController()
            let nav = UINavigationController(rootViewController: listVC)
            listVC.bind(viewModel: memoListViewModel)
            
            return nav
            
        case .detail(let memoDetailViewModel):
            var detailVC = MemoDetailViewController()
            detailVC.bind(viewModel: memoDetailViewModel)
            
            return detailVC
            
        case .compose(let memoComposeViewModel):
            var composeVC = MemoComposeViewController()
            composeVC.bind(viewModel: memoComposeViewModel)
            
            return composeVC
        }
    }
    
}

