//
//  ViewController.swift
//  Test
//
//  Created by dryan on 11/9/20.
//

import UIKit

struct Constants {
    static let spanglishDefaultsKey = "spanglishDefaultsKey"
}

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggle: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        toggle.isOn = UserDefaults.standard.bool(forKey: Constants.spanglishDefaultsKey)
        updateLabelText()
    }

    func updateLabelText() {
        //This function returns the localized string value for the *key* that calles localized()
        label.text = "Hello_String".localized()
    }

    @IBAction func didToggleSwitch(_ sender: Any) {
        guard let toggleSwitch = sender as? UISwitch else { return }
        let state = toggleSwitch.isOn
        UserDefaults.standard.set(state, forKey: Constants.spanglishDefaultsKey)
        updateLabelText()
    }

}

//This would normally be in its own file
extension String {
    func localized() -> String {
        let spanglishEnabled = UserDefaults.standard.bool(forKey: Constants.spanglishDefaultsKey)
        if spanglishEnabled {
            //This overrides the preferred langauge and gets all string values from Spanglish.strings
            let spanglishText = NSLocalizedString("Hello_String", tableName: "Spanglish", bundle: Bundle.main, value: "", comment: "")
            return spanglishText
        } else {
            //This uses the default localized strings based on the app's prefered langauge setting and reads from Localizable.strings
            let localizedText = NSLocalizedString("Hello_String", comment: "")
            return localizedText
        }
    }
}
