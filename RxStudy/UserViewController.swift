//
//  UserViewController.swift
//  RxStudy
//
//  Created by J Oh on 7/31/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class UserViewController: UIViewController {
    
    private let nicknameField = UITextField()
    private let checkButton = UIButton()
    private var disposeBag = DisposeBag()
    
    // 이벤트를 보내는 역할
    // 전달과 처리를 동시에 할 수 있는 Subject
    private var sampleNickname = BehaviorSubject(value: "고래밥")
    private var behavior = BehaviorSubject(value: 300) // 초기값 O
    private var publish = PublishSubject<Int>() // 초기값 X
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
//        testBehaviorSubject()
        testPublishSubject()
        sampleNickname
            .bind(with: self) { owner, value in
                owner.nicknameField.text = value
            }
            .disposed(by: disposeBag)
        
        checkButton.rx.tap
            .bind(with: self) { owner, _ in
                // =로 값을 바꾸지 않음
//                owner.sampleNickname.on(.next("칙촉"))
                owner.sampleNickname.onNext("칙촉 - \(Int.random(in: 1...100))")
            }
            .disposed(by: disposeBag)
        
//        sampleNickname
//            .bind(to: nicknameField.rx.text)
//            .disposed(by: disposeBag)
        
    }
    
}

// Subject
extension UserViewController {
    
    private func testPublishSubject() {
        publish.onNext(1)
        publish.onNext(2)
        publish.onNext(3)
        
        publish
            .subscribe { value in
                print("publish next: \(value)")
            } onError: { error in
                print("publish error")
            } onCompleted: {
                print("publish completed")
            } onDisposed: {
                print("publish disposed")
            }
            .disposed(by: disposeBag)

        publish.onNext(4)
        publish.onCompleted() // 끝남 
        publish.onNext(5)
        publish.onNext(6)
        
//        publish next: 4
//        publish next: 5
//        publish next: 6
    }
    
    private func testBehaviorSubject() {
        
        behavior.onNext(1)
        behavior.onNext(2)
        behavior.onNext(3)
        
        behavior
            .subscribe { value in
                print("behavior next: \(value)")
            } onError: { error in
                print("behavior error")
            } onCompleted: {
                print("behavior completed")
            } onDisposed: {
                print("behavior disposed")
            }
            .disposed(by: disposeBag)

        behavior.onNext(4)
        behavior.onNext(5)
        behavior.onNext(6)
        
//        behavior next: 3
//        behavior next: 4
//        behavior next: 5
//        behavior next: 6
        
    }
}

extension UserViewController {
    private func configureView() {
        view.backgroundColor = .white
        
        view.addSubview(nicknameField)
        view.addSubview(checkButton)
        
        nicknameField.backgroundColor = .systemMint
        nicknameField.placeholder = "닉네임 입력해"
        nicknameField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
        
        checkButton.setTitle("체크", for: .normal)
        checkButton.backgroundColor = .systemBrown
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(nicknameField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
    }
}
