//
//  ViewController.swift
//  clima-request
//
//  Created by Émerson M Luz on 24/11/22.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var grausLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    
    var weather = WeatherBrain()
    var city: String = ""
    var nightMode: Bool = false {
        didSet {
            if overrideUserInterfaceStyle == .light {
                overrideUserInterfaceStyle = .dark
            } else {
                overrideUserInterfaceStyle = .light
            }
        }
    }
    var isLoading: Bool = false {
        didSet {
            if isLoading {
                loadingView.isHidden = false
                loadingActivityIndicator.startAnimating()
            } else {
                loadingActivityIndicator.stopAnimating()
                loadingView.isHidden = true
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather.delegate = self
        searchTextField.delegate = self
        
        touchScreen()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func modeButtonClick(_ sender: UIButton) {
        if !(nightMode) {
            nightMode = true
        } else {
            nightMode = false
        }
    }
    
    
    @IBAction func searchButtonClick(_ sender: UIButton) {
        searchCity()
        searchTextField.endEditing(true)
    }
    
    func searchCity () {
        guard searchTextField.text != nil && searchTextField.text != "" else {
            searchTextField.placeholder = "Digite uma cidade"
            return }
        
        isLoading = true
        
        city = searchTextField.text!.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        
        weather.apiRequest(city: city)
    }
    
    func alert () {
        let alert = UIAlertController(title: nil, message: "Cidade não encontrada.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    @objc func dismissKeyboard () {
        searchTextField.endEditing(true)
    }
    
    func touchScreen () {
        let touch = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(touch)
    }
    
}

extension WeatherViewController: WeatherDelegate {
    func requestSuccess(weather: WeatherData) {
        DispatchQueue.main.async {
            self.grausLabel.text = String(Int(weather.main["temp"]!)) + " °C"
            self.cityLabel.text = (weather.name)
            self.isLoading = false
        }
    }
    
    func decoderError() {
        DispatchQueue.main.async {
            self.alert()
            self.isLoading = false
        }
    }
}

extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchCity()
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
