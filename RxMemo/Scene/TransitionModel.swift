//
//  TransitionModel.swift
//  RxMemo
//
//  Created by 신의연 on 2022/08/25.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
