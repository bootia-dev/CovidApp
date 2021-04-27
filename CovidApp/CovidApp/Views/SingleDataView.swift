//
//  SingleDataView.swift
//  CovidApp
//
//  Created by Diego Varangot on 25/4/21.
//

import UIKit

enum SingleDataViewStyle {
    case filter, confirmed, death, recovered
    
    var titleFont: UIFont {
        switch self {
        case .filter: return UIFont.Labels.title1
        default: return UIFont.Labels.title2
        }
    }
    
    var titleColor: UIColor {
        return UIColor.Labels.title1
    }
    
    var valueFont: UIFont {
        return UIFont.Labels.value1
    }
    
    var valueColor: UIColor {
        switch self {
        case .filter: return UIColor.Labels.title1
        case .confirmed: return UIColor.SingleDataView.confirmedValue
        case .death: return UIColor.SingleDataView.deathValue
        case .recovered: return UIColor.SingleDataView.recoveredValue
        }
    }
    
    var background: UIColor {
        switch self {
        case .filter: return UIColor.SingleDataView.filterBackground
        default: return UIColor.SingleDataView.valueBackground
        }
    }
}

class SingleDataView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    var tapAction: () -> () = {}

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
        Bundle.main.loadNibNamed(SingleDataView.className, owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.roundCorners()
        apply(style: .filter)
        
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
    }
    
    @objc func tap() {
        tapAction()
    }
    
    func apply(style: SingleDataViewStyle) {
        contentView.backgroundColor = style.background
        titleLabel.textColor = style.titleColor
        valueLabel.textColor = style.valueColor
        titleLabel.font = style.titleFont
        valueLabel.font = style.valueFont
    }
    
    func setData(title: String? = nil, value: String? = nil) {
        if let text = title {
            titleLabel.text = text
        }
        
        if let text = value {
            valueLabel.text = text
        }
    }
}
