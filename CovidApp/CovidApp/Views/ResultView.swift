//
//  ResultView.swift
//  CovidApp
//
//  Created by Diego Varangot on 25/4/21.
//

import UIKit

class ResultView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var confirmedView: SingleDataView!
    @IBOutlet weak var deathsView: SingleDataView!
    @IBOutlet weak var recoveredView: SingleDataView!

    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(ResultView.className, owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.roundCorners()
        confirmedView.setData(title: localized("single_view_confirmed_title"), value: localized("single_view_no_value"))
        confirmedView.apply(style: .confirmed)
        deathsView.setData(title: localized("single_view_deaths_title"), value: localized("single_view_no_value"))
        deathsView.apply(style: .death)
        recoveredView.setData(title: localized("single_view_recovered_title"), value: localized("single_view_no_value"))
        recoveredView.apply(style: .recovered)
    }
    
    func setData(result: GlobalResult) {
        confirmedView.setData(value: result.confirmed.toAmountFormat())
        deathsView.setData(value: result.deaths.toAmountFormat())
        recoveredView.setData(value: result.recovered.toAmountFormat())
    }
}

