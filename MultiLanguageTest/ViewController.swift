//
//  ViewController.swift
//  MultiLanguageTest
//
//  Created by Vedat Ozlu on 17.02.2024.
//

import UIKit

let LocalizeUserDefaultKey = "LocalizeUserDefaultKey"
var LocalizeDefaultLanguage = "en"

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        LocalizeDefaultLanguage = UserDefaults.standard.string(forKey: LocalizeUserDefaultKey) ?? "en"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshLanguage()
    }
    
    private func refreshLanguage() {
        testLabel.text = "message".translated()
    }

    @IBAction func turkishButtonTapped(_ sender: Any) {
        LocalizeDefaultLanguage = "tr"
        UserDefaults.standard.setValue(LocalizeDefaultLanguage, forKey: LocalizeUserDefaultKey)
        refreshLanguage()
    }
    
    @IBAction func englishButtonTapped(_ sender: Any) {
        LocalizeDefaultLanguage = "en"
        UserDefaults.standard.setValue(LocalizeDefaultLanguage, forKey: LocalizeUserDefaultKey)
        refreshLanguage()
    }
}

extension String {
    func translated() -> String {
        if let path = Bundle.main.path(forResource: LocalizeDefaultLanguage, ofType: "lproj"), let bundle = Bundle(path: path) {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        
        return ""
    }
}
