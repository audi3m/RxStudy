//
//  ViewController.swift
//  RxStudy
//
//  Created by J Oh on 7/30/24.
//

import UIKit
import RxSwift
import SnapKit
import RxCocoa

final class ViewController: UIViewController {
    
    let tableView = UITableView()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .systemGray4
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        // Observable: 이벤트 전달.
        // just 그대로 다 보내주세요
        let items = Observable.just([
            "First Item",
            "Second Item",
            "Third Item"
        ])
        
        // Observer: 테이블뷰에 데이터를 보여주는 형태로 이벤트 처리
        // 그나마 colosure 구문이 observer
        // bind == subscribe
        items
            .take(1)
            .bind(to: tableView.rx.items) { (tableView, row, element) in    // cellForRowAt
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = "\(element) @ row \(row)"
                return cell
            }
            .disposed(by: disposeBag) // 구독 취소
        
        //        tableView.rx.itemSelected
        //            .bind { value in
        //                print("\(value)가 선택되었어요")
        //            }
        //            .disposed(by: disposeBag)
        //        
        //        tableView.rx.modelDeselected(String.self)
        //            .bind { value in
        //                print("\(value)가 선택되었어요")
        //            }
        
        Observable.zip(tableView.rx.itemSelected,
                       tableView.rx.modelSelected(String.self))
        .bind { value in
            print(value.0, value.1)
        }
        .disposed(by: disposeBag)
        
    }
                       
    
    // next: [1, 2, 3]
    private func testJust() {
        Observable.just([1,2,3]) // Finite Observable Sequence
            .subscribe { value in
                print("next: \(value)")
            } onError: { error in
                print(error)
            } onCompleted: {
                print("complete")
            } onDisposed: { // 이벤트는 아님
                print("dispose")
            }
            .disposed(by: disposeBag)
    }
    
    // next: 1, next: 2, next: 3
    private func testFrom() {
        Observable.from([1,2,3])    // Finite
            .subscribe { value in
                print("next: \(value)")
            } onError: { error in
                print(error)
            } onCompleted: {
                print("complete")
            } onDisposed: {
                print("dispose")
            }
            .disposed(by: disposeBag)
    }
    
    private func testInterval() {
        // Infinite. 계속 동작함
        Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe { value in
                print("next: \(value)")
            } onError: { error in
                print(error)
            } onCompleted: {
                print("complete")
            } onDisposed: {
                print("dispose")
            }
            .disposed(by: disposeBag)
    }
}

