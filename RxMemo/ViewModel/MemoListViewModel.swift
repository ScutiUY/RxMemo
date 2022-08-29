//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by 신의연 on 2022/08/25.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.memoList() // CommonViewModel의 storage 프로퍼티
    }
}
