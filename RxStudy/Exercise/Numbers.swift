//
//  Numbers.swift
//  RxStudy
//
//  Created by J Oh on 8/1/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class Numbers: UIViewController {
    
    var disposeBag = DisposeBag()
    
    private let number1 = UITextField()
    private let number2 = UITextField()
    private let number3 = UITextField()
    private let plusLabel = UILabel()
    private let barView = UIView()
    private let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Numbers"
        configureView()
        
        Observable
            .combineLatest(number1.rx.text.orEmpty, number2.rx.text.orEmpty, number3.rx.text.orEmpty) { (value1, value2, value3) -> Int in
                return (Int(value1) ?? 0) + (Int(value2) ?? 0) + (Int(value3) ?? 0)
            }
            .map { $0.description }
            .bind(to: resultLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    private func configureView() {
        view.backgroundColor = .white
        view.addSubview(number1)
        view.addSubview(number2)
        view.addSubview(number3)
        view.addSubview(plusLabel)
        view.addSubview(barView)
        view.addSubview(resultLabel)
        
        number1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.centerX.equalTo(view)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        number2.snp.makeConstraints { make in
            make.top.equalTo(number1.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        number3.snp.makeConstraints { make in
            make.top.equalTo(number2.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        plusLabel.snp.makeConstraints { make in
            make.trailing.equalTo(number3.snp.leading).offset(-10)
            make.centerY.equalTo(number3.snp.centerY)
        }
        
        barView.snp.makeConstraints { make in
            make.leading.equalTo(plusLabel.snp.leading)
            make.trailing.equalTo(number1.snp.trailing)
            make.top.equalTo(number3.snp.bottom).offset(10)
            make.height.equalTo(1)
            
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(barView.snp.bottom).offset(10)
            make.trailing.equalTo(number1.snp.trailing)
            make.height.equalTo(30)
        }
        
        number1.borderStyle = .roundedRect
        number1.textAlignment = .right
        number1.keyboardType = .numberPad
        number2.borderStyle = .roundedRect
        number2.textAlignment = .right
        number2.keyboardType = .numberPad
        number3.borderStyle = .roundedRect
        number3.textAlignment = .right
        number3.keyboardType = .numberPad
        
        plusLabel.text = "+"
        barView.backgroundColor = .black
        
        resultLabel.textAlignment = .right
        
        
        
    }
    
}
