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
    var isLoading: Bool! {
        didSet {
            if isLoading {
                loadingView.isHidden = false
                loadingActivityIndicator.startAnimating()
            } else {
                loadingView.isHidden = true
                loadingActivityIndicator.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoading = false
        
        weather.delegate = self
        searchTextField.delegate = self
        // Do any additional setup after loading the view.
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
        print("Dados não encontrados")
        isLoading = false
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
