//
//  UIColor+CA.swift
//  Bootia
//
//  Created by Diego Varangot on 24/4/21.
//

import UIKit

extension UIColor {
    struct NavigationBar {
        static let background = Pallette.primary
        static let title = Pallette.regular2
        static let shadow = Pallette.regular1
    }
    
    struct Labels {
        static let title1 = Pallette.regular2
        static let value1 = Pallette.primary
    }
    
    struct SingleDataView {
        static let filterBackground = Pallette.regular1
        static let valueBackground = Pallette.primary
        static let confirmedValue = Pallette.regular4
        static let deathValue = Pallette.regular3
        static let recoveredValue = Pallette.regular5
    }
    
    struct Calendar {
        static let title = Pallette.primary
        static let selected = Pallette.primary
        static let today = Pallette.regular1
    }

    struct TabBar {
        static let tint = UIColor.black
        static let itemOn = Pallette.primary
        static let itemOff = Pallette.regular2
    }

    struct Buttons {
        static let primaryTitle = UIColor.white
        static let primaryBackground = Pallette.primary
        static let secondaryTitle = Pallette.primary
        static let secondaryBackground = UIColor.white
        static let showHideTitle = UIColor.white
        static let showHideBackground = Pallette.regular1
    }

    struct Social {
        static let facebook = Pallette.facebook
        static let google = Pallette.google
        static let apple = UIColor.black
    }
}
