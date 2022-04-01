//
//  Constants.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 31/03/2022.
//

import Foundation
import UIKit

struct Constants {
    
    enum CharacterList {
        
        static let cellId = "CharacterListCollectionViewCell"
    }
    
    enum CharacterDetail {
        
        static let doneButtonTitle = "Done"
        static let doneButtonColor = UIColor(red: 138/255, green: 103/255, blue: 190/255, alpha: 1)
        static let tableViewCellId = "UITableViewCell"
        static let dropDownTitleText = "Episodes"
    }
    
    enum AlertView {
        
        static let title = "Error"
        static let dismissButtonTitle = "Dismiss"
    }
    
    enum DropDownButton {
        
        static let backgroundColor = UIColor(red: 28/255, green: 30/255, blue: 31/255, alpha: 1)
        static let dropDownMenuOpenedArrowImage = "drop_down_menu_opened_arrow"
        static let dropDownMenuClosedArrowImage = "drop_down_menu_closed_arrow"
    }
    
    enum PlaceholderImage {
        
        static let name = "placeholder_image"
    }
}
