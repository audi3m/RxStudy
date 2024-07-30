//
//  PickerViewController.swift
//  RxStudy
//
//  Created by J Oh on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class PickerViewController: UIViewController {
    
    private let pickerView = UIPickerView()
    private let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(pickerView)
        pickerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        Observable.just(["PickerView", "TableView", "Switch", "TextField", "Button"])
            .bind(to: pickerView.rx.itemTitles) { _, item in
                "\(item)"
            }
            .disposed(by: dispose)
    }
}
