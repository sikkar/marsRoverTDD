//
//  ViewController.swift
//  MarsRoverTDD
//
//  Created by Angel on 22/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var entryTextField: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var mainButton: UIButton!

    var presenter = MarsRoverPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        entryTextField.delegate = self
        presenter.view = self
        presenter.viewIsReady()
    }

    @IBAction func mainButtonPressed(_ sender: Any) {
        presenter.mainButtonPressed()
    }

    @IBAction func textFieldChange(_ sender: UITextField) {
        presenter.commandHasChanged(command: sender.text ?? "")
    }

}

extension ViewController: MarsRoverView {

    func showStatus(status: String) {
        displayLabel.text = status
    }

    func clearCommands() {
        entryTextField.text = ""
    }

    func enableExecuteButton(_ enable: Bool) {
        mainButton.isEnabled = enable
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
//        let cadena = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
//        presenter.commandHasChanged(command: cadena)
        return true
    }

}
