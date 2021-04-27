//
//  DatePickerViewController.swift
//  CovidApp
//
//  Created by Diego Varangot on 25/4/21.
//

import FSCalendar

protocol DatePickerDelegate: class {
    func dateSelected(date: Date)
}

class DatePickerViewController: ViewController, FSCalendarDelegate, FSCalendarDataSource {
        
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    weak var delegate: DatePickerDelegate?
    
    private var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.scrollDirection = .horizontal
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0;
        calendarView.placeholderType = .none
        calendarView.appearance.weekdayTextColor = UIColor.Calendar.title
        calendarView.appearance.headerTitleColor = UIColor.Calendar.title
        calendarView.appearance.selectionColor = UIColor.Calendar.title
        calendarView.appearance.todayColor = UIColor.Calendar.today
        calendarView.appearance.todaySelectionColor = UIColor.Calendar.title
        
        cancelButton.apply(style: .secondary, title: localized("date_picker_cancel_button_title"))
        confirmButton.apply(style: .primary, title: localized("date_picker_confirm_button_title"))
    }
    
    // FSCalendarDataSource methods
    func maximumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date(year: 2020, month: 01, day: 22)
    }
    
    // Actions
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmAction(_ sender: Any) {
        if let selectedDate = calendarView.selectedDate {
            dismiss(animated: true) {
                self.delegate?.dateSelected(date: selectedDate)
            }
        }
    }
}
