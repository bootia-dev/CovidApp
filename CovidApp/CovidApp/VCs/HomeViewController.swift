//
//  ViewController.swift
//  CovidApp
//
//  Created by Diego Varangot on 22/4/21.
//

import UIKit
import ADCountryPicker

class HomeViewController: ViewController, DatePickerDelegate, ADCountryPickerDelegate {

    @IBOutlet weak var locationView: SingleDataView!
    @IBOutlet weak var fromDateView: SingleDataView!
    @IBOutlet weak var toDateView: SingleDataView!
    @IBOutlet weak var resultView: ResultView!
    
    private var locationCode: String?
    private var fromDate: Date?
    private var toDate: Date?
    private var currentDatePicker: SingleDataView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        screenTitle = localized("home_screen_title")
        locationView.setData(title: localized("home_location_title"), value: localized("home_location_none"))
        locationView.tapAction = { [weak self] in
            self?.showCountryPicker()
        }
        fromDateView.setData(title: localized("home_from_date_title"))
        fromDateView.tapAction = { [weak self] in
            self?.currentDatePicker = self?.fromDateView
            self?.performSegue(withIdentifier: "pickDate", sender: nil)
        }
        toDateView.setData(title: localized("home_to_date_title"))
        toDateView.tapAction = { [weak self] in
            self?.currentDatePicker = self?.toDateView
            self?.performSegue(withIdentifier: "pickDate", sender: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ApiClient.shared.global.latest { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.resultView.setData(result: response.result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DatePickerViewController {
            vc.delegate = self
        }
    }
    
    // UI methods
    private func showCountryPicker() {
        let picker = ADCountryPicker()
        let pickerNavigationController = NavigationController(rootViewController: picker)
        
        /// delegate
        picker.delegate = self

        /// Optionally, set this to display the country calling codes after the names
        picker.showCallingCodes = false

        /// Flag to indicate whether country flags should be shown on the picker. Defaults to true
        picker.showFlags = true
            
        /// The nav bar title to show on picker view
        picker.pickerTitle = "Select a Location"
            
        /// The default current location, if region cannot be determined. Defaults to US
        picker.defaultCountryCode = "US"

        /// Flag to indicate whether the defaultCountryCode should be used even if region can be deteremined. Defaults to false
        picker.forceDefaultCountryCode = false

        /// The text color of the alphabet scrollbar. Defaults to black
        picker.alphabetScrollBarTintColor = UIColor.black
            
        /// The background color of the alphabet scrollar. Default to clear color
        picker.alphabetScrollBarBackgroundColor = UIColor.clear
            
        /// The tint color of the close icon in presented pickers. Defaults to black
        picker.closeButtonTintColor = UIColor.white
            
        /// The font of the country name list
        picker.font = UIFont(name: "Helvetica Neue", size: 15)
            
        /// The height of the flags shown. Default to 40px
        picker.flagHeight = 30
            
        /// Flag to indicate if the navigation bar should be hidden when search becomes active. Defaults to true
        picker.hidesNavigationBarWhenPresentingSearch = false
            
        /// The background color of the searchbar. Defaults to lightGray
        picker.searchBarBackgroundColor = UIColor.lightGray
        
        present(pickerNavigationController, animated: true, completion: nil)
    }
    
    // DatePickerDelegate methods
    func dateSelected(date: Date) {
        currentDatePicker?.setData(value: date.shortToString())
    }
    
    // ADCountryPickerDelegate methods
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String) {
        picker.dismiss(animated: true) { [weak self] in
            self?.locationView.setData(value: name)
        }
    }

    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
            print(dialCode)
    }
}

