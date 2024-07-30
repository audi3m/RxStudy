//
//  BasicButtonViewController.swift
//  RxStudy
//
//  Created by J Oh on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class BasicButtonViewController: UIViewController {
    
    private let label = UILabel()
    private let button = UIButton()
    
    private let textField = UITextField()
    private let secondLabel = UILabel()
    
    private let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
//        firstExample()
        secondExample()
    }
    
    private func configureView() {
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(textField)
        view.addSubview(secondLabel)
        
        label.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(100)
        }
        
        textField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(label.snp.bottom).offset(50)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(textField.snp.bottom).offset(20)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.size.equalTo(50)
        }
        
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        
        textField.backgroundColor = .lightGray
        
        secondLabel.backgroundColor = .lightGray
        
        button.backgroundColor = .systemBlue
    }
    
    private func secondExample() {
        button.rx.tap
            .map { "두 번째 버튼을 클릭했어요" }
            .bind(to: secondLabel.rx.text, textField.rx.text)
            .disposed(by: dispose)
    }
    
    private func firstExample() {
        // 1. UI
//        button.rx.tap
//            .subscribe { _ in
//                self.label.text = "버튼을 클릭했어요"
//                print("next")
//            } onError: { error in
//                print(error)
//            } onCompleted: {
//                print("completed")
//            } onDisposed: {
//                print("disposed")
//            }
//            .disposed(by: dispose)
        
        // 2. infinite 한 이벤트느노 생략
//        button.rx.tap
//            .subscribe { _ in
//                self.label.text = "버튼을 클릭했어요"
//                print("next")
//            } onDisposed: {
//                print("disposed")
//            }
//            .disposed(by: dispose)
        
        // 3. leak
//        button.rx.tap
//            .subscribe { [weak self] _ in
//                self?.label.text = "버튼을 클릭했어요"
//                print("next")
//            } onDisposed: {
//                print("disposed")
//            }
//            .disposed(by: dispose)
        
        // 4.
//        button.rx.tap
//            .withUnretained(self) // weak self
//            .subscribe { _ in
//                self.label.text = "버튼을 클릭했어요"
//                print("next")
//            } onDisposed: {
//                print("disposed")
//            }
//            .disposed(by: dispose)
        
        // 5.
//        button.rx.tap
//            .subscribe(with: self, onNext: { owner, _ in
//                self.label.text = "버튼이 클릭됐어요"
//            }, onDisposed: { owner in
//
//            })
//            .disposed(by: dispose)
        
        // 6. uikit
        // subscribe: 백그라운드에서도 동작됨. 쓰레드 상관 없음
        // 보라색 오류 뜰 수 있음
//        button.rx.tap
//            .subscribe(with: self, onNext: { owner, _ in
//                DispatchQueue.main.async {
//                    owner.label.text = "버튼이 클릭됐어요"
//                }
//            }, onDisposed: { owner in
//                print("disposed")
//            })
//            .disposed(by: dispose)
        
        // 7.
//        button.rx.tap
//            .observe(on: MainScheduler.instance) // 메인쓰레드
//            .subscribe(with: self, onNext: { owner, _ in
//                owner.label.text = "버튼이 클릭됐어요"
//            }, onDisposed: { owner in
//                print("disposed")
//            })
//            .disposed(by: dispose)
        
        // 8. 한 번에 해달라 + 애초에 error 안 받는 거 없음?
//        button.rx.tap
//            .bind(with: self) { onwer, _ in
//                onwer.label.text = "버튼이 클릭됐어요"
//            }
//            .disposed(by: dispose)
        
        // ========================= 여기까지만 이해해도 됨! =========================
        
        // 9. Observable<String>
        button.rx.tap
            .map { "버튼을 클릭했어요" }
            .bind(to: label.rx.text)
            .disposed(by: dispose)
        
        // 퀴즈 subscribe???
//        label.rx.text
        
    }
}
