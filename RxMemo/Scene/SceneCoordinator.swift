//
//  SceneCoordinator.swift
//  RxMemo
//
//  Created by 신의연 on 2022/08/25.
//

import Foundation
import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinatorType {
    
    private let bag = DisposeBag()
    
    private var window: UIWindow
    private var currentVC: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        currentVC = window.rootViewController!
    }
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
        let subject = PublishSubject<Never>()
        
        let target = scene.instatiate()
        
        switch style {
        case .root:
            
            currentVC = target
            window.rootViewController = target
            
            subject.onCompleted()
            
        case .push:
            
            if let newNav = currentVC as? UINavigationController {
                
                newNav.pushViewController(target, animated: animated)
                currentVC = target
            } else {
                guard let nav = currentVC.navigationController else {
                    subject.onError(TransitionError.navigationControllerMissing)
                    break
                }
                nav.pushViewController(target, animated: animated)
                currentVC = target

            }
            
            subject.onCompleted()
            
        case .modal:
            
            currentVC.present(target, animated: animated) {
                subject.onCompleted()
            }
            
            currentVC = target
        }
        
        return subject.asCompletable()
    }
    
    @discardableResult
    func close(animated: Bool) -> Completable {
        return Completable.create { [unowned self] completable in
            
            if let presentingVC = self.currentVC.presentingViewController {
                self.currentVC.dismiss(animated: animated) {
                    self.currentVC = presentingVC
                    completable(.completed)
                }
            } else if let nav = self.currentVC.navigationController {
                guard nav.popViewController(animated: animated) != nil else {
                    completable(.error(TransitionError.cannotPop))
                    return Disposables.create()
                }
                self.currentVC = nav.viewControllers.last!
                completable(.completed)
            } else {
                completable(.error(TransitionError.unknown))
            }
            
            return Disposables.create()
        }
    }
    
    
}
