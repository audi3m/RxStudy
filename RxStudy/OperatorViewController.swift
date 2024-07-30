//
//  OperatorViewController.swift
//  RxStudy
//
//  Created by J Oh on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class OperatorViewController: UIViewController {
    
    let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        // just, from, of, interval
        // zip, combinelatest
        
        // 이벤트 무한 전달
        Observable
            .repeatElement("Jack")
            .take(10)
            .subscribe { value in
                print("next: \(value)")
            } onError: { error in
                print("weweoe")
            } onCompleted: {
                print("completed")
            } onDisposed: {
                print("disposed")
            }
            .disposed(by: dispose)
        
        }
    
}
