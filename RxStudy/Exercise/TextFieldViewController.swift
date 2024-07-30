//
//  TextFieldViewController.swift
//  RxStudy
//
//  Created by J Oh on 7/31/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class TextFieldViewController: UIViewController {
    
    private let dispose = DisposeBag()
    
    private let textField = UITextField()
    private let label = UILabel()
    private let button = UIButton()
    private let switcher = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(switcher)
        
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(44)
        }
        
        switcher.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(button.snp.bottom).offset(30)
        }
        
        textField.backgroundColor = .lightGray
        label.backgroundColor = .cyan
        button.setTitle("버튼", for: .normal)
        button.backgroundColor = .brown
        
        let userValid = textField.rx.text.orEmpty
            .map { $0.count >= 5 }
            .share(replay: 1)
        
//        userValid.bind(to: <#T##Bool...##Bool#>)
        
    }
    
    
    
    
}
