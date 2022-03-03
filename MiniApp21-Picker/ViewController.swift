//
//  ViewController.swift
//  MiniApp21-Picker
//
//  Created by 前田航汰 on 2022/03/03.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet private weak var textField: UITextField!
    let list = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    var pickerView: UIPickerView = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        picker()
    }

    func picker(){
        pickerView.delegate = self
        pickerView.dataSource = self

        // "Cancel", "Done"ボタンの作成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        toolbar.setItems([cancelItem, spaceItem, doneItem], animated: true)

        textField.inputView = pickerView
        textField.inputAccessoryView = toolbar

        // デフォルト値
        pickerView.selectRow(0, inComponent: 0, animated: false)
    }

    @objc func done() {
        textField.endEditing(true)
        textField.text = "\(list[pickerView.selectedRow(inComponent: 0)])進数"
    }

    @objc func cancel(){
        textField.endEditing(true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.endEditing(true)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(list[row])進数"
    }

}

