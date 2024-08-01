//
//  OperatorViewController.swift
//  RxStudy
//
//  Created by J Oh on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa

final class OperatorViewController: UIViewController {
    
    // VC가 잘 deinit 되도록
    var disposeBag = DisposeBag() // >>> self.dispose()
    let list = [1,2,3,4,5,6,7,8,9,10]   // 유한함 -> 완료가 명확
    
    deinit {
        print("deinit - OperatorViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "RxSwift"
        testIntervalObservable()
        testIntervalObservable2()
    }
}

// just, from, of, interval
// zip, combinelatest
extension OperatorViewController {
    
    private func testIntervalObservable2() {
        // 무한함. 다른 화면이 떠도 사라지지 않음
        
        Observable<Int>
            .interval(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe { value in
                print("Next(2) - \(value)")
            } onError: { error in
                print("Error(2): \(error)")
            } onCompleted: {
                print("Completed(2)!")
            } onDisposed: {
                print("Disposed(2)")
            }
            .disposed(by: disposeBag)
//            .dispose()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            // 한 번에 정리
            self.disposeBag = .init()
        }
    }
    
    private func testIntervalObservable() {
        // 무한함. 다른 화면이 떠도 사라지지 않음
        
        Observable<Int>
            .interval(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe { value in
                print("Next(1) - \(value)")
            } onError: { error in
                print("Error(1): \(error)")
            } onCompleted: {
                print("Completed(1)!")
            } onDisposed: {
                print("Disposed(1)")
            }
            .disposed(by: disposeBag)

    }
    
    private func testFromObservable() {
        Observable
            .from(list) // Next - 1, Next - 2, Next - 3, ..., Next - 10
            .subscribe { value in
                print("Next - \(value)")
            } onError: { error in
                print("Error: \(error)")
            } onCompleted: {
                print("Completed!")
            } onDisposed: {
                print("Disposed")
            }
            .disposed(by: disposeBag)
    }
    
    private func testOfObservable() {
        Observable  // stream
            .of(list) // Next - [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] 끝.
            .subscribe { value in
                print("Next - \(value)")
            } onError: { error in
                print("Error: \(error)")
            } onCompleted: {
                print("Completed!")
            } onDisposed: {
                print("Disposed")
            }
            .disposed(by: disposeBag)
    }
    
    private func testJustObservable() {
        Observable
            .just(list) // Next - [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] 끝.
            .subscribe { value in
                print("Next - \(value)")
            } onError: { error in
                print("Error: \(error)")
            } onCompleted: {
                print("Completed!")
            } onDisposed: {
                print("Disposed")
            }
            .disposed(by: disposeBag)
    }
    
    private func testTake() {
        // 이벤트 무한 전달
        Observable
            .repeatElement("Jack")
            .take(10) // 10번
            .subscribe { value in
                print("next: \(value)")
            } onError: { error in
                print("weweoe")
            } onCompleted: {
                print("completed")
            } onDisposed: {
                print("Disposed")
            }
            .disposed(by: disposeBag)
        
    }
    
}
